package com.exam.mailCalendarChat.repository.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.exam.mailCalendarChat.model.EmailTemplateBean;
import com.exam.mailCalendarChat.repository.EmailTemplateDAO;

@Repository
public class HibernateEmailTemplateDAO implements EmailTemplateDAO {

	
	@Autowired
	SessionFactory factory;

	
	@Override
	public List<EmailTemplateBean> getAllEmailTemplates() {
		
		String hql = "from EmailTemplateBean WHERE status=1";
		Session session = factory.getCurrentSession();
		
		return session.createQuery(hql).getResultList();
	}


	@Override
	public void createEmailTemplate(EmailTemplateBean bean) {
		Session session = factory.getCurrentSession();
		session.save(bean);
				
	}


	@Override
	public void deleteEmailTemplate(int emailId) {
		Session session = factory.getCurrentSession();
		
//		EmailTemplateBean bean =session.get(EmailTemplateBean.class, emailId);
//		bean.setStatus(0);
		
		String hql = "UPDATE EmailTemplateBean SET status=0 WHERE emailId= :id";
		session.createQuery(hql).setParameter("id", emailId).executeUpdate();

	}


	@Override
	public void updateEmailTemplate(int emailId, String title, String content) {
		
		Session session = factory.getCurrentSession();
		String hql = "UPDATE EmailTemplateBean SET title= :newTitle, content= :newContent WHERE emailId= :id";
		session.createQuery(hql).setParameter("id", emailId).
								setParameter("newTitle", title).setParameter("newContent", content).executeUpdate();
	}


	@Override
	public EmailTemplateBean getEmailTemplatebean(int EmailId) {
		Session session = factory.getCurrentSession();
		
		return session.get(EmailTemplateBean.class, EmailId);
	}



}
