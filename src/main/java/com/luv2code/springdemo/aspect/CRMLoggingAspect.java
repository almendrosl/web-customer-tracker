package com.luv2code.springdemo.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import java.util.logging.Logger;

@Aspect
@Component
public class CRMLoggingAspect {

    private Logger myLogger = Logger.getLogger(getClass().getName());

    @Pointcut("execution(* com.luv2code.springdemo.controller.*.*(..))")
    private void forControllerPackage(){}

    @Pointcut("execution(* com.luv2code.springdemo.service.*.*(..))")
    private void forServicePackage(){}

    @Pointcut("execution(* com.luv2code.springdemo.dao.*.*(..))")
    private void forDaoPackage(){}

    @Pointcut("forControllerPackage() || forServicePackage() || forDaoPackage()")
    private void forAppFlow(){}

    @Before("forAppFlow()")
    public void before(JoinPoint theJointPoint) {
        String theMethod = theJointPoint.getSignature().toShortString();
        myLogger.info("======>> in @Before: calling method: "+ theMethod);

        Object[] args = theJointPoint.getArgs();

        for (Object tempArg : args) {
            myLogger.info("=====>> argument: " + tempArg);
        }
    }

    @AfterReturning(
            pointcut = "forAppFlow()",
            returning = "theResult"
    )
    public void afterReturning(JoinPoint theJointPoint, Object theResult){
        String theMethod = theJointPoint.getSignature().toShortString();
        myLogger.info("======>> in @AfterReturning: from method: "+ theMethod);

        myLogger.info("=========> result: " + theResult);
    }


}
