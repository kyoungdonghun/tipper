package kr.donghun.service.aspect;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Aspect
@Log4j
@Component
public class AOPService {
	@Before("execution(* kr.donghun.service.ComunityService*.*(..))")
	public void logBefore() {
		log.info("=======이전에 aop를 한번 타긴 하네요? ==========");
	}
	
	//개시글을 클릭했을때 -> 있는지 확인 -> 만들거나 말거나 -> 조회수 올리거나 말거나
	
	
//	public boolean makeCookie() {
//		return true;
//	}
//	
//	@Before("execution(* kr.donghun.service.ComunityService*.*(..))")
//	public boolean viewCookieCheck() {
//		log.info("=======이전에 aop를 한번 타긴 하네요? ==========");
//		return true;
//	}
	
//	
//	@Around("execution(* kr.donghun.service.SampleService*.*(..))")
//	public Object checkLoginSession(ProceedingJoinPoint joinPoint, HttpSession session) throws Throwable {
//		String checkSession = (String)session.getAttribute("login_member");
//		if(checkSession!=null) {
//			return joinPoint.proceed();
//		}else {
//			return "redirect:/member/login";
//		}
//	}
}
