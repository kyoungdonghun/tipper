package kr.donghun.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.donghun.domain.MemberVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberServiceTest {

	@Setter(onMethod_=@Autowired)
	private MemberService	service;
	
	@Test
	public void testAdd() throws Exception{
		MemberVO vo = new MemberVO();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
		Date date = dateFormat.parse("1991.01.01");
				vo.setEmail("test");
				vo.setName("김아무개");
				vo.setPassword("test");
				vo.setPhonenumber("01099998888");
				vo.setBirth(date);
			service.register(vo);
				
	}

}
