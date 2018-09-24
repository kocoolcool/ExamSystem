package com.exam.examAppointment.repository.impl;


import java.util.List;



import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.exam.examAppointment.model.AppBean;
import com.exam.examAppointment.repository.AppDAO;


@Repository
public class AppDAOHibernate implements AppDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public AppDAOHibernate(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	
	public Session getSession() {		
		return sessionFactory.getCurrentSession();
	}
	

	@Override	
	public AppBean select(int studentid) {
		return this.getSession().get(AppBean.class, studentid);
	}

	@Override	
	public List<AppBean> select() {
		return this.getSession().createQuery("FROM AppBean", AppBean.class).list();
	}

	
	@Override	
	public AppBean insert(AppBean bean) {
		if(bean!=null) {
			AppBean tempx = this.getSession().get(AppBean.class, bean.getStudentid());
			System.out.println(bean.toString());
			if(tempx==null) {
				this.getSession().save(bean);
				return bean;
			}			
		}
		return null;		
	}

	@Override	
	public AppBean update(String examid, java.util.Date applicationdate, int statusCFM, int score, int studentid){		
		AppBean tempx = this.getSession().get(AppBean.class, studentid);

		
		if(tempx!=null) {
			tempx.setExamid(examid);
			tempx.setApplicationdate(applicationdate);
			tempx.setStatusCFM(statusCFM);
			tempx.setScore(score);		
			return tempx;
		}
		return null;
	}

	@Override
	public boolean delete(int studentid) {
		AppBean tempx = this.getSession().get(AppBean.class, studentid);
		if(tempx!=null) {
			this.getSession().delete(tempx);
			return true;
		}	
		return false;
	}

}
