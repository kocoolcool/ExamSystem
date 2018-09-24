package com.exam.ExamManage.service;

import java.util.List;

import com.exam.ExamManage.model.ExamBean;
import com.exam.examAppointment.model.AppBean;

public interface AppServiceforApprove {

	List<AppBean> getAllAppBean();
	List<AppBean> getAllAppBeanWhitchUnconfirm();
	Boolean ApproveAppBean(int studentId, int statusCFM);
	
	int updateCurrentAppointmentAddOne(String examId);
}
