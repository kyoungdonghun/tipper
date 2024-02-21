package kr.donghun.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
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
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.donghun.domain.ReplyVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)

//Test for controller
@WebAppConfiguration

@ContextConfiguration({
"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class ReplyControllerTests {

	@Setter(onMethod_= {@Autowired})
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
//	@Test
	public void testCreateReply() throws Exception {// 댓글 추가
	    // LikesVO 객체를 생성하여 요청 본문에 포함
	    ReplyVO replyvo = new ReplyVO();
	    replyvo.setPost_type("COMUNITY");
	    replyvo.setReplytext("testTEXT");
	    replyvo.setPostid(14);
	    replyvo.setEmail("test2");

	    // ObjectMapper를 사용하여 객체를 JSON 문자열로 변환
	    ObjectMapper objectMapper = new ObjectMapper();
	    String jsonRequest = objectMapper.writeValueAsString(replyvo);

	    // POST 요청 수행
	    mockMvc.perform(post("/replies/new")
	            .contentType(MediaType.APPLICATION_JSON)
	            .content(jsonRequest))
	            .andExpect(status().isOk())
	            .andExpect(MockMvcResultMatchers.content().string("success"));
	}

//    @Test
    public void testRemoveReply() throws Exception {//댓글 지우ㅠ기
        // DELETE 요청 수행
        mockMvc.perform(delete("/replies/3"))
                .andExpect(status().isOk())
                .andExpect(MockMvcResultMatchers.content().string("success"));
    }
	
//    @Test
    public void testListReply() throws Exception { // 댓글 목록 출력
        mockMvc.perform(get("/replies/COMUNITY/14")
                .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andDo(print());
                
    }
    
//    @Test
    public void testListOneReply() throws Exception { // 댓글 하나 출력
        mockMvc.perform(get("/replies/one/COMUNITY/4")
                .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andDo(print());
                
    }
    
	@Test
	public void testUpdateReply() throws Exception {// 댓글 추가
	    // LikesVO 객체를 생성하여 요청 본문에 포함
	    ReplyVO replyvo = new ReplyVO();
	    replyvo.setPost_type("COMUNITY");
	    replyvo.setReplytext("testTEXT2222");
	    replyvo.setPostid(14);
	    replyvo.setEmail("test");

	    // ObjectMapper를 사용하여 객체를 JSON 문자열로 변환
	    ObjectMapper objectMapper = new ObjectMapper();
	    String jsonRequest = objectMapper.writeValueAsString(replyvo);

	    // POST 요청 수행
	    mockMvc.perform(put("/replies/update/4")
	            .contentType(MediaType.APPLICATION_JSON)
	            .content(jsonRequest))
	            .andExpect(status().isOk())
	            .andExpect(MockMvcResultMatchers.content().string("success"));
	}
	
	
	
	
}

	
	

