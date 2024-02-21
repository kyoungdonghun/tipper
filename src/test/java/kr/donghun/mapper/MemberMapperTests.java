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

import kr.donghun.domain.MemberVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests {
	@Setter(onMethod_ = @Autowired )
	private MemberMapper mm;
	
	//@Test
	public void testMapper() {
		log.info(mm);
	}

	//@Test
	public void testInsert() throws Exception {//C
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
		Date date = dateFormat.parse("1991.01.01");
		
		MemberVO board = new MemberVO();
		board.setEmail("test2");
		board.setPassword("test2");
		board.setName("test2");
		board.setBirth(date);
		
		
		mm.insert(board);
		
		log.info(board);
	}
		
	//@Test
	public void testRead() {//R
		List<MemberVO> board = mm.list();
		log.info(board);
	}
	
	//@Test
	public void testReadOne() {//R O
		MemberVO board = mm.listOne("test");
		log.info(board);
		
	}
	
//	@Test 
	public void testUpdate() throws ParseException {//U info
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
		Date date = dateFormat.parse("1991.01.01");
		
		MemberVO board = new MemberVO();
		board.setAgegroup("20");
		board.setBirth(date);
		board.setName("test3");
		board.setEmail("test");
		
		int count = mm.infoUpdate(board);
		log.info("UPDATE COUNT : " + count);
		
	}
	
	@Test
	public void testUpdate2() throws ParseException {//U password
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
		Date date = dateFormat.parse("1991.01.01");
		
		mm.passwordUpdate("test","testtest");
		log.info("UPDATE COUNT : " + mm.passwordUpdate("test","testtest"));
		
	}
	
//	@Test
	public void testDelete() {//D
		log.info("DELETE COUNT : " + mm.delete("test","testtest"));
	}
	
	
}
