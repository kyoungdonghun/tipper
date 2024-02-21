package kr.donghun.service;

import java.util.List;

import kr.donghun.domain.MemberVO;

public interface MemberService {
	
	//read one
	public MemberVO get(String membervo);
	//read list
	public List<MemberVO> getList();
	//insert
	public void register(MemberVO membervo);
	public void registerAuth(String email);
	//update info
	public boolean modifyInfo(MemberVO membervo);
	//update password
	public boolean modifyPassword(String email, String password);
	public boolean modifyPassword2(String email, String password,String phonenumber);
	//delete
	public boolean remove(String email, String password);
	//login
	public boolean login(String email, String password);
	//find id
	public String findid(String phonenumber);
	//find pw
	public String findpw(String email, String phonenumber);
	
	public int checkDuplicateEmail(String email);
	
	public int checkDuplicateNickname(String nickname);
	
}
