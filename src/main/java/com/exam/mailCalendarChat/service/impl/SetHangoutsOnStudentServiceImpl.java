package com.exam.mailCalendarChat.service.impl;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.examAppointment.model.AppBean;
import com.exam.mailCalendarChat.repository.SetHangoutsOnStudentDAO;
import com.exam.mailCalendarChat.service.SetHangoutsOnStudentService;

@Service
@Transactional
public class SetHangoutsOnStudentServiceImpl implements SetHangoutsOnStudentService {

	@Autowired 
	SetHangoutsOnStudentDAO setHangoutsOnStudentDAO;
	
	@Override
	public AppBean getAppBeanByStudentId(int studentId) {
		
		return setHangoutsOnStudentDAO.getAppBeanByStudentId(studentId);
	}

}
