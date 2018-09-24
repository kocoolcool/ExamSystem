package com.exam.ExamManage.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.exam.ExamManage.model.ExamBean;
import com.exam.ExamManage.service.ExamService;
import com.exam.examAppointment.model.AppBean;
import com.exam.loginSystem.model.StudentBean;
import com.exam.loginSystem.service.StudentService;
import com.revinate.sendgrid.SendGrid;
import com.revinate.sendgrid.exception.SendGridException;
import com.revinate.sendgrid.model.Email;
import com.revinate.sendgrid.model.Response;

@Component
public class ExanScheduled {
	@Autowired
	ExamService examService;
	@Autowired
	StudentService studentService;

	@Scheduled(cron = "0 0 * * * *")
	public void updateExamStatus() {
		System.out.println("HELLO schedule");
		List<ExamBean> list = examService.getAllExam();
		Timestamp d = new Timestamp(System.currentTimeMillis());
		for (ExamBean eb : list) {
			if(eb.getStatus()==0) {
				if (eb.getExamTime().before(d)) {
					System.out.println(eb.getExamId());
					examService.updateStatus(1, eb.getExamId());
					System.out.println("更新完成");
				}
			}		
		}
	}

	@Scheduled(cron = "0 * * * * *")
	public void autoEmailBeforExamDay() {
		List<ExamBean> list = examService.getAllExam();
		Timestamp d = new Timestamp(System.currentTimeMillis());
		System.out.println("開始跑囉");
		for (ExamBean eb : list) {
			if (eb.getExamTime().getTime() - d.getTime() < 86400000 && eb.getExamTime().getTime() - d.getTime() >0) {
				List<AppBean> bean = examService.getStudentByExamId(eb.getExamId());
				for (AppBean cb : bean) {
					System.out.println("找到囉");
					System.out.println(cb.getStudentid());	
					StudentBean sb = studentService.getStudentBean(cb.getStudentid());
					SendGrid sendGrid = SendGrid
							.create("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").build();
					Email email = new Email();
					email.addTo(sb.getEmail());
					System.out.println(sb.getEmail());
					email.setFrom("EEIT101021@gmail.com");
					email.setSubject("考試提醒");
					email.setHtml("您好!" + sb.getStudentName() + "<br>" + "請別忘記明日有場考試" + "時間於"
							+ eb.getExamTime().toString().substring(0, 16) + "<br><br><br>" +  "<br>" + "主辦單位 偉康科技" + "<br>"+
		     				"聯絡資訊:"+ "<br>" +"電話 :886-2-7701-5899 "+ "<br>"+"地址 : 台北市松山區南京東路五段89號9樓");
					try {
						Response response = sendGrid.mail().send(email);
						System.out.println(response);
						sendGrid.close();
					} catch (SendGridException e) {
						e.printStackTrace();
						sendGrid.close();
					}

				}
			}
		}

	}
}