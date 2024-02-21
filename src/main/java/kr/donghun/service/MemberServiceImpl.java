package kr.donghun.service;

import java.util.List;

import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;

import kr.donghun.domain.MemberVO;
import kr.donghun.mapper.MemberMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	private MemberMapper membermapper;
	
	@Override
	public MemberVO get(String membervo) {
		log.info(">>>>>getOne"+membervo);
		return membermapper.listOne(membervo);
	}

	@Override
	public List<MemberVO> getList() {
		log.info(">>>>>getList");
		return membermapper.list();
	}

	@Override
	public void register(MemberVO membervo) {
		log.info(">>>>>register"+membervo);
		//사용자가 입력한 비밀번호 암호화. jbCrypt 사용
		String cryptPwd = BCrypt.hashpw(membervo.getPassword(), BCrypt.gensalt());
		membervo.setPassword(cryptPwd);
		
		membermapper.insert(membervo);
	}
	
	@Override
	public void registerAuth(String email) {
		log.info("-------------------- register Auth " + email + " --------------------");
		membermapper.insertAuth(email);
	}

	@Override
	public boolean modifyInfo(MemberVO membervo) {
		log.info(">>>>>infoupdate"+membervo);
		return membermapper.infoUpdate(membervo)==1;
	}

	@Override
	public boolean modifyPassword(String email, String password) {
		log.info(">>>>>passwordupdate"+email+password);
		String cryptPwd = BCrypt.hashpw(password, BCrypt.gensalt());
		return membermapper.passwordUpdate(email,cryptPwd) ==1 ;
	}

	@Override
	public boolean modifyPassword2(String email, String password, String phonenumber) {
		log.info(">>>>>passwordupdate"+email+password);
		String cryptPwd = BCrypt.hashpw(password, BCrypt.gensalt());
		return membermapper.passwordUpdate2(email,cryptPwd,phonenumber) ==1 ;
		
	}
	
	@Override
	public boolean remove(String email, String password) {
		log.info(">>>>>delete"+email+password);
		return membermapper.delete(email,password) ==1;
	}
	
	@Override
	public boolean login(String email,String password) {//
		log.info(">>>>>login"+email+password);
		MemberVO member = membermapper.read(email);
		String realpassword = member.getPassword();
		boolean isPasswordMatch = BCrypt.checkpw(password, realpassword);

        return isPasswordMatch; // 비밀번호 일치하면 인증 성공
    }

	@Override
	public String findid(String phonenumber) {// 매퍼에서VO 타입으로 받고 이후 이메일이 없으면 없는정보, 있으면 이메일 혹은 전화번호 리턴해서 그것만 주기
		log.info(">>>>>find id : "+phonenumber);
		MemberVO tmp = membermapper.findid(phonenumber);
		String email = tmp.getEmail();
		return email;
	}

	@Override
	public String findpw(String email, String phonenumber) {// 매퍼에서VO 타입으로 받고 이후 이메일이 없으면 없는정보, 있으면 이메일 혹은 전화번호 리턴해서 그것만 주기
		log.info(">>>>>find pw : "+email+phonenumber);
		MemberVO tmp = membermapper.findpw(email, phonenumber);
		String password = tmp.getPassword();
		return password;
	}

	@Override
	public int checkDuplicateEmail(String email) {
		log.info("-------------------- checkDuplicateEmail " + email + " --------------------");
		return membermapper.checkEmail(email);
	}

	@Override
	public int checkDuplicateNickname(String nickname) {
		log.info("-------------------- checkDuplicateNickname " + nickname + " --------------------");
		return membermapper.checkNickname(nickname);
	}

}
