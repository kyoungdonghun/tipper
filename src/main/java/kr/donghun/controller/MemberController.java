package kr.donghun.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.donghun.domain.MemberVO;
import kr.donghun.service.MemberService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {
	private MemberService service;
	
	@GetMapping({"/login","/logout"})
	public void log(Model model) {
		// 로그인 버튼을 눌렀을때 로그인 화면만 띄우는 화면.
		log.info("login or logout request ======");
	}
	
	@PostMapping("/logout")
	public String logout(HttpSession session, RedirectAttributes rttr) {
		//만약에 주소창에 로그아웃을 때려넣어서(부적절한 접근)접근하게되면 어떻게 관리해야할까 또한 한번즘 생각해보자.
		log.info("logout request =====");
		session.removeAttribute("login_member");
		rttr.addFlashAttribute("result","로그아웃하셨습니다.");
		return "redirect:/member/login";
	}
	
	@PostMapping("/login")
	public String login(@RequestParam("email")String email,@RequestParam("password")String password, RedirectAttributes rttr,HttpSession session) {
		log.info("login request =====");
		if(service.login(email, password)==true) {
			session.setAttribute("login_member", email);
			log.info("login_success_update : "+email);
			rttr.addFlashAttribute("result","로그인 성공, 환영합니다.");
			return "redirect:/메인페이지";
		}else {
			rttr.addFlashAttribute("result","로그인 실패, 없는 아이디거나 입력을 확인하세요.");
			return "redirect:/다시로그인페이지";
		}
	}
	
	@GetMapping({"/findid","/findpw"})
	public void find(Model model) {
		//정보 찾기 버튼을 눌렀을때 창을 띄우기만 하는 화면
		log.info("find id or pw request ==========");
	}
	
	@PostMapping("/findid")
	public String findid(@RequestParam("phonenumber")String phonenumber,RedirectAttributes rttr) {
		log.info("findid request ====");
		String findid = service.findid(phonenumber);
		if(findid!=null) {
			rttr.addFlashAttribute("result",findid);
			return "redirect:/member/findresult";
		}else {
			rttr.addFlashAttribute("result","일치하는 정보가 없습니다. 정보를 다시 확인해주세요.");
			return "redirect:/member/findid";
		}
	}
	
	@GetMapping("/findresult")
	public void findresult(Model model) {
		log.info("find result");
	}
	
	@GetMapping("/list")
	public void list(Model model) {//일반사용자는 필요없다 이거.
		log.info(model);
		model.addAttribute("list",service.getList());
	}
	
	@GetMapping("/insert")
	public void register(Model model) {
		log.info("insert VIEW request ====");
	}
	
	@Transactional
	@PostMapping("/insert")
	public String registerpush(MemberVO board, RedirectAttributes rttr) {
		log.info("insert request ====="+board);
		System.out.println("회원가입 컨트롤러 진입.");
		System.out.println(board.getEmail()+"입력한 정보 ( 이메일 ) ");
		service.register(board);
		service.registerAuth(board.getEmail());
		rttr.addFlashAttribute("result","회원가입 되었습니다.");
		return "redirect:../customLogin";
	}
	
	@GetMapping({"/get","/modify","passwordmodify"})
	public void get(@RequestParam("email") String email, Model model) {
		log.info("/get or modify");
		log.info(service.get(email));
		
		
		model.addAttribute("listone",service.get(email));
	}
	
	@PostMapping("/modify")
	public String modify(MemberVO board, RedirectAttributes rttr) {
		log.info("modify@@@@@@ " + board);
		if(service.modifyInfo(board)) {
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/member/get?email="+board.getEmail();
	}
	
	@PostMapping("/passwordmodify")
	public String passwordmodify(@RequestParam("email") String email,@RequestParam("password")String password, RedirectAttributes rttr) {
		log.info("modify@@@@@@ " + email+password);
		if(service.modifyPassword(email,password)) {
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/member/get?email="+email;
	}
	@PostMapping("/passwordmodify2")
	public String passwordmodify(@RequestParam("email") String email,@RequestParam("password")String password,@RequestParam("phonenumber")String phonenumber, RedirectAttributes rttr) {
		log.info("modify@@@@@@ 2" + email+password+phonenumber);
		if(service.modifyPassword2(email,password,phonenumber)) {
			rttr.addFlashAttribute("result","비밀번호가 변경되었습니다.");
		}
		return "redirect:/customLogin";
	}
	
	@PostMapping("/findpw")
	public String findpw(@RequestParam("email")String email,@RequestParam("phonenumber")String phonenumber, RedirectAttributes rttr) {
		log.info("findpw request ====");
		String findpw = service.findpw(email, phonenumber);
		if(findpw!=null) {
			rttr.addFlashAttribute("result","찾으신 비밀번호는 "+findpw+"입니다.");
			return "redirect:/member/login";
		}else {
			rttr.addFlashAttribute("result","일치하는 정보가 없습니다. 정보를 다시 확인해주세요.");
			return "redirect:/member/findpw";
		}
	}
	
	
	
	
	@PostMapping("/remove")
	public String remove(@RequestParam("email")String email,@RequestParam("password")String password, RedirectAttributes rttr) {
		log.info("remove@@@@" + email+password);
		if(service.remove(email,password)){
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/member/login";
	}
	
}
