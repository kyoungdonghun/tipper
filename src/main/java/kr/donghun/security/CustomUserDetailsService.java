package kr.donghun.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.donghun.domain.MemberVO;
import kr.donghun.mapper.MemberMapper;
import kr.donghun.security.domain.CustomUser;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService{

	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		log.warn("Load User By userName : " + username);
		//userName means email
		MemberVO vo = memberMapper.read(username);
		
		log.warn("queried by user mapper : " + vo);
		
		return vo == null ? null : new CustomUser(vo);
	}
	
	
}
