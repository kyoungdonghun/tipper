package kr.donghun.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.donghun.domain.Criteria;
import kr.donghun.service.LostArkService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/lostark/*")
@AllArgsConstructor
public class LostArkController {
	private LostArkService lostArkService;
	
	@GetMapping("/get")
	public void get(@RequestParam("id") int id,Model model) {
		log.info("/get ");
		model.addAttribute("eventone",lostArkService.get(id));
	}
	
}
