package com.exam.backManageInfo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.exam.backManageInfo.service.BackManageEmployeeService;
import com.exam.mailCalendarChat.model.EmployeeBean;
import com.exam.mailCalendarChat.repository.EmployeeDAO;
@Service
@Transactional
public class BackManageEmployeeServiceImpl implements BackManageEmployeeService {
	
	@Autowired
	EmployeeDAO employeeDAO;
	@Override
	public List<EmployeeBean> getAllEmployees() {
		// TODO Auto-generated method stub
		return employeeDAO.getAllEmployees();
	}

	@Override
	public EmployeeBean getEmployeeById(int id) {
		// TODO Auto-generated method stub
		return employeeDAO.getEmployeeById(id);
	}

	@Override
	public void createEmployee(EmployeeBean employeeBean) {
		// TODO Auto-generated method stub
		employeeDAO.createEmployee(employeeBean);
	}

	@Override
	public void updateEmployee(int id, String employeeName, String position, String email, String address, String phone,
			int whichIdentity, byte[] photo, String photoName) {
		// TODO Auto-generated method stub
		employeeDAO.updateEmployee(id, employeeName, position, email, address, phone, whichIdentity, photo, photoName);
	}

	@Override
	public void deleteEmployee(int id) {
		// TODO Auto-generated method stub
		employeeDAO.deleteEmployee(id);
	}

	@Override
	public List<EmployeeBean> getEmployeeByIdentity() {
		return employeeDAO.getEmployeeByIdentity();
	}

}
