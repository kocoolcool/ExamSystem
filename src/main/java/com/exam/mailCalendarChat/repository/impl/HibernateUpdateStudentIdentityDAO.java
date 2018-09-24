package com.exam.mailCalendarChat.repository.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.exam.loginSystem.model.StudentBean;
import com.exam.mailCalendarChat.repository.UpdateStudentIdentityDAO;

@Repository
public class HibernateUpdateStudentIdentityDAO implements UpdateStudentIdentityDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public Boolean updateStudentIdentity(int studentId) {
		Session session = sessionFactory.getCurrentSession();
		StudentBean bean = session.get(StudentBean.class, studentId);
		
		if(bean != null) {
			bean.setWhichIdentity(1);
			return true;
		}else {
			return false;
		}
	}

}
