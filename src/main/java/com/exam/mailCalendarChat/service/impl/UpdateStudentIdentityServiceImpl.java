package com.exam.mailCalendarChat.service.impl;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.mailCalendarChat.repository.UpdateStudentIdentityDAO;
import com.exam.mailCalendarChat.service.UpdateStudentIdentityService;

@Service
@Transactional
public class UpdateStudentIdentityServiceImpl implements UpdateStudentIdentityService {

	@Autowired
	UpdateStudentIdentityDAO updateStudentIdentityDAO;
	
	@Override
	public Boolean updateStudentIdentity(int studentId) {
		
		return updateStudentIdentityDAO.updateStudentIdentity(studentId);
	}

}
