package com.exam.ExamManage.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.exam.ExamManage.model.ExamBean;
import com.exam.examAppointment.model.AppBean;

@Service
@Transactional
public class AppServiceforApproveImpl implements com.exam.ExamManage.service.AppServiceforApprove {

	@Autowired
	com.exam.ExamManage.repository.AppDAOforApprove appDAOforApprove;
	
	@Override
	public List<AppBean> getAllAppBean() {
		
		return appDAOforApprove.getAllAppBean();
	}

	@Override
	public List<AppBean> getAllAppBeanWhitchUnconfirm() {
		
		return appDAOforApprove.getAllAppBeanWhitchUnconfirm();
	}

	@Override
	public Boolean ApproveAppBean(int studentId, int statusCFM) {
		
		return appDAOforApprove.ApproveAppBean(studentId, statusCFM);
	}


	@Override
	public int updateCurrentAppointmentAddOne(String examId) {
		// TODO Auto-generated method stub
		return appDAOforApprove.updateCurrentAppointmentAddOne(examId);
	}

}
