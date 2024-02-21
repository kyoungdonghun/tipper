package kr.donghun.mapper;

import org.apache.ibatis.annotations.Param;

import kr.donghun.domain.LikesVO;

public interface LikesMapper {
		//create(plus)
		public int insert(LikesVO likesvo);
		
		//delete(minus)
		public int delete(@Param("likeid")int likeid,@Param("post_type")String post_type,@Param("postid")int postid);
		
		public LikesVO read(@Param("email")String email, @Param("postid")int postid);
}
