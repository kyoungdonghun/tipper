package kr.donghun.mapper;

import kr.donghun.domain.MemberDTO;

public interface MembersMapper {
	public MemberDTO read(String userid);
	
}
