package kr.donghun.controller;



import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.donghun.domain.Criteria;
import kr.donghun.domain.ReplyPageDTO;
import kr.donghun.domain.ReplyVO;
import kr.donghun.service.ReplyService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies/")
@RestController
@Log4j
@AllArgsConstructor
public class ReplyController {
	private ReplyService service;
	
	//댓글 추가
	@PostMapping(value = "/new", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestParam("replytext") String replytext,
	                                     @RequestParam("postid") int postid,
	                                     @RequestParam("post_type") String post_type,
	                                     @RequestParam("email") String email) {
	    ReplyVO vo = new ReplyVO();
	    vo.setReplytext(replytext);
	    vo.setPostid(postid);
	    vo.setPost_type(post_type);
	    vo.setEmail(email);

	    log.info("ReplyVO : " + vo);
	    int insertCount = service.register(vo);
	    log.info("Reply INSERT COUNT : " + insertCount);
	    return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PostMapping(value = "/renew", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> recreate(@RequestBody ReplyVO vo){
		log.info("ReplyVO : "+vo);
		int insertCount = service.reregister(vo);
		log.info("Reply INSERT COUNT : "+insertCount);
		
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
		//삭제
		@DeleteMapping(value = "/{replyid}",produces = {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> remove(@PathVariable("replyid")int replyid){
			log.info("remove : "+replyid);
			
			int removeCount = service.remove(replyid);
			return removeCount ==1 ? new ResponseEntity<>("success",HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},value = "/{replyid}",consumes ="application/json",produces = {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String>modify(@RequestBody ReplyVO vo, @PathVariable("replyid") int replyid){
			vo.setReplyid(replyid);
			log.info("rno : "+replyid);
			log.info("modify ... : "+vo);
		
			return service.modify(vo) ==1 ? new ResponseEntity<>("success",HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		//댓글 페이징 기능까지 포함한 보기
		@GetMapping(value="/pages/{post_type}/{postid}/{page}",produces= {MediaType.APPLICATION_XML_VALUE,MediaType.APPLICATION_JSON_UTF8_VALUE})
		public ResponseEntity<ReplyPageDTO> getList(@PathVariable("page")int page, @PathVariable("postid")int postid,@PathVariable("post_type")String post_type){
			Criteria cri = new Criteria(page,10);
			log.info("get reply list postid + post_type .... : "+post_type+postid);
			service.getList(post_type, postid);
			return new ResponseEntity<>(service.getListPage(cri,postid, post_type),HttpStatus.OK);
		}
		
//		@GetMapping(value = "/{post_type}/{postid}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
//		public ResponseEntity<List<ReplyVO>> get(@PathVariable("postid") int postid, @PathVariable("post_type") String post_type) {
//		    log.info("get .... : " + postid + post_type);
//		    List<ReplyVO> replyList = service.getList(post_type, postid);
//		    return new ResponseEntity<>(replyList, HttpStatus.OK);
//		}
		
		//조회(하나 보기)
		@GetMapping(value ="one/{post_type}/{replyid}",produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
		public ResponseEntity<ReplyVO>getListOne(@PathVariable("replyid")int replyid,@PathVariable("post_type")String post_type){
			log.info("get .... : "+replyid+post_type);
			return new ResponseEntity<>(service.getOne(post_type, replyid),HttpStatus.OK);
		}
		
		
		
}
