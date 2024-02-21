package kr.donghun.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class CookieInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		// comunity/get 요청 ->
	    System.out.println("->핸들러가 가로챔 ->");
	    System.out.println("-> 가로채면서 같이 넘어온 정보들도 긁어옵시다 ->");
//	    String comunitynumber = request.getParameter("comunitynumber");
//	    System.out.println("-> 가로챈 글 번호: " + comunitynumber);
//	    // -> 쿠키가 존재하는지 체크합시다. 
//        Cookie[] cookies = request.getCookies();
//        boolean cookieExists = false;
//
//        if (cookies != null) {
//            for (Cookie cookie : cookies) {
//                if ("myCookie".equals(cookie.getName())) {
//                    cookieExists = true;
//                    break;
//                }
//            }
//        }
//        System.out.println("-> 니가 만든 꾸키~~ : "+cookieExists);
//        System.out.println("체크과정까지 끝났습니다.이거 위에 로그에 참 트루가 나와야 합니다.");
//
//	    // 쿠키 생성 및 추가
//	    Cookie cookie = new Cookie("myCookie"+comunitynumber, "HelloCookie"+comunitynumber);
//	    response.addCookie(cookie);

	    return true;
	}

//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//	                       ModelAndView modelAndView) {
//	    System.out.println("Post Handle");
//
//	    // ModelAndView에서 쿠키 가져오기
//
//	}
//
//	@Override
//	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
//	                            Exception ex) {
//	    System.out.println("After Completion");
//	}
}
