package kr.donghun.service;

import kr.donghun.domain.LikesVO;

public interface LikesService {
	
	//insert
	public int register(LikesVO likesvo);
	
	//delete
	public int remove(int likeid, String post_type, int postid);
	
	public LikesVO read(String email, int postid);
}
