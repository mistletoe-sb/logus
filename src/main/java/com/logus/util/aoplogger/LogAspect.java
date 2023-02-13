package com.logus.util.aoplogger;

/*import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;*/

//@Component
//@Aspect
// AOP 이용한 Logger 클래스
// 작성자 : 이수봉
public class LogAspect {
	
	//private static Logger logger = LoggerFactory.getLogger(LogAspect.class);
	
	/*
	 * @Before("execution(* com.logus.util.redirectencoder..encode(..))") public
	 * void encodeLog(JoinPoint jp) throws Throwable{ logger.debug("메서드 : " +
	 * jp.getSignature().getName()); Signature sign = jp.getSignature();
	 * System.out.println("^ log : method -- " + sign.getName()); }
	 */
	
	/*
	 * @AfterThrowing(pointcut="encoderPointcut()", throwing="e") public void
	 * encodeLog(JoinPoint jp, Exception e) { logger.debug("메서드 : " +
	 * jp.getSignature().getName() + ">>> " + e.getClass().getName()); }
	 */
}
