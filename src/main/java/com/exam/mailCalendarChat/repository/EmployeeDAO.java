package com.exam.mailCalendarChat.repository;

import java.util.List;

import com.exam.mailCalendarChat.model.EmployeeBean;

public interface EmployeeDAO {

	List<EmployeeBean> getAllEmployees();
	EmployeeBean getEmployeeById(int id);
	void createEmployee(EmployeeBean employeeBean);
	void updateEmployee(int id, String employeeName, String position, 
			String email, String address, String phone, int whichIdentity, byte[] photo, String photoName);
	void deleteEmployee(int id);
	List<String> getAllEmployee();
	
	EmployeeBean getEmployeeBeanByEmail (String email);//select One  hql: From EmployeeBean where email= :email
	
	List<EmployeeBean> getAllEmployeeOnly0();
	
	List<EmployeeBean> getEmployeeByIdentity();
	
}
