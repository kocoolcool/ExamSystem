package com.exam.ExamManage.controller;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.exam.ExamManage.model.ExamBean;
import com.exam.ExamManage.service.AppServiceforApprove;
import com.exam.ExamManage.service.ExamService;
import com.exam.examAppointment.model.AppBean;
import com.exam.loginSystem.model.StudentBean;
import com.exam.loginSystem.service.StudentService;
import com.exam.mailCalendarChat.model.EmployeeBean;
import com.exam.mailCalendarChat.service.EmployeeService;
import com.exam.mailCalendarChat.service.UpdateStudentIdentityService;
import com.revinate.sendgrid.SendGrid;
import com.revinate.sendgrid.exception.SendGridException;
import com.revinate.sendgrid.model.Email;
import com.revinate.sendgrid.model.Response;


@Controller
public class AppApproveController {

	@Autowired
	AppServiceforApprove appServiceforApprove;
	
	@Autowired
	StudentService studentService;
	
	@Autowired
	ExamService examService;
	
	@Autowired 
	EmployeeService employeeService;
	
	@Autowired
	UpdateStudentIdentityService updateStudentIdentityService;
	
	@RequestMapping(value="/ExamManage/showAllAppBeanWhitchUnconfirm")
	public String showAllAppBeanWhitchUnconfirm(Model model) {
		//////////////////////////////////////////////////
		//傳所有尚未核准的預約
		List<AppBean> appListUnconfirm = appServiceforApprove.getAllAppBeanWhitchUnconfirm();
		//用Map裝AppBean和StudentBean，後在一起傳
		Map<Object, Object> studentMap = new HashMap<Object, Object>();
		
		for(AppBean appBean : appListUnconfirm) {
			int studentid = appBean.getStudentid();
			 StudentBean studentBean= studentService.getStudentBean(studentid);
			 studentMap.put(appBean, studentBean);
		}
		
		model.addAttribute("studentMap",studentMap);
		
		
		//////////////////////////////////////////////////
		//傳所有的預約紀錄
		List<AppBean> appList = appServiceforApprove.getAllAppBean();
		//用Map裝AppBean和StudentBean，後在一起傳
		Map<Object, Object> allStudentMap = new HashMap<Object, Object>();
		
		for(AppBean appBean : appList) {
			int studentid = appBean.getStudentid();
			 StudentBean studentBean= studentService.getStudentBean(studentid);
			 allStudentMap.put(appBean, studentBean);
		}
		
		model.addAttribute("allStudentMap",allStudentMap);

		return "ExamManage/ApproveAppointment.jsp";
	}
	
	@RequestMapping(value="/ExamManage/updateStudentAppointment")
	public String updateStudentAppointment(@RequestParam("studentId") int studentId, @RequestParam("statusCFM") int statusCFM,
					@RequestParam("examId") String examId, @RequestParam("studentName") String studentName, @RequestParam("appDate") String appDate) {
		
//		System.out.println("============updateStudentAppointment");
		if(appServiceforApprove.ApproveAppBean(studentId, statusCFM)) {

			
			
			ExamBean examBean =examService.getExamByID(examId);
			StudentBean studentBean =studentService.getStudentBean(studentId);
			EmployeeBean employeeBean= employeeService.getEmployeeById(examBean.getEmployeeId());
			///////////////////////////////////////////////
			/////寄信通知該學生//////////////////
			 SendGrid sendGrid = SendGrid.create("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").build();
		     
			 //核准預約
			 if(statusCFM == 1) {
		    	  
		    	  //如果目前預約小於最大人數才可接受預約，並更新目前預約人數
		    	  if(examBean.getCurrentAppointment() < examBean.getMaxAppointment()) {
		    		  
		    		  //增加目前預約人數+1
		    		  appServiceforApprove.updateCurrentAppointmentAddOne(examId);
		    		  
		    		//更新學生狀態為考生
						updateStudentIdentityService.updateStudentIdentity(studentId);
						
			    	  Email email = new Email();
			    		
				        email.addTo(studentBean.getEmail());
				        email.setFrom("EEIT101021@gmail.com");
				        email.setSubject("EEIT考試預約成功通知!");
				        email.setHtml(
				        		"<div>"+studentName+" &nbsp;您好 : </div>"
				        		+"<div>您於"+appDate.substring(0, 10)+"預約考試，在此恭喜您的預約已核准，再請您於預約的時段來參與考試，謝謝您，以下考試資訊供您參考，如有疑問請聯絡您的面試官。</div>"
				        		+"<br>"
				        		+"<div style='font-color:blue;font-size:14px;font-weight:bold;'>考試編號 : "+examId+"<br>考試科目 : "+examBean.getExamSubject()
				        			+"<br>考試時間  :" + examBean.getExamTime().toString().substring(0, 16)
				        			+"<br>考官姓名 : " +employeeBean.getEmployeeName()+"<br>考官email : " + employeeBean.getEmail()
//				        		+"<iframe src='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d326.52133775745256!2d121.54328624852307!3d25.03377886474676!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xedc006d25a9e35df!2z6LOH562W5pyDIOaVuOS9jeaVmeiCsueglOeptuaJgCDmlbjkvY3kurrmiY3ln7nogrLkuK3lv4M!5e0!3m2!1szh-TW!2stw!4v1532433267227' width='600' height='450' frameborder='0' style='border:0' allowfullscreen></iframe>"
				        		+"</div><br><br><br><div>偉康科技服務處</div><div>順安</div>");	
				        
				        try {
				            Response response = sendGrid.mail().send(email);
				            System.out.println(response);
				            sendGrid.close();
				        } catch (SendGridException e) {
				            e.printStackTrace();
				            sendGrid.close();
				        }
				
				///////////////////////////////////////////////
				///////////////////////////////////////
				        //目前預約人數已滿額
		    	  }else {
		    		  //將預約核准狀態改為拒絕
		    		  appServiceforApprove.ApproveAppBean(studentId, 2);
		    		  
		    		  Email email = new Email();
			    		
				        email.addTo(studentBean.getEmail());
				        email.setFrom("EEIT101021@gmail.com");
				        email.setSubject("EEIT考試預約成功通知!");
				        email.setHtml(
				        		"<div>"+studentName+" &nbsp;您好 : </div>"
				        		+"<div>您於"+appDate.substring(0, 10)+"預約考試，很抱歉您預約的考試("+examId+")已額滿，因此此次預約無效。</div>"
				        		+"</div><br><br><br><div>偉康科技服務處</div><div>順安</div>");	
				        
				        try {
				            Response response = sendGrid.mail().send(email);
				            System.out.println(response);
				            sendGrid.close();
				        } catch (SendGridException e) {
				            e.printStackTrace();
				            sendGrid.close();
				        }
		    	  }
		    	
		    	  
		    	  
		    	//拒絕預約
		      }else if(statusCFM == 2 ) {
		    	  Email email = new Email();
		    		
			        email.addTo(studentBean.getEmail());
			        email.setFrom("EEIT101021@gmail.com");
			        email.setSubject("EEIT考試預約結果通知!");
			        email.setHtml(
			        		"<div>"+studentName+" &nbsp;您好 : </div>"
			        		+"<div>您於"+appDate.substring(0, 10)+"預約考試("+examId+")，在此告知您的預約並未獲核准，謝謝您的預約。</div>"
//			        		+"<iframe src='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d326.52133775745256!2d121.54328624852307!3d25.03377886474676!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xedc006d25a9e35df!2z6LOH562W5pyDIOaVuOS9jeaVmeiCsueglOeptuaJgCDmlbjkvY3kurrmiY3ln7nogrLkuK3lv4M!5e0!3m2!1szh-TW!2stw!4v1532433267227' width='600' height='450' frameborder='0' style='border:0' allowfullscreen></iframe>"
			        		+"</div><br><br><br><div>偉康科技服務處</div><div>順安</div>");	
			        
			        try {
			            Response response = sendGrid.mail().send(email);
			            System.out.println(response);
			            sendGrid.close();
			        } catch (SendGridException e) {
			            e.printStackTrace();
			            sendGrid.close();
			        }
			
			///////////////////////////////////////////////
			///////////////////////////////////////
		      }else {
		    	  
		      }
			 
			
		}else {
			
		}
		
		
		
		
		return "ExamManage/showAllAppBeanWhitchUnconfirm";
	}
	
}
