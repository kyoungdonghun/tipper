package kr.donghun.service;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import kr.donghun.domain.AttachFileDTO;
import kr.donghun.domain.ComunityVO;
import kr.donghun.domain.Criteria;
import kr.donghun.mapper.AttachFileMapper;
import kr.donghun.mapper.ComunityMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ComunityServiceImpl implements ComunityService {
	
	@Setter(onMethod_= @Autowired)
	private ComunityMapper comunitymapper;
	
	@Setter(onMethod_= @Autowired)
	private AttachFileMapper attachfilemapper;
	
	@Override
	public List<ComunityVO> getList(Criteria cri) {
		log.info(">>>> get List with paging "+cri);
		
		return comunitymapper.getListWithPaging(cri);
	}
	
	@Transactional
	@Override
	public void register(ComunityVO comunityvo) {
		log.info(">>>>>register"+comunityvo);
		comunitymapper.insert(comunityvo);
		System.out.println(comunityvo.getComunitynumber());
		
		if(comunityvo.getAttachList() == null || comunityvo.getAttachList().size() <=0) {
			return;
		}
		System.out.println(comunityvo.getAttachList()+"인설트의 겟 어테치 리스트.");
		comunityvo.getAttachList().forEach(attach ->{
			attach.setPostid(comunityvo.getComunitynumber());
			attach.setPost_type("COMUNITY");
			
			attachfilemapper.insert(attach);
		});
	}

	@Override
	public ComunityVO get(long comunitynumber) {
		log.info(">>>>>getOne"+comunitynumber);
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    String userEmail = authentication.getName(); // 이메일을 가져오는 예시
	    
	    System.out.println(comunitynumber);
	    if(!userEmail.equals("anonymousUser")) {
	    	addViewCount((int)comunitynumber, userEmail);
	    }
		return comunitymapper.getOne(comunitynumber);
	}
	
	@Transactional
	@Override
	public boolean modify(ComunityVO comunityvo) {
		log.info(">>>>>update"+comunityvo);
		
		attachfilemapper.deleteAll(comunityvo.getComunitynumber());
		boolean modifyResult = comunitymapper.update(comunityvo) ==1;
		
		if(modifyResult && comunityvo.getAttachList() != null && comunityvo.getAttachList().size() >0) {
			comunityvo.getAttachList().forEach(attach ->{ 
				attach.setPostid(comunityvo.getComunitynumber());
				attach.setPost_type("COMUNITY");
				attachfilemapper.insert(attach);
			});
		}
		return modifyResult;
		
	}

	@Transactional
	@Override
	public boolean remove(long comunitynumber) {
		log.info(">>>>>delete"+comunitynumber);
		
		attachfilemapper.deleteAll((int)comunitynumber);
		return comunitymapper.delete(comunitynumber) ==1;
	}
	
	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		
		return comunitymapper.getTotalCount(cri);
	}

	@Override
	public List<AttachFileDTO> getAttachList(int comunitynumber,String post_type) {
		log.info("get Attach list by comunitynumber" +comunitynumber );
		
		return attachfilemapper.findByComunitynumber(comunitynumber,post_type);
	}

	@Override
	public void addViewCount(int comunitynumber, String email) {
	    HttpServletResponse response = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getResponse();
	    HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
	    String cookieName = "viewedCommunity_"+comunitynumber+"_email_";
	    Cookie[] cookies = request.getCookies();
	    
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	        	System.out.println("쿠키 이름 : "+cookie.getName());
	        	System.out.println("쿠키 값 : "+cookie.getValue());
	            if (cookie.getName().equals(cookieName) && cookie.getValue().equals(email)) {
	                // 이미 쿠키가 존재하면 조회수를 증가시키지 않고 바로 리턴
	            	System.out.println("쿠키가 존재함.");
	                return;
	            }
	        }
	    }
	    Cookie viewedCookie = new Cookie(cookieName, email);
	    viewedCookie.setMaxAge(24 * 60 * 60);  // 쿠키 유효 시간 설정 (예: 하루)
	    response.addCookie(viewedCookie);
	    comunitymapper.addViewCount(comunitynumber, email);
	    return;
	}

	@Override
	public List<ComunityVO> getListView(Criteria cri) {
			log.info(">>>> get List with paging view "+cri);
		
		return comunitymapper.getListWithPagingView(cri);
	}

	@Override
	public List<ComunityVO> getListLikes(Criteria cri) {
			log.info(">>>> get List with paging likes "+cri);
		
		return comunitymapper.getListWithPagingLikes(cri);
	}

	@Override
	public List<ComunityVO> getListReply(Criteria cri) {
			log.info(">>>> get List with paging reply "+cri);
		
		return comunitymapper.getListWithPagingReply(cri);
	}

}
