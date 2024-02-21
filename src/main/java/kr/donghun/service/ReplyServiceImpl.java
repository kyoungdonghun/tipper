package kr.donghun.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.donghun.domain.Criteria;
import kr.donghun.domain.ReplyPageDTO;
import kr.donghun.domain.ReplyVO;
import kr.donghun.mapper.ReplyMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService {
	
	private ReplyMapper replymapper;
	
	
	@Override
	public int register(ReplyVO replyvo) {
		log.info(">>>>>register"+replyvo);
		return replymapper.insert(replyvo);
	}

	@Override
	public List<ReplyVO> getList(String posttype, long postid) {
		log.info(">>>>>getList"+posttype+postid);
		return replymapper.getList(posttype,postid);
	}

	@Override
	public int modify(ReplyVO replyvo) {
		log.info(">>>>>update"+replyvo);
		return replymapper.update(replyvo);
	}

	@Override
	public int remove(long replyid) {
		log.info(">>>>>delete"+replyid);
		return replymapper.delete(replyid);
	}

	@Override
	public ReplyVO getOne(String posttype, long replyid) {
		log.info(">>>>>>getone"+posttype+replyid);
		return replymapper.getListOne(posttype, replyid);
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, int postid, String post_type) {
		return new ReplyPageDTO(replymapper.getCountByPostid(postid),
								replymapper.getListWithPaging(cri, postid, post_type));
	}

	@Override
	public int reregister(ReplyVO replyvo) {
		log.info(">>>>>register"+replyvo);
		return replymapper.reinsert(replyvo);
	}

}
