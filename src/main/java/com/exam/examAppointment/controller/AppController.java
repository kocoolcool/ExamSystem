package com.exam.examAppointment.controller;


import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exam.ExamManage.model.ExamBean;
import com.exam.ExamManage.service.ExamService;
import com.exam.examAppointment.misc.*;
import com.exam.examAppointment.model.AppBean;
import com.exam.examAppointment.service.AppService;
import com.exam.loginSystem.model.StudentBean;
import com.revinate.sendgrid.SendGrid;
import com.revinate.sendgrid.exception.SendGridException;
import com.revinate.sendgrid.model.Email;
import com.revinate.sendgrid.model.Response;

@Controller
public class AppController {
	@Autowired
	private AppService appService;
	@Autowired
	ExamService examService;
	@InitBinder
	public void registerCustomerEditor(WebDataBinder webDataBinder) {
		webDataBinder.registerCustomEditor(java.util.Date.class, 
				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"),true));
		webDataBinder.registerCustomEditor(int.class, 
				new CustomPrimitiveNumberEditor(Integer.class, true));
	}	
	
	
	@RequestMapping(value="/examAppointment/appdisplay",method={RequestMethod.GET, RequestMethod.POST})
//	@RequestMapping(value="/examAppointment/display-App",method={RequestMethod.GET, RequestMethod.POST})
//	@RequestMapping(value="/examAppointment/AppAllExam",method={RequestMethod.GET, RequestMethod.POST})
	public  String processAppForm(String appointment, AppBean bean, 
			BindingResult bindingResult, Model model) {

//接收資料
				
//驗證資料
		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);					
					
		if(appointment.equals("Insert") || appointment.equals("Update") || appointment.equals("Delete")) {
			if(bean.getStudentid()==0) {
				errors.put("studentid", "Please enter studentId for "+appointment);
				}
			}		
				
//轉換資料	
		if(bindingResult!=null) {
		if(bindingResult.getFieldError("studentid")!= null) {
		errors.put("studentid", "studentId must be an integer");	
	       }
        if(bindingResult.getFieldError("statusCFM")!= null) {
        errors.put("statusCFM", "statusCFM must be an Integer");	
			}
        if(bindingResult.getFieldError("applicationdate")!= null) {
        errors.put("applicationdate", "Applicationdate must be a date of YYYY-MM-DD");	
			}
        if(bindingResult.getFieldError("score")!= null) {
        errors.put("score", "Score must be an integer");	
			}
		}			
						
		if(errors!=null && !errors.isEmpty()) {				

//		return "forward:/examAppointment/Appointment.jsp";
		return "forward:/examAppointment/Administrator.jsp";
		}

//呼叫Model,根據Model執行結果導向View

		if(appointment!=null && appointment.equals("Select")) {
			List<AppBean> result = appService.select(bean);
			model.addAttribute("select", result);

//			return "forward:/examAppointment/display-App.jsp";
			return "forward:/examAppointment/appdisplay.jsp";
			} else if(appointment!=null && appointment.equals("Insert")) {
			AppBean result = appService.insert(bean);
					
			if(result==null) {
			errors.put("action", "Insert fail");
			} else {
			model.addAttribute("insert", result);
			
			}

//			return "forward:/examAppointment/Appointment.jsp";
			return "forward:/examAppointment/Administrator.jsp";
				
			} else if(appointment!=null && appointment.equals("Update")) {				
					
			AppBean result = appService.update(bean);
			if(result==null) {
			errors.put("action", "Update fail");
			} else {
			model.addAttribute("update", result);
			}
//		    return "forward:/examAppointment/Appointment.jsp";
		    return "forward:/examAppointment/Administrator.jsp";
		    
			} else if(appointment!=null && appointment.equals("Delete")) {
			boolean result = appService.delete(bean);
			if(!result) {
			model.addAttribute("delete", 0);
			} else {
			model.addAttribute("delete", 1);			}

			return "forward:/examAppointment/Administrator.jsp";
			} else  {
			errors.put("action", "Unknown Action:"+appointment);

			return "forward:/examAppointment/Administrator.jsp";
		}
	}
	
	//顯示該班級的考試資料
		@RequestMapping("/examAppointment/AppAllExam")
		public String selectAllexam(Model model,HttpServletRequest req) {
			HttpSession session=req.getSession(false);
			StudentBean bean=(StudentBean) session.getAttribute("LoginOK");
			System.out.println(bean.getThisIsClass());
			System.out.println(bean.getStudentName());
		List<ExamBean>list=examService.getExamsByClass(bean.getThisIsClass());
		System.out.println(list);
		model.addAttribute("exam",list);
		return "examAppointment/AppAllExam.jsp";
		}
	//插入一筆預約成功資料
		@RequestMapping(value="/examAppointment/insertAppAllExam")
		public String insert(@RequestParam("examid")String examid,HttpServletRequest req) {
			HttpSession session=req.getSession(false);
			StudentBean sb=(StudentBean) session.getAttribute("LoginOK");
			AppBean bean=new AppBean();
			bean.setStudentid(sb.getStudentId());
			bean.setExamid(examid);			
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
			Date date = new Date();
			bean.setApplicationdate(date);			
			appService.insert(bean);
			
			//Insert完自發信件
	     	 	
	     		SendGrid sendGrid = SendGrid.create("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").build();
	     		Email email = new Email();
	     		email.addTo(sb.getEmail());
	     		email.setFrom("EEIT101021@gmail.com");
	     		email.setSubject("已收到您的報名");
	     		email.setHtml(" 您好!" +sb.getStudentName()+ "<br>" +"偉康科技已收到您的考試報名，"+"<br>" +"考試編號:"+bean.getExamid()+"現已將您的預約資訊傳送給負責的主考官,稍後回覆您預約結果,謝謝。"+"<br><br><br>" +  "<br>" + "主辦單位 偉康科技" + "<br>"+
	     				"聯絡資訊:"+ "<br>" +"電話 :886-2-7701-5899 "+ "<br>"+"地址 : 台北市松山區南京東路五段89號9樓" 
	     				);	
	        try {
	            Response response = sendGrid.mail().send(email);
	            System.out.println(response);
	            sendGrid.close();
	        } catch (SendGridException e) {
	            e.printStackTrace();
	            sendGrid.close();
	        }
			return "examAppointment/AppAllExam.jsp";
		}		
		
		
//	@RequestMapping("sendEmailToContactUs")
//	public String sendEmailToContactUs(HttpServletRequest request) {
//		String userName=request.getParameter("userName");
//		String userEmail= request.getParameter("userEmail");
//		String contactUsViaEmailTitle=request.getParameter("contactUsViaEmailTitle");
//		String contactUsViaEmailContent = request.getParameter("contactUsViaEmailContent");
//	
//	 SendGrid sendGrid = SendGrid.create("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").build();
//     Email email = new Email();     
//
//	        email.addTo("eeit10102@gmail.com");
//	        email.setFrom("eeit10102@gmail.com");
//	        email.setSubject(contactUsViaEmailTitle);
//	        email.setHtml("<div>寄件者為</div>");	
////	        email.setHtml(nameList[i] + " 您好!" + "<br>" + selectedContent + "<br><br><br>" + "資策會EEIT101第二組" + "<br>" + "總經理敬上");	
//	        try {
//	            Response response = sendGrid.mail().send(email);
//	            System.out.println(response);
//	            sendGrid.close();
//	        } catch (SendGridException e) {
//	            e.printStackTrace();
//	            sendGrid.close();
//	      
//	        }
//	
//	return "/ExamSystem/index.jsp";
//   }
	
}
