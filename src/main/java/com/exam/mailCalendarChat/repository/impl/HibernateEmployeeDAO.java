package com.exam.mailCalendarChat.repository.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.exam.mailCalendarChat.model.EmployeeBean;
import com.exam.mailCalendarChat.repository.EmployeeDAO;

@Repository
public class HibernateEmployeeDAO implements EmployeeDAO {

	@Autowired
	SessionFactory factory;
	
	@Override
	public EmployeeBean getEmployeeBeanByEmail(String email) {//用email欄位搜尋一行資料行
		String hql= "From EmployeeBean WHERE email= :theRightEmail";
		Session session= factory.getCurrentSession();//取得連線以便於進資料庫更動資料
		EmployeeBean eb= null;
		eb=(EmployeeBean)session.createQuery(hql).setParameter("theRightEmail", email).getSingleResult();//getSingleResult()獲得單一筆資料行
		return eb;//回傳一列資料行(一個物件)
	}
	
	@Override
	public List<EmployeeBean> getAllEmployees() {
		
		Session session = factory.getCurrentSession();
		String hql = "FROM EmployeeBean";
		return session.createQuery(hql).getResultList();
	}

	@Override
	public EmployeeBean getEmployeeById(int id) {
		
		Session session = factory.getCurrentSession();
		return session.get(EmployeeBean.class, id);
	}

	@Override
	public void createEmployee(EmployeeBean employeeBean) {

		Session session = factory.getCurrentSession();
		session.save(employeeBean);
		
	}

	@Override
	public void updateEmployee(int id, String employeeName, String position, String email, String address, String phone,
			int whichIdentity, byte[] photo, String photoName) {
		
		Session session = factory.getCurrentSession();
		EmployeeBean bean =session.get(EmployeeBean.class, id);
		if(bean != null) {
			bean.setEmployeeName(employeeName);
			bean.setPosition(position);
			bean.setEmail(email);
			bean.setAddress(address);
			bean.setPhone(phone);
			bean.setWhichIdentity(whichIdentity);
			bean.setPhoto(photo);
			bean.setPhotoName(photoName);
		}

	}

	@Override
	public void deleteEmployee(int id) {
		
		Session session = factory.getCurrentSession();
		EmployeeBean bean = session.get(EmployeeBean.class, id);
		if(bean != null) {
			session.delete(bean);
		}
	}

	@Override
	public List<String> getAllEmployee() {
		String hql="SELECT DISTINCT e.employeeName From EmployeeBean e";
		Session session=factory.getCurrentSession();
		List<String> list=new ArrayList<>();
		list=session.createQuery(hql).getResultList();
		return list;
		
	}
	
	@Override
	public List<EmployeeBean> getAllEmployeeOnly0() {
		Session session=factory.getCurrentSession();
		String hql = "FROM EmployeeBean where whichIdentity=1";
		return session.createQuery(hql).getResultList();
	}
	
	@Override
	public List<EmployeeBean> getEmployeeByIdentity() {
		Session session = factory.getCurrentSession();
		String hql = "FROM EmployeeBean ";
		return session.createQuery(hql).getResultList();
	}

}
