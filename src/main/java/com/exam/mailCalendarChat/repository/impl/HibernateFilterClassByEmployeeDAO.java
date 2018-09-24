package com.exam.mailCalendarChat.repository.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.exam.ExamManage.model.ExamBean;
import com.exam.backManageInfo.model.ClassBean;
import com.exam.backManageInfo.repository.ClassDAO;
import com.exam.loginSystem.model.StudentBean;
import com.exam.loginSystem.repository.StudentDAO;
import com.exam.mailCalendarChat.repository.FilterClassByEmployeeDAO;

@Repository
public class HibernateFilterClassByEmployeeDAO implements FilterClassByEmployeeDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	@Autowired
	ClassDAO classDAO;
	
	@Autowired
	StudentDAO studentDAO;
	
	@Override
	public List<ClassBean> getClassBeanByEmployee(int employeeId) {
		Session session = sessionFactory.getCurrentSession();
		List<ClassBean> classBeanList = new ArrayList<ClassBean>();
		
		String hql ="SELECT DISTINCT classId FROM ExamBean WHERE employeeId = :id";
		List<String> listClassString= session.createQuery(hql).setParameter("id", employeeId).getResultList();
		for(String ClassString : listClassString) {
			ClassBean classBean= classDAO.getClassById(ClassString);
			classBeanList.add(classBean);
		}
		return classBeanList;
	}

	@Override
	public List<StudentBean> getStudentBeanByEmployeeWithClass(int employeeId) {
		
		List<StudentBean> studentBeanListFilterByEmployee = new ArrayList<StudentBean>();
		
		List<ClassBean> classBeanList= getClassBeanByEmployee(employeeId);
		for(ClassBean classBean : classBeanList) {
			List<StudentBean> studentBeanList= studentDAO.getStudentsByClassId(classBean.getClassId());
			studentBeanListFilterByEmployee.addAll(studentBeanList);
		}
		
		return studentBeanListFilterByEmployee;
	}

}
