package kr.donghun.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access denide : "+auth);
		
		model.addAttribute("msg","Access Denied");
	}
	
	@GetMapping("/customLogin")
	public void loginInput(String error, String logout, Model model) {
		log.info("error : "+error);
		log.info("logout : "+logout);
		
		if(error!=null) {
			model.addAttribute("error","로그인 에러, 정보를 확인하세요.");
		}
		
		if(logout!=null) {
			model.addAttribute("logout","로그아웃 하셨습니다.");
		}
	}
	
	@GetMapping("/customLogout")
	public void logout() {
		log.info("커스텀 로그아웃 ");
	}
	
	@PostMapping("/customLogout")
	public void logoutPOST() {
		log.info("포스트 커스텀 로그아웃");
	}
	
}
