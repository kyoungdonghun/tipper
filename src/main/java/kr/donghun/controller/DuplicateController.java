package kr.donghun.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.donghun.service.MemberService;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/duplicate")
@Log4j
public class DuplicateController {
	
	@Setter(onMethod_ = @Autowired)
	private MemberService service;
	
	@GetMapping(value = "/getEmailResult", produces = MediaType.TEXT_PLAIN_VALUE + ";charset=UTF-8")
    public ResponseEntity<String> getEmail(@RequestParam String email) {
        log.info("MIME TYPE : " + MediaType.TEXT_PLAIN_VALUE);
        String result = String.valueOf(service.checkDuplicateEmail(email));
        return ResponseEntity.ok(result);
    }
	
	@GetMapping(value = "/getNicknameResult", produces = MediaType.TEXT_PLAIN_VALUE + ";charset=UTF-8")
	public ResponseEntity<String> getNickname(@RequestParam String nickname){
		log.info("MIME TYPE : " + MediaType.TEXT_PLAIN_VALUE);
		String result = String.valueOf(service.checkDuplicateNickname(nickname));
		return ResponseEntity.ok(result);
	}

}
