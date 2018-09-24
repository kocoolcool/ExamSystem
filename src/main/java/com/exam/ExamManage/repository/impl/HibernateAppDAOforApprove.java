package com.exam.ExamManage.repository.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.exam.ExamManage.model.ExamBean;
import com.exam.ExamManage.repository.AppDAOforApprove;
import com.exam.examAppointment.model.AppBean;



@Repository
public class HibernateAppDAOforApprove implements AppDAOforApprove {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public List<AppBean> getAllAppBean() {
		Session session=sessionFactory.getCurrentSession();
		String hql = "FROM AppBean";
		return session.createQuery(hql).getResultList();
	}
	
	@Override
	public List<AppBean> getAllAppBeanWhitchUnconfirm() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM AppBean WHERE statusCFM=0";
		return session.createQuery(hql).getResultList();
	}
	@Override
	public Boolean ApproveAppBean(int studentId, int statusCFM) {
		Session session = sessionFactory.getCurrentSession();
		AppBean bean=(AppBean)session.get(AppBean.class, studentId);
		
		if(bean != null) {
			bean.setStatusCFM(statusCFM);
			return true;
		}else {
			return false;
		}
		

	}

	@Override
	public int updateCurrentAppointmentAddOne(String examId) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "update ExamBean set currentAppointment =((select currentAppointment FROM ExamBean WHERE examId= :id) +1) WHERE examId= :id";
		return session.createQuery(hql).setParameter("id", examId).executeUpdate();
	}




}
