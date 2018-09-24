package com.exam.mailCalendarChat.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.exam.mailCalendarChat.model.EmployeeBean;
import com.exam.mailCalendarChat.repository.EmployeeDAO;
import com.exam.mailCalendarChat.service.EmployeeService;

@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	EmployeeDAO employeeDAO;
	
	@Override
	public EmployeeBean getEmployeeBeanByEmail(String email) {
		return employeeDAO.getEmployeeBeanByEmail(email);
	}
	
	@Override
	public List<EmployeeBean> getAllEmployees() {
		
		return employeeDAO.getAllEmployees();
	}

	@Override
	public EmployeeBean getEmployeeById(int id) {
		
		return employeeDAO.getEmployeeById(id);
	}

	@Override
	public void createEmployee(EmployeeBean employeeBean) {
		
		employeeDAO.createEmployee(employeeBean);
	}

	@Override
	public void updateEmployee(int id, String employeeName, String position, String email, String address, String phone,
			int whichIdentity, byte[] photo, String photoName) {
		
		employeeDAO.updateEmployee(id, employeeName, position, email, address, phone, whichIdentity, photo, photoName);
	}

	@Override
	public void deleteEmployee(int id) {
		
		employeeDAO.deleteEmployee(id);
	}

}
