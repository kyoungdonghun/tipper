package kr.donghun.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.donghun.domain.AttachFileDTO;
import kr.donghun.domain.ComunityVO;
import kr.donghun.domain.Criteria;
import kr.donghun.domain.PageDTO;
import kr.donghun.service.ComunityService;
import kr.donghun.service.LostArkService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/comunity/*")
@AllArgsConstructor
public class ComunityController {
	private ComunityService service;
	private LostArkService lostArkService;
	
	@GetMapping("/list")
	public void list(Criteria cri,Model model) {
		log.info(model);
		model.addAttribute("list",service.getList(cri));
		int total = service.getTotal(cri);
		model.addAttribute("total",total);
		log.info("total : " + total);
		model.addAttribute("pageMaker",new PageDTO(cri,total));
		model.addAttribute("eventlist", lostArkService.getEventList());
	}
	
	@GetMapping("/listview")
	public void listView(Criteria cri,Model model) {
		log.info(model);
		model.addAttribute("list",service.getListView(cri));
		int total = service.getTotal(cri);
		model.addAttribute("total",total);
		log.info("total : " + total);
		model.addAttribute("pageMaker",new PageDTO(cri,total));
	}
	
	@GetMapping("/listlikes")
	public void listLikes(Criteria cri,Model model) {
		log.info(model);
		model.addAttribute("list",service.getListLikes(cri));
		int total = service.getTotal(cri);
		model.addAttribute("total",total);
		log.info("total : " + total);
		model.addAttribute("pageMaker",new PageDTO(cri,total));
	}
	
	@GetMapping("/listreply")
	public void listReply(Criteria cri,Model model) {
		log.info(model);
		model.addAttribute("list",service.getListReply(cri));
		int total = service.getTotal(cri);
		model.addAttribute("total",total);
		log.info("total : " + total);
		model.addAttribute("pageMaker",new PageDTO(cri,total));
	}
	
	
	@GetMapping("/insert")
	@PreAuthorize("isAuthenticated()")
	public void register() {
		log.info("====등록화면");
	}
	
	
	@PostMapping("/insert")
	@PreAuthorize("isAuthenticated()")
	public String register(ComunityVO board, RedirectAttributes rttr) {
		log.info("==등록 정보 -====");
		log.info("register : "+board);
		
		if(board.getAttachList()!= null) {
			board.getAttachList().forEach(attach -> log.info(attach));
		}
		log.info("==여기까지가 등록 정보 -====");
		service.register(board);
		rttr.addFlashAttribute("result",board.getTitle());
		
		return "redirect:/comunity/list";
	}
	
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("comunitynumber") long comunitynumber,@ModelAttribute("cri")Criteria cri ,Model model) {
		log.info("/get or modify");
		model.addAttribute("listone",service.get(comunitynumber));
	}
	
	@PostMapping("/modify")
	public String modify(ComunityVO board,@ModelAttribute("cri")Criteria cri, RedirectAttributes rttr) {
		System.out.println("수정하기 컨트롤러");
		log.info("modify@@@@@@ " + board);
		if(service.modify(board)) {
			rttr.addFlashAttribute("result","success");
		}
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		return "redirect:/comunity/list";
	}
	
	@GetMapping("/remove")
	public String remove(@RequestParam("comunitynumber")long comunitynumber,@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("remove@@@@" + comunitynumber);
		
		List<AttachFileDTO> attachList = service.getAttachList((int)comunitynumber, "COMUNITY");
		
		
		if(service.remove(comunitynumber)){
			deleteFiles(attachList);
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/comunity/list"+cri.getListLink();
	}
	
	@GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachFileDTO>> getAttachList(int comunitynumber,String post_type){
		log.info("get attach list : "+comunitynumber);
		log.info("get attach list : "+post_type);
		return new ResponseEntity<>(service.getAttachList(comunitynumber,post_type),HttpStatus.OK);
	}
	
	
	private void deleteFiles(List<AttachFileDTO> attachList) {
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		
		log.info("=================첨부 파일 삭제 : ================");
		log.info(attachList);
		
		attachList.forEach(attach -> {
			try {
				Path file = Paths.get("/Users/kyoung/myUpload/"+attach.getUploadPath()
				+"/"+attach.getUuid()+"_"+attach.getFileName());
				
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					
					Path thumbNail = Paths.get("/Users/kyoung/myUpload/"+attach.getUploadPath()
				+"/s_"+attach.getUuid()+"_"+attach.getFileName());
					
					Files.delete(thumbNail);
				}
			} catch (Exception e) {
				log.error("delete file error" + e.getMessage());
			}
		});
	}
}
