package com.ssm.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.bean.Page;
import com.ssm.bean.Pictures;
import com.ssm.service.MainService;
import com.ssm.test.SendEmail;
@Controller
public class MainControl {
		@Autowired
		MainService mainService;
		@ResponseBody
		@RequestMapping("/yanzheng.do")
		public String yanzheng(HttpServletRequest request, String yanzhengma) {
			System.out.println("------------------");
			String kaptchaExpected = (String) request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
			// String kaptchaReceived = request.getParameter("kaptcha");
			// //获取填写的验证码内容
			String kaptchaReceived = yanzhengma;
			if (kaptchaReceived.equalsIgnoreCase(kaptchaExpected)) {
				System.out.println("验证码输入正确");
				return "success";
			} else {
				System.out.println("验证码输入错误");
				return "error";
			}
		}
		// 登入
		@RequestMapping("/login.do")
		public void login(HttpServletRequest request,HttpServletResponse response) throws Exception{
			System.out.println("---------------------");
			String email=request.getParameter("uer");
			if(email!=null){
			String a=getIpAddr(request);
			mainService.insert(email,a);
			HttpSession session= request.getSession();
			session.setAttribute("email", email);
			request.getRequestDispatcher("WEB-INF/Home.jsp").forward(request, response);
			}
			else{
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		}
		@RequestMapping("/index.do")
		public void index(HttpServletRequest request,HttpServletResponse response) throws Exception {
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		@RequestMapping("/Home.do")
		public String Home(HttpServletRequest request,HttpServletResponse response) throws Exception {
			return "Home";
		}
		@RequestMapping(value="/pictures.do",method={RequestMethod.GET})
		public String pictures(HttpServletRequest request,HttpServletResponse response) throws Exception {
			String pagecode1=request.getParameter("pagecode");
			int pagecode;
			if(pagecode1==null){
				pagecode=1;
			}else{
			pagecode=Integer.valueOf(pagecode1);}
			Pictures pic=new  Pictures();
			Page<Pictures> page=new Page<Pictures>();
			page.setPagecode(pagecode);
			page.setPagerecord(9);
			page.setTotalrecord(mainService.selectCount(pic));
			page.setList(mainService.selectList(pic,pagecode,page.getPagerecord()));
			request.setAttribute("pb", page);
			return "pictures";
		}
		@RequestMapping(value="/pictures2.do",method={RequestMethod.GET})
		public String pictures2(HttpServletRequest request,HttpServletResponse response) throws Exception {
			String pagecode1=request.getParameter("pagecode");
			int pagecode;
			if(pagecode1==null){
				pagecode=1;
			}else{
			pagecode=Integer.valueOf(pagecode1);}
			Pictures pic=new  Pictures();
			Page<Pictures> page=new Page<Pictures>();
			page.setPagecode(pagecode);
			page.setPagerecord(9);
			page.setTotalrecord(mainService.selectCount(pic));
			page.setList(mainService.selectList(pic,pagecode,page.getPagerecord()));
			request.setAttribute("pb", page);
			return "pictures2";
		}
		@ResponseBody
		@RequestMapping(value="/sendvideo.do",method={RequestMethod.POST})
		public String sendvideo(HttpServletRequest request,String videoID,String email) {
			
			//int videoID=Integer.valueOf(request.getParameter("videoID"));
			int videoID1=Integer.valueOf(videoID);
			/*HttpSession session= request.getSession();
			String email=(String) session.getAttribute("email");*/
			String dataemail= mainService.select(videoID1);
			try {
			
				SendEmail sendEmail=new SendEmail();
				sendEmail.send(email, dataemail);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "error";
			}
			return "success";
			//return dataemail;
			
		}
		//获取登入IP
		public String getIpAddr(HttpServletRequest request) {
			String ip = request.getHeader("X-Forwarded-For");
			if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
			}
			if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
			}
			if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_CLIENT_IP");
			}
			if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
			}
			if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
			}
			return ip;
			}
	}

