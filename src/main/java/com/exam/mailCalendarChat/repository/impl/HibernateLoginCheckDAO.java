package com.exam.mailCalendarChat.repository.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.exam.mailCalendarChat.model.EmployeeBean;
import com.exam.mailCalendarChat.repository.LoginCheckDAO;

@Repository
public class HibernateLoginCheckDAO implements LoginCheckDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public Boolean checkBackManagerLogin(String email) {
		String hql = "FROM EmployeeBean WHERE email = :checkEmail AND whichIdentity=0";
		Session session = sessionFactory.getCurrentSession();
		EmployeeBean employeeBean= (EmployeeBean)session.createQuery(hql).getSingleResult();
		if(employeeBean != null) {
			return true;
		}else {
			return false;
		}
		
	}

	@Override
	public Boolean checkExamManagerLogin(String email) {
		String hql = "FROM EmployeeBean WHERE email = :checkEmail AND whichIdentity=1";
		Session session = sessionFactory.getCurrentSession();
		EmployeeBean employeeBean= (EmployeeBean)session.createQuery(hql).getSingleResult();
		
		if(employeeBean != null) {
			return true;
		}else {
			return false;
		}
	}

}
