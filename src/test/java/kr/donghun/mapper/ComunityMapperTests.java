package kr.donghun.mapper;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import kr.donghun.domain.ComunityVO;
import kr.donghun.domain.Criteria;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ComunityMapperTests {
	
	@Setter(onMethod_ = @Autowired )
	private ComunityMapper cm;
	
	//@Test
	public void testMapper() {
		log.info(cm);
	}
		
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		
		List<ComunityVO> list = cm.getListWithPaging(cri);
		list.forEach(board -> log.info("뷀부레부"+board));
	}
	
//		@Test
		public void testInsert() {//C
			ComunityVO board = new ComunityVO();
			board.setTitle("테스트");
			board.setWriter("test");
			board.setComunitytext("test");
			
			
			cm.insert(board);
			
			log.info(board);
		}
			
		//@Test
		public void testRead() {//R
			List<ComunityVO> board = cm.getList();
			log.info(board);
		}
		
		//@Test
		public void testReadOne() {//R O
			ComunityVO board = cm.getOne(14);
			log.info(board);
			
		}
		
		//@Test
		public void testUpdate() {//U
			
			ComunityVO board = new ComunityVO();
			board.setComunitynumber(14);
			board.setTitle("수정된 제목");
			board.setComunitytext("수정된 내용");
			board.setWriter("수 정됨씨 ");
			
			int count = cm.update(board);
			log.info("UPDATE COUNT : " + count);
			
		}
		
		//@Test
		public void testDelete() {//D
			log.info("DELETE COUNT : " + cm.delete(12));
		}
		
//		//@Test
//		public void testPaging() {
//			Criteria cri = new Criteria();
//			
//			List<ComunityVO> list = cm.getListWithPaging(cri);
//			list.forEach(board -> log.info("뷀부레부"+board));
//			}

		@Test
		public void testSearch() {
			log.info("!@#$!@#$!@#$!@#$!@#$!@#$!@#$!@#$!@#$!@#$!@#$여기는 들어왓다.");
			Criteria cri = new Criteria();
			cri.setKeyword("테스트");
			cri.setPost_type("COMUNITY");
			
			List<ComunityVO> list = cm.getListWithPaging(cri);
			list.forEach(board -> log.info("리스트 키워드랑 타입 넣은거 : "+board));
		}
}
