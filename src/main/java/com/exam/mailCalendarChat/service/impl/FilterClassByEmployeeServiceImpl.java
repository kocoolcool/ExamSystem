package com.exam.mailCalendarChat.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.exam.backManageInfo.model.ClassBean;
import com.exam.loginSystem.model.StudentBean;
import com.exam.mailCalendarChat.repository.FilterClassByEmployeeDAO;
import com.exam.mailCalendarChat.service.FilterClassByEmployeeService;

@Service
@Transactional
public class FilterClassByEmployeeServiceImpl implements FilterClassByEmployeeService {

	@Autowired
	FilterClassByEmployeeDAO filterClassByEmployeeDAO;
	
	@Override
	public List<ClassBean> getClassBeanByEmployee(int employeeId) {
		return filterClassByEmployeeDAO.getClassBeanByEmployee(employeeId);
	}

	@Override
	public List<StudentBean> getStudentBeanByEmployeeWithClass(int employeeId) {
		return filterClassByEmployeeDAO.getStudentBeanByEmployeeWithClass(employeeId);
	}

}
