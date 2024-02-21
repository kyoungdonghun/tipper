package kr.donghun.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.donghun.domain.MemberDTO;
import kr.donghun.domain.MemberVO;

public interface MemberMapper {
		public MemberVO read(String userid);
	
	
		//create
		public void insert(MemberVO membervo);
		public void insertAuth(String email);
		//read (one)
		public MemberVO listOne(String email);
		//read(list)
		public List<MemberVO> list();
		//update(change member info)
		public int infoUpdate(MemberVO membervo);
		//update(change member password)
		public int passwordUpdate(@Param("email")String email,@Param("password")String password);
		public int passwordUpdate2(@Param("email")String email,@Param("password")String password, @Param("phonenumber")String phonenumber);
		//delete
		public int delete(@Param("email")String email,@Param("password")String password);
		
		public int checkEmail(String email);
		
		public int checkNickname(String nickname);
		
		//비밀번호 찾기
		public MemberVO findpw(@Param("email")String email, @Param("phonenumber")String phonenumber);
		
		//아이디 찾기
		public MemberVO findid(String email);
}
