package com.exam.loginSystem.repository;

import java.util.List;

import com.exam.loginSystem.model.StudentBean;

public interface StudentDAO {

	List<StudentBean> getAllStudents();//select All hql: From StudentBean;
	StudentBean getStudentBean (int studentId);//select One  hql: From StudentBean where studentId= :studentId
	void createStudent(StudentBean studentBean);//insert  session.save(studentBean)
	void deleteStudent(int studentId);//delete  hql:Delete StudentBean where studentId= :studentId
	void updateStudent(StudentBean studentBean);//update  hql:
	List<StudentBean> getStudentsByClassId(String classId);
	
	StudentBean getStudentBeanByEmail (String email);//select One  hql: From StudentBean where email= :email
}
