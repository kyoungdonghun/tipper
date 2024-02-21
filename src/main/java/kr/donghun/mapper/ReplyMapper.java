package kr.donghun.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.donghun.domain.Criteria;
import kr.donghun.domain.ReplyVO;

public interface ReplyMapper {
	//create
		public int insert(ReplyVO replyvo);
		
		public int reinsert(ReplyVO replyVO);
		
		//read
		public List<ReplyVO> getList(@Param("post_type")String posttype, @Param("postid")long postid);
		
		//read One
		public ReplyVO getListOne(@Param("post_type")String posttype, @Param("replyid")long replyid);
		
		//update
		public int update(ReplyVO replyvo);
		
		//delete
		public int delete(long replyid);
		
		//read with paging
		public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri,@Param("postid") int postid, @Param("post_type")String post_type);
		
		public int getCountByPostid(int postid);
}
