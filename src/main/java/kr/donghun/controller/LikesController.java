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
import org.springframework.web.bind.annotation.RestController;

import kr.donghun.domain.LikesVO;
import kr.donghun.service.LikesService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/likes/*")
@AllArgsConstructor
public class LikesController {
	private LikesService service;
	
	//좋아요 추가
	@PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody LikesVO likesvo){
		log.info("LikesVO : "+likesvo);
		int insertCount = service.register(likesvo);
		log.info("Reply INSERT COUNT : "+insertCount);
		
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : 
		       (insertCount == 2 ? new ResponseEntity<>("delete", HttpStatus.OK) : 
		    	   					new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR));
	}
	
	//삭제
	@DeleteMapping(value = "/{likeid}/{post_type}/{postid}",produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("likeid")int likeid,@PathVariable("post_type")String post_type,@PathVariable("postid")int postid){
		log.info("remove : "+likeid+post_type+postid);
		int deleteCount = service.remove(likeid, post_type, postid);
		log.info("야이거 뭐냐 ㅅㅂ : "+ deleteCount);
		return deleteCount ==1 ? new ResponseEntity<>("success",HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
}
