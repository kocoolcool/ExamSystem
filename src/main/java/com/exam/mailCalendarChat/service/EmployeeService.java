package com.exam.mailCalendarChat.service;

import java.util.List;

import com.exam.mailCalendarChat.model.EmployeeBean;

public interface EmployeeService {
	
	List<EmployeeBean> getAllEmployees();
	EmployeeBean getEmployeeById(int id);
	void createEmployee(EmployeeBean employeeBean);
	void updateEmployee(int id, String employeeName, String position, 
			String email, String address, String phone, int whichIdentity, byte[] photo, String photoName);
	void deleteEmployee(int id);
	
	EmployeeBean getEmployeeBeanByEmail (String email);
}
