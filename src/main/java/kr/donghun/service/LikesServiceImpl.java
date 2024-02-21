package kr.donghun.service;

import org.springframework.stereotype.Service;

import kr.donghun.domain.LikesVO;
import kr.donghun.mapper.LikesMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class LikesServiceImpl implements LikesService {

	private LikesMapper likesmapper;
	
	@Override
	public int register(LikesVO likesvo) {
		log.info(">>>>>register"+likesvo);
		String email= likesvo.getEmail();
		int postid =likesvo.getPostid();
		System.out.println("ddddd"+email+postid);
		
		if(likesmapper.read(email, postid) != null) {
			LikesVO vo =likesmapper.read(email, postid);
			System.out.println("이미 좋아요 한 관계로 좋아요 삭제");
			likesmapper.delete(vo.getLikeid(), "COMUNITY", vo.getPostid());
			return 2;
		}else {
			System.out.println("좋아요 안했으니까 좋아요 추가");
			likesmapper.insert(likesvo);
			return 1;
		}
	}
	
	public LikesVO read(String email, int postid) {
		log.info(">>>>>read"+email+postid);
		LikesVO vo = likesmapper.read(email, postid);
		
		return vo; 
		
	}

	@Override
	public int remove(int likeid, String post_type, int postid) {
		log.info(">>>>>delete"+likeid+post_type+postid);
		return likesmapper.delete(likeid,  post_type,  postid);
	}
	
}
