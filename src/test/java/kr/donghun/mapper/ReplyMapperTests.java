package kr.donghun.mapper;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import kr.donghun.domain.Criteria;
import kr.donghun.domain.ReplyVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {
	@Setter(onMethod_ = @Autowired )
	private ReplyMapper rm;
	
	
	@Test
	public void testList() {
		Criteria cri = new Criteria();
		List<ReplyVO> replies = rm.getListWithPaging(cri, 117,"COMUNITY");
		
		replies.forEach(reply -> log.info(reply));
	}
	
	//@Test
	public void testMapper() {
		log.info(rm);
	}
	
	//@Test
		public void testInsert() throws Exception {//C
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
			Date date = dateFormat.parse("1991.01.01");
			
			ReplyVO board = new ReplyVO();
			board.setEmail("test2");
			board.setPostid(14);
			board.setReplytext("test4");
			board.setPost_type("COMUNITY");
			
			
			rm.insert(board);
			
			log.info(board);
		}
			
		//@Test
		public void testRead() {//R
			rm.getList("COMUNITY", 14);
			log.info(rm.getList("COMUNITY", 14));
		}
		
//		@Test
		public void testReadOne() {//R O
			rm.getListOne("COMUNITY", 1);
			log.info(rm.getListOne("COMUNITY", 1));
			
		}
		
//		@Test 
		public void testUpdate() throws ParseException {//U info
			
			ReplyVO board = new ReplyVO();
			board.setReplytext("수 정됨씨");
			board.setReplyid(1);
			
			log.info("UPDATE COUNT : " + rm.update(board));
			
		}
		
		
//		@Test
		public void testDelete() {//D
			rm.delete(1);
			log.info("UPDATE COUNT : " + rm.delete(1));
		}
	
}
