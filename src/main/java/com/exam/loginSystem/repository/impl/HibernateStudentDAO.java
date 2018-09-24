package com.exam.loginSystem.repository.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.exam.loginSystem.model.StudentBean;
import com.exam.loginSystem.repository.StudentDAO;

@Repository
public class HibernateStudentDAO implements StudentDAO {

	@Autowired
	SessionFactory factory;
	
	
	@Override
	public StudentBean getStudentBeanByEmail(String email) {//用email欄位搜尋一行資料行
		String hql= "From StudentBean WHERE email= :theRightEmail";
		Session session= factory.getCurrentSession();//取得連線以便於進資料庫更動資料
		StudentBean sb= null;
		sb=(StudentBean)session.createQuery(hql).setParameter("theRightEmail", email).getSingleResult();//getSingleResult()獲得單一筆資料行
		return sb;//回傳一列資料行(一個物件)
	}
	
	
	@Override
	public List<StudentBean> getAllStudents() {//搜尋全部的Student資料
		
		String hql= "FROM StudentBean";
		
		Session session= factory.getCurrentSession();
		List<StudentBean> list= session.createQuery(hql).getResultList();//getResultList()能獲得多筆資料行
		return list;
	}

	@Override
	public StudentBean getStudentBean(int studentId) {//用(PK鍵)studentId查詢單筆資料
		
		StudentBean ssstudentBean= null;
		//System.out.println(factory);//debug用列印
		Session session= factory.getCurrentSession();
		ssstudentBean= session.get(StudentBean.class, studentId);//指定Student表格內之studentId(本處必為pk鍵)欄位進行查詢
		return ssstudentBean;
	}

	
	@Override
	public void createStudent(StudentBean studentBean) {//即insert
		Session session= factory.getCurrentSession();
		session.save(studentBean);  //把一列資料(studentBean)放進資料庫
	}

	@Override
	public void deleteStudent(int studentId) {//刪除->先進行單筆查詢才能刪除
		Session session= factory.getCurrentSession();
		session.delete(session.get(StudentBean.class, studentId));
	}
//	原程式
//	public void deleteStudent(int studentId) {
//		Session session= factory.getCurrentSession();
//	    StudentBean ssstudentBean =session.get(StudentBean.class, studentId)
//		session.delete(ssstudentBean);
//	}

	@Override//(a)究竟是否有Score欄位??資料庫建置時沒看到欄位的問題  以及(b)學生表格的classID和班級表格的classId是否統一之問題
	public void updateStudent(StudentBean studentBean) {//更新  表格  重製  列出全部欄位  格式為Bean內之屬性名= :Bean內之屬性名
		String hql= "UPDATE StudentBean SET thisIsClass= :thisIsClass, studentName= :studentName, gender= :gender,"
				                         + "address= :address, phone= :phone, email= :email,"
				                         + "birthday= :birthday, education= :education, photo= :photo,"
				                         + "photoName= :photoName, salary= :salary,"
				                         + "score= :score,"
				                         + "startWorkDate= :startWorkDate, whichIdentity= :whichIdentity, encryptURL= :encryptURL,"
				                         + "classId= :classId WHERE studentId= :studentId";
		Session session= factory.getCurrentSession();
		
		session.createQuery(hql).setParameter("thisIsClass", studentBean.getThisIsClass())
		                        .setParameter("studentName", studentBean.getStudentName())
		                        .setParameter("gender", studentBean.getGender())
		                        .setParameter("address", studentBean.getAddress())
		                        .setParameter("phone", studentBean.getPhone())
		                        .setParameter("email", studentBean.getEmail())
		                        .setParameter("birthday", studentBean.getBirthday())
		                        .setParameter("education", studentBean.getEducation())
		                        .setParameter("photo", studentBean.getPhoto())
		                        .setParameter("photoName", studentBean.getPhotoName())
		                        .setParameter("score", studentBean.getScore())
		                        .setParameter("salary", studentBean.getSalary())
		                        .setParameter("startWorkDate", studentBean.getStartWorkDate())
		                        .setParameter("whichIdentity", studentBean.getWhichIdentity())
		                        .setParameter("encryptURL", studentBean.getEncryptURL())
		                        .setParameter("classId", studentBean.getClassId())
		                        .setParameter("studentId", studentBean.getStudentId())
		                        .executeUpdate();
		                      //.setParameter("Score", studentBean.getScore())
	}
	
	@Override
	public List<StudentBean> getStudentsByClassId(String classId) {
		Session session = factory.getCurrentSession();
		String hql = "FROM StudentBean WHERE thisIsClass= :classId";
		
		return session.createQuery(hql).setParameter("classId", classId).getResultList();
	}

}











