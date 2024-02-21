package kr.donghun.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.donghun.domain.AttachFileDTO;

public interface AttachFileMapper {
	
	public void insert(AttachFileDTO vo);
	
	public void delete(String uuid);
	
	public List<AttachFileDTO> findByComunitynumber(@Param("postid")int comunitynumber,@Param("post_type")String post_type);
	
	public void deleteAll(@Param("postid")int comunitynumber);
	
	public List<AttachFileDTO> getOldFiles();
}
