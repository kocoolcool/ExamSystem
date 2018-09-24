package com.exam.backManageInfo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.exam.backManageInfo.service.BackManageStudentService;
import com.exam.loginSystem.model.StudentBean;
import com.exam.loginSystem.repository.StudentDAO;
import com.exam.mailCalendarChat.repository.EmployeeDAO;
@Service
@Transactional
public class BackManageStudentServiceImpl implements BackManageStudentService {
	@Autowired
	StudentDAO studentDAO;
	@Override
	public List<StudentBean> getAllStudents() {
		// TODO Auto-generated method stub
		return studentDAO.getAllStudents();
	}

	@Override
	public StudentBean getStudentBean(int studentId) {
		// TODO Auto-generated method stub
		return studentDAO.getStudentBean(studentId);
	}

	@Override
	public void createStudent(StudentBean studentBean) {
		// TODO Auto-generated method stub
		studentDAO.createStudent(studentBean);
	}

	@Override
	public void deleteStudent(int studentId) {
		// TODO Auto-generated method stub
		studentDAO.deleteStudent(studentId);
	}

	@Override
	public void updateStudent(StudentBean studentBean) {
		// TODO Auto-generated method stub
		studentDAO.updateStudent(studentBean);
	}

}
