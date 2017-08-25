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
		System.out.println( "执行了:" + clsname + "." + methodname);
		System.out.println("++++++++++++++++++++++++++++++++++++++");
		String dialog=null;
		if(a.equals("com.ssm.service.MainServiceImpl.insert")){
			dialog =joinpoint.getArgs()[0]+"登入了       IP是"+joinpoint.getArgs()[1];
			
		}else if(a.equals("com.ssm.service.MainServiceImpl.select")){
			
			dialog ="进行了网盘查找方法";
			
		}
		
		else{
			System.err.println("没有执行相关方法");
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
