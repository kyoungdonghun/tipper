package kr.donghun.controller;

import static org.springframework.test.web.client.match.MockRestRequestMatchers.content;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultMatcher;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.donghun.domain.LikesVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)

//Test for controller
@WebAppConfiguration

@ContextConfiguration({
"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class LikesControllerTests {

	@Setter(onMethod_= {@Autowired})
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
//	@Test
	public void testCreateLikes() throws Exception {
	    // LikesVO 객체를 생성하여 요청 본문에 포함
	    LikesVO likesVO = new LikesVO();
	    likesVO.setPost_type("COMUNITY");

	    // ObjectMapper를 사용하여 객체를 JSON 문자열로 변환
	    ObjectMapper objectMapper = new ObjectMapper();
	    String jsonRequest = objectMapper.writeValueAsString(likesVO);

	    // POST 요청 수행
	    mockMvc.perform(post("/likes/new")
	            .contentType(MediaType.APPLICATION_JSON)
	            .content(jsonRequest))
	            .andExpect(status().isOk())
	            .andExpect(MockMvcResultMatchers.content().string("success"));
	}

	    @Test
	    public void testRemoveLikes() throws Exception {
	        // DELETE 요청 수행
	        mockMvc.perform(delete("/likes/19/COMUNITY/14"))
	                .andExpect(status().isOk())
	                .andExpect(MockMvcResultMatchers.content().string("success"));
	    }
}

	
	

