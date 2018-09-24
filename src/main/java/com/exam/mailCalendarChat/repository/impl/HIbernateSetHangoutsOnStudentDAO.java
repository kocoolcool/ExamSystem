package com.exam.mailCalendarChat.repository.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.exam.examAppointment.model.AppBean;
import com.exam.mailCalendarChat.repository.SetHangoutsOnStudentDAO;

@Repository
public class HIbernateSetHangoutsOnStudentDAO implements SetHangoutsOnStudentDAO {

	@Autowired
	SessionFactory factory;
	
	@Override
	public AppBean getAppBeanByStudentId(int studentId) {
		Session session= factory.getCurrentSession();
		return session.get(AppBean.class, studentId);
	}

}
