package kr.donghun.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import kr.donghun.domain.LikesVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class LikesMapperTests {
	@Setter(onMethod_ = @Autowired )
	private LikesMapper lm;
	
//	@Test
	public void testMapper() {
		log.info(lm);
	}
	
	@Test
	public void testInsert() {//C
		LikesVO board = new LikesVO();
		board.setPostid(14);
		board.setEmail("test2");
		board.setPost_type("COMUNITY");
		
		
		lm.insert(board);
		
		log.info(board);
	}
		
	
//	@Test
	public void testDelete() {//D
		log.info("DELETE COUNT : " + lm.delete(8,"COMUNITY",14));
	}
}
