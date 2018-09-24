package com.exam.mailCalendarChat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.exam.ExamManage.model.ExamBean;
import com.exam.ExamManage.service.ExamService;
import com.exam.examAppointment.model.AppBean;
import com.exam.mailCalendarChat.model.EmployeeBean;
import com.exam.mailCalendarChat.service.EmployeeService;
import com.exam.mailCalendarChat.service.SetHangoutsOnStudentService;

@Controller
public class SetHangoutsOnStudentListController {

	@Autowired
	SetHangoutsOnStudentService setHangoutsOnStudentService;
	
	@Autowired
	ExamService examService;
	
	@Autowired 
	EmployeeService employeeService;
	
	public void setHangouts(Model model,int studentId) {
		AppBean appBean =setHangoutsOnStudentService.getAppBeanByStudentId(studentId);
		
		if(appBean != null) {
			ExamBean examBean=examService.getExamByID(appBean.getExamid());
			EmployeeBean employeeBean =employeeService.getEmployeeById(examBean.getEmployeeId());
			
			model.addAttribute("employeeEmail", employeeBean.getEmail());
			return;
		}else {
			return;
		}
	}
}
