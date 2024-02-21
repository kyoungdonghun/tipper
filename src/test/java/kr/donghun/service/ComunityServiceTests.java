package kr.donghun.service;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.donghun.domain.ComunityVO;
import kr.donghun.domain.Criteria;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ComunityServiceTests {

	@Setter(onMethod_ = @Autowired)
	private ComunityService service;
	
//	@Test
	public void testExist() {
		
		log.info("---------------" +service);
		assertNotNull(service);
	}
	
//	@Test
	//글 등록 	
	public void testRegister() {
		ComunityVO board = new ComunityVO();
		board.setTitle("테스트1");
		board.setWriter("test1");
		board.setComunitytext("test1");
		
		service.register(board);
		log.info(board);
	}
	
//	@Test
	//글 하나 보기
	public void testget() {
		ComunityVO board = service.get(14l);
		log.info(board);
		
	}
	
	//글수정
//	@Test
	public void modify( ) {
		ComunityVO board = new ComunityVO();
		board.setComunitynumber(14);
		board.setTitle("수정된 제목");
		board.setComunitytext("수정된 내용");
		
		service.modify(board);
	}
	//삭제
	public void remove( ) {
		
	}
	
//	@Test
	//글 리스트 출력
//	public void getList(){
//		List<ComunityVO> board = service.getList();
//		log.info(board);
//		
//		
//	}
	
//	@Test
	public void testGetTotal() {
		log.info("뷀부레부레부레 ㅈ던체 깻수 : "+service.getTotal(new Criteria(1,10)));
	}
	
	@Test
	public void testGetList() {
		Criteria cri = new Criteria();
		cri.setKeyword("1");
		cri.setPost_type("COMUNITY");
		
		List<ComunityVO> list = service.getList(cri);
		list.forEach(board -> log.info(board));
		
	}
	
}
