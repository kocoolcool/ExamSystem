package com.exam.ExamManage.repository;


import java.util.List;

import com.exam.ExamManage.model.ExamBean;
import com.exam.examAppointment.model.AppBean;


public interface AppDAOforApprove {

	List<AppBean> getAllAppBean();
	List<AppBean> getAllAppBeanWhitchUnconfirm();
	Boolean ApproveAppBean(int studentId, int statusCFM);
	
	int updateCurrentAppointmentAddOne(String examId);
}
