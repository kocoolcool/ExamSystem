package com.exam.loginSystem.controller;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.exam.loginSystem.model.StudentBean;
import com.exam.loginSystem.service.StudentService;
import com.exam.mailCalendarChat.model.EmployeeBean;
import com.exam.mailCalendarChat.service.EmployeeService;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;


@Controller
public class HomeController {
	
	@Autowired//自動注入，不用new物件  能自動連線啟用物件的功能
	StudentService studentService;
	
	@Autowired//自動注入，不用new物件  能自動連線啟用物件的功能
	EmployeeService employeeService;
	
	
	@RequestMapping("loginSystem/logouttt")
	public String logouttt(Model model) {
		model.addAttribute("title","~~~~~~~~~~~~~");
		return "loginSystem/logouttt.jsp";
	}
	
	
	//for Google登入的路徑
	@RequestMapping("/Template")
	public String toTemplate(Model model) {
		model.addAttribute("title","~~~~~~~~~~~~~");
		System.out.println("/Template的TEST");
//		if(sessionForLogin.LoginOK!= null){
//		  StudentBean sb= new StudentBean();
//		  sb= studentService.getStudentBeanByEmail(googleEmail);//獲得該學生的資料
//		  model.addAttribute("visitName", sb.getStudentName());
//	}
		return "Template.jsp";
	}
	
	
	@RequestMapping("/")//任何斜線開頭的請求
	public String welcome(HttpServletRequest request, HttpServletResponse response, HttpSession session) {//均回傳index首頁

//		session= request.getSession(false);
//		
//		if(session==null) {
//		  session= request.getSession();
//		}
		
		return "index.jsp";
	}

	
	@RequestMapping("/index")
	public String toIndex(HttpServletRequest request, HttpServletResponse response, HttpSession session) {//均回傳index首頁
		return "index.jsp";
	}
	
	
	@RequestMapping("/index_Admin")
	public String forIndexAdmin(HttpServletRequest request, HttpServletResponse response, HttpSession session) {//均回傳index首頁
				
	    return "index_Admin.jsp";
	}
	
	
	@RequestMapping("/index_Exami")
	public String forIndexExami(HttpServletRequest request, HttpServletResponse response, HttpSession session) {//均回傳index首頁
				
	    return "index_Exami.jsp";
	}
	
	
	@RequestMapping("/index_Student")
	public String forIndexStudent(HttpServletRequest request, HttpServletResponse response, HttpSession session) {//均回傳index首頁
				
	    return "index_Student.jsp";
	}
	
	
//	@RequestMapping("index_passerby")
//	public String toIndexPasserby(HttpServletRequest request, HttpServletResponse response, HttpSession session) {//均回傳index首頁
//		return "loginSystem/index_passerby.jsp";
//	}
	
	
	@RequestMapping("loginSystem/index_forLogin1")
	public String toIndexLogin(HttpServletRequest request, HttpServletResponse response, HttpSession session) {//均回傳index首頁
		return "loginSystem/index_forLogin1.jsp";
	}
	
	
  //會往註冊成功頁
	@RequestMapping("loginSystem/forSuccessRegister")
	public String forSuccessRegister(Model model) {
		model.addAttribute("title","~~~~~~~~~~~~~");
		return "loginSystem/forSuccessRegister.jsp";
	}
	
	
  //會往維護學生個人資料頁
	@RequestMapping("maintainStudentProfile")
	public String maintainStudentProfile(Model model) {
		return "loginSystem/maintainStudentProfile.jsp";
	}
			
		
  //會往維護員工個人資料頁
	@RequestMapping("maintainEmployeeProfile")
	public String maintainEmployeeProfile(Model model) {
		return "loginSystem/maintainEmployeeProfile.jsp";
	}
}
