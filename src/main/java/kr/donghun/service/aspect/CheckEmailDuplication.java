package kr.donghun.service.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import kr.donghun.domain.MemberVO;
import lombok.extern.log4j.Log4j;

@Aspect
@Log4j
@Component
public class CheckEmailDuplication {
	
//	@Around("execution(* kr.donghun.service.MemberService.register(..)) && args(member)")
//	public Object checkEmailDuplication(ProceedingJoinPoint joinPoint, MemberVO member) throws Throwable {
//	    // 중복 이메일 확인 로직
//	    if (isEmailDuplicated(member.getEmail())) {
//	        throw new DuplicatedEmailException("중복된 이메일입니다.");
//	    }
//
//	    // 중복이 아니면 원래 메서드 실행
//	    return joinPoint.proceed();
//	}
//	
//	public Object checkLogin(ProceedingJoinPoint joinPoint, String email) {
//		
//		if()
//		
//	}
}
