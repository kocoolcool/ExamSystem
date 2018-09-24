package com.exam.mailCalendarChat.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.exam.ExamManage.model.ExamBean;
import com.exam.backManageInfo.model.ClassBean;
import com.exam.backManageInfo.service.ClassService;
import com.exam.loginSystem.model.StudentBean;
import com.exam.loginSystem.service.StudentService;
import com.exam.mailCalendarChat.model.EmailTemplateBean;
import com.exam.mailCalendarChat.model.EmployeeBean;
import com.exam.mailCalendarChat.service.EmailTemplateService;
import com.exam.mailCalendarChat.service.FilterClassByEmployeeService;


@Controller
public class EmailTemplateController {

	@Autowired
	EmailTemplateService emailTemplateService;
	
	@Autowired
	StudentService studentService;
	
	@Autowired 
	ClassService classService;
	
	@Autowired 
	FilterClassByEmployeeService filterClassByEmployeeService;
	
	//顯示所有信件
	@RequestMapping("/ShowEmailTemplates")
	public String getAllEmailTemplate(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession(false);
		Object loginSession= session.getAttribute("LoginOK");
		//列出所有信件
		List<EmailTemplateBean> emailList = emailTemplateService.getAllEmailTemplates();
//		列出所有班級
		List<ClassBean> classList=classService.getAllClass();
		List<StudentBean> studentList =studentService.getAllStudents();
		
		model.addAttribute("allEmailTemplates", emailList);
		
		if(loginSession instanceof EmployeeBean) {
			if(((EmployeeBean) loginSession).getWhichIdentity()==0) {
				//身分是管理員
				
				
				model.addAttribute("allClass", classList);
				model.addAttribute("allStudents", studentList);
				
				return "mailCalendarChat/ShowEmailTemplates.jsp";
			}else if(((EmployeeBean) loginSession).getWhichIdentity()==1) {
				//身分是主考官
				EmployeeBean employeeBean = (EmployeeBean) loginSession; 
				
				//根據考官登入身分，判斷他有被安排管理的班級
				List<StudentBean> studentListFilter = filterClassByEmployeeService.
						getStudentBeanByEmployeeWithClass(employeeBean.getEmployeeId());
				List<ClassBean> classListFilter=filterClassByEmployeeService.
						getClassBeanByEmployee(employeeBean.getEmployeeId());
				
				model.addAttribute("allClass", classListFilter);
				model.addAttribute("allStudents", studentListFilter);
				
				return "mailCalendarChat/ShowEmailTemplatesSEC.jsp";
			}else {
				return "mailCalendarChat/ShowEmailTemplates.jsp";
			}
		}else{
			return "mailCalendarChat/ShowEmailTemplates.jsp";
		}
		
		
	}
	
	//insert一筆信件(方法一)
//	@RequestMapping(value="/mailCalendarChat/createEmailTemplate", method=RequestMethod.POST)
//	public String createEmailTemplate(@ModelAttribute("EmailTemplateBean") EmailTemplateBean bean
//	                         ,Model model,HttpServletRequest request) {
//		
//		emailTemplateService.createEmailTemplate(bean);
//		return "redirect:/ShowEmailTemplates";
//	}
	
	//insert一筆信件(方法二)
	@RequestMapping(value="/mailCalendarChat/createEmailTemplate", method=RequestMethod.POST)
	public String createEmailTemplate(@RequestParam("title") String title, @RequestParam("content") String content) {
		
		EmailTemplateBean bean = new EmailTemplateBean();
		bean.setTitle(title);
		bean.setContent(content);
		bean.setStatus(1);
		emailTemplateService.createEmailTemplate(bean);
		
		return "redirect:/ShowEmailTemplates";
	}
	
	
	//由id找到一筆信件，並傳json回去
	@RequestMapping(value="/getEmailTemplateById")
	public void getEmailTemplateById(@RequestParam("id") int emailId, Model model, HttpServletRequest request,HttpServletResponse response) {
	
		EmailTemplateBean bean =emailTemplateService.getEmailTemplatebean(emailId);
		
		response.setHeader("content-type", "charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		List list = new ArrayList();
		list.add(bean.getTitle());
		list.add(bean.getContent());
		list.add(bean.getEmailId());
		 String jsonString =JSONValue.toJSONString(list);
		try {
			response.getWriter().print(jsonString);
		} catch (IOException e) {
			
			e.printStackTrace();
		};
		
//		System.out.println("-------------測試getEmailTemplate : " + bean.getTitle());

	}
	
	//將一筆信件的status變成0，當成是DELETE
	@RequestMapping(value="/mailCalendarChat/deleteEmailTemplate")
	public String deleteEmailTemplate(@RequestParam("id") int emailId,Model model) {
		emailTemplateService.deleteEmailTemplate(emailId);
//		System.out.println("==========測試DELETE EMAIL");
		
		return "redirect:/ShowEmailTemplates";
	}
	
	//更新一筆信件
	@RequestMapping(value="/mailCalendarChat/updateEmailTemplate")
	public String updateEmailTemplate(@RequestParam("id") int emailId, 
			@RequestParam("title")  String title, @RequestParam("content") String content) {
		
		emailTemplateService.updateEmailTemplate(emailId, title, content);
	
		return "redirect:/ShowEmailTemplates";
	}
	
	@RequestMapping(value="/getStudentsByClassId")
	public void getStudentsByClassId(@RequestParam("classId") String classId, HttpServletResponse response) {
		List<StudentBean> studentsList=studentService.getStudentsByClassId(classId);
		List<Object> sendBackList = new ArrayList<Object>();
		response.setHeader("content-type", "charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		for(StudentBean bean: studentsList) {
			List<Object> listTemp = new ArrayList<Object>();
			listTemp.add(bean.getStudentId());
			listTemp.add(bean.getStudentName());
			listTemp.add(bean.getThisIsClass());
			listTemp.add(bean.getPhone());
			listTemp.add(bean.getEmail());
			sendBackList.add(listTemp);
		}
		 String jsonString =JSONValue.toJSONString(sendBackList);
		 try {
			response.getWriter().print(jsonString);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	
	
	
	
	
	
	
	@RequestMapping("/ContactUs")
	public String getContactUsPage(Model model) {
		return "mailCalendarChat/ContactUs.jsp";
	}
	
	
	@RequestMapping("/GoogleHangout")
	public String getGoogleHangout(Model model) {
		return "mailCalendarChat/GoogleHangout.jsp";
	}
	
	
	
	
}
