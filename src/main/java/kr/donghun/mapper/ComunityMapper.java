package kr.donghun.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.donghun.domain.AttachFileDTO;
import kr.donghun.domain.ComunityVO;
import kr.donghun.domain.Criteria;

public interface ComunityMapper {
	
	//create
	public void insert(ComunityVO comunityvo);
	//readList
	public List<ComunityVO> getList();
	//readone
	public ComunityVO getOne(long comunitynumber);
	//update
	public int update(ComunityVO comunityvo);
	//delete
	public int delete(long comunitynumber);
	
	//readlist with paging
	public List<ComunityVO> getListWithPaging(Criteria cri);
	public List<ComunityVO> getListWithPagingView(Criteria cri);
	public List<ComunityVO> getListWithPagingLikes(Criteria cri);
	public List<ComunityVO> getListWithPagingReply(Criteria cri);
	
	
	
	public int getTotalCount(Criteria cri);
	
	public List<AttachFileDTO> findbyComunitynumber(int comunitynumber);
	
	public int addViewCount(@Param("comunitynumber")int comunitynumber,@Param("email")String email);
	
}
