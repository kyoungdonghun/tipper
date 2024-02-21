package kr.donghun.service;

import java.util.List;

import kr.donghun.domain.Criteria;
import kr.donghun.domain.ReplyPageDTO;
import kr.donghun.domain.ReplyVO;

public interface ReplyService {
	
	//insert
	public int register(ReplyVO replyvo);
	
	public int reregister(ReplyVO replyvo);
	
	//read list
	public List<ReplyVO> getList(String posttype, long postid);
	
	//read one
	public ReplyVO getOne(String posttype, long replyid);
	
	//update
	public int modify(ReplyVO replyvo);
	
	//delete
	public int remove(long replyid);
	
	//read with paging
	public ReplyPageDTO getListPage(Criteria cri, int postid, String post_type);

}
