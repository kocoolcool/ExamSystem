package com.exam.mailCalendarChat.repository.impl;

import java.sql.Blob;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.exam.mailCalendarChat.model.CMManageBean;
import com.exam.mailCalendarChat.repository.CMManageDAO;

@Repository
public class HibernateCMManageDAO implements CMManageDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public List<CMManageBean> getAllCMManageBean() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM CMManageBean";
		return session.createQuery(hql).getResultList();
	}

	@Override
	public CMManageBean getCMManageBeanById(int id) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(CMManageBean.class, id);
	}

	@Override
	public CMManageBean getCMManageBeanByImageName(String imageName) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM CMManageBean WHERE imageName = :name";
		return (CMManageBean) session.createQuery(hql).setParameter("name", imageName).getSingleResult();
	}

	@Override
	public void insertCMManageBean(CMManageBean cMManageBean) {
		Session session = sessionFactory.getCurrentSession();
		session.save(cMManageBean);

	}

	@Override
	public void deleteCMManageBean(int id) {
		Session session = sessionFactory.getCurrentSession();
		CMManageBean bean = session.get(CMManageBean.class, id);
		if(bean != null) {
			session.delete(bean);
		}

	}

	@Override
	public void updateCMManageBean(int id, String imageName, Blob image, String linkURL, String title,
			String description, int sortNumber) {
		Session session = sessionFactory.getCurrentSession();
		
		if(session.get(CMManageBean.class, id) != null) {
			String hql = "UPDATE CMManageBean SET imageName= :iName , image= :iFile, linkURL= : iURL, title= :iTitle, description = :iDescription, sortNumber= :iNumber WHERE id= :iId";
			session.createQuery(hql).setParameter("iId", id).setParameter("iName", imageName).setParameter("iFile", image).setParameter("iURL", linkURL)
					.setParameter("iTitle", title).setParameter("iDescription", description).setParameter("iNumber", sortNumber).executeUpdate();
		}
		
	}

	@Override
	public List<CMManageBean> getAllCMManageBeanByOrder() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM CMManageBean order by sortNumber asc";
		return session.createQuery(hql).getResultList();
	}

	@Override
	public void updateCMManageBeanSortNumber(int id, int sortNumber) {
		Session session = sessionFactory.getCurrentSession();
		CMManageBean bean = session.get(CMManageBean.class, id);
		if(bean != null) {
			bean.setSortNumber(sortNumber);
		}
		
	}

}
