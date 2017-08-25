package com.ssm.aop;




import java.util.Date;

import org.aspectj.lang.JoinPoint;

import com.ssm.util.DateUtil;

public class LogAspect {
	

	public void before(JoinPoint joinpoint) {

		String clsname = joinpoint.getTarget().getClass().getName();
			
		String methodname = joinpoint.getSignature().getName();
		/* for (int i = 0; i < joinpoint.getArgs().length; i++) {  
	            System.out.println(joinpoint.getArgs()[i]);  
	        }*/
		String a=clsname+"."+methodname;
		System.out.println();
		System.out.println("-----------------before---------------");
		System.out.println(DateUtil.getdatestrByDate(new Date(), "yyyy-MM-dd HH:mm:ss"));
		System.out.println( "ִ����:" + clsname + "." + methodname);
		System.out.println("++++++++++++++++++++++++++++++++++++++");
		String dialog=null;
		if(a.equals("com.ssm.service.MainServiceImpl.insert")){
			dialog =joinpoint.getArgs()[0]+"������       IP��"+joinpoint.getArgs()[1];
			
		}else if(a.equals("com.ssm.service.MainServiceImpl.select")){
			
			dialog ="���������̲��ҷ���";
			
		}
		
		else{
			System.err.println("û��ִ����ط���");
		}
		System.out.println(dialog);
		System.out.println("++++++++++++++++++++++++++++++++++++++");
	}

	public void after(JoinPoint joinpoint) {
		System.out.println("------------------after---------------");
		String methodname = joinpoint.getSignature().getName();
	
		System.out.println();

	}


	
	public void afterReturn(JoinPoint joinpoint, Object result) {

		System.out.println("------------------end-----------------");
		System.out.println();

	}


	
	
	

}
