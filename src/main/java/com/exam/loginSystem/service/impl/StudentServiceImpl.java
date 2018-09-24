package com.exam.loginSystem.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.exam.loginSystem.model.StudentBean;
import com.exam.loginSystem.repository.StudentDAO;
import com.exam.loginSystem.service.StudentService;
import com.exam.mailCalendarChat.repository.EmployeeDAO;

@Service
@Transactional
public class StudentServiceImpl implements StudentService {

	
	@Autowired
	StudentDAO studentDAO;
	
	
	@Override
	public StudentBean getStudentBeanByEmail(String email) {
		return studentDAO.getStudentBeanByEmail(email);
	}

	
	@Override
	public List<StudentBean> getAllStudents() {

		return studentDAO.getAllStudents();
	}

	
	@Override
	public StudentBean getStudentBean(int studentId) {

		return studentDAO.getStudentBean(studentId);
	}

	
	@Override
	public void createStudent(StudentBean studentBean) {

		studentDAO.createStudent(studentBean);
	}
	

	@Override
	public void deleteStudent(int studentId) {

		studentDAO.deleteStudent(studentId);
	}

	
	@Override
	public void updateStudent(StudentBean studentBean) {
		
		studentDAO.updateStudent(studentBean);

	}
	
	@Override
	public List<StudentBean> getStudentsByClassId(String classId) {
		// TODO Auto-generated method stub
		return studentDAO.getStudentsByClassId(classId);
	}

	
}
