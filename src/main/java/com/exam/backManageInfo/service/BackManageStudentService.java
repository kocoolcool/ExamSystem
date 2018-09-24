package com.exam.backManageInfo.service;

import java.util.List;

import com.exam.loginSystem.model.StudentBean;

public interface BackManageStudentService {
	List<StudentBean> getAllStudents();//select All hql: From StudentBean;
	StudentBean getStudentBean (int studentId);//select One  hql: From StudentBean where studentId= :studentId
	void createStudent(StudentBean studentBean);//insert  session.save(studentBean)
	void deleteStudent(int studentId);//delete  hql:Delete StudentBean where studentId= :studentId
	void updateStudent(StudentBean studentBean);//update  hql:
}
