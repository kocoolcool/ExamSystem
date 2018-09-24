package com.exam.backManageInfo.repository.impl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.exam.backManageInfo.model.ClassBean;
import com.exam.backManageInfo.repository.ClassDAO;

@Repository
public class HibernateClassDAO implements ClassDAO {

	@Autowired
	SessionFactory factory;

	@Override
	@SuppressWarnings("unchecked")
	public List<ClassBean> getAllClass() {
		String hql = "from ClassBean WHERE state=0";
		// 0為還在可考試期間內，1為超過可考試期間
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}

	@Override
	public void createClass(ClassBean bean) {
		Session session = factory.getCurrentSession();
		session.save(bean);
	}
	@Override
	public void deleteClass(String classId) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE ClassBean SET state=1 WHERE classId= :id";
		//state=1為超過可考試時間
		session.createQuery(hql).setParameter("id", classId).executeUpdate();
		
	}

	@Override
	public void updateClass(String classId, String className, String address, Date examStart, Date examEnd) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE EmailTemplateBean SET className= :newclassName, address= :newaddress, examStart= "
				+ ":newexamStart, examEnd= :newexamEnd WHERE classId= :id";
		session.createQuery(hql).setParameter("id", classId).setParameter("newclassName", className)
				.setParameter("newaddress", address).setParameter("newexamStart", examStart).setParameter("newexamEnd", examEnd).executeUpdate();
	}

	@Override
	public ClassBean getClassById(String classId) {
		ClassBean  bean=null;
		Session session = factory.getCurrentSession();
		bean=session.get(ClassBean.class, classId);
		return bean;
	}


}
