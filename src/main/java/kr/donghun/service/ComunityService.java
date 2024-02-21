package kr.donghun.service;

import java.util.List;

import kr.donghun.domain.AttachFileDTO;
import kr.donghun.domain.ComunityVO;
import kr.donghun.domain.Criteria;


public interface ComunityService {
	//글 등
	public void register(ComunityVO comunityvo);
	//글 하나 보기
	public ComunityVO get(long comunitynumber);
	//글수정
	public boolean modify(ComunityVO comunityvo);
	//삭제
	public boolean remove(long comunitynumber);
	//글 리스트 출력
// 	public List<ComunityVO> getList();
	
	//글 페이징 리스트 출력
	public List<ComunityVO> getList(Criteria cri);
	public List<ComunityVO> getListView(Criteria cri);
	public List<ComunityVO> getListLikes(Criteria cri);
	public List<ComunityVO> getListReply(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	//이미지
	public List<AttachFileDTO> getAttachList(int comunitynumber,String post_type);
	
	public void addViewCount(int comunitynumber,String email);
}
