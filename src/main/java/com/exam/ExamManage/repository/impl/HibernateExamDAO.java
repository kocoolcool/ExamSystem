package com.exam.ExamManage.repository.impl;


import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.exam.ExamManage.model.ExamBean;
import com.exam.ExamManage.repository.ExamDAO;
import com.exam.examAppointment.model.AppBean;
import com.exam.loginSystem.model.StudentBean;
@Repository
public class HibernateExamDAO implements ExamDAO{
	@Autowired
	SessionFactory factory;
	@Override
	public void insertExam(ExamBean examBean) {
		Session session=factory.getCurrentSession();
		examBean.setStatus(0);
		session.save(examBean);
	}

	@Override
	public void updateClassID(String examId, String newClass) {
		String hql="Update ExamBean set classId = :newClass Where examId = :id";
		Session session=factory.getCurrentSession();
				session.createQuery(hql)
				.setParameter("id", examId)
				.executeUpdate();		
	}

	@Override
	public List<ExamBean> getAllExams() {
		String hql="FROM ExamBean";
		Session session=factory.getCurrentSession();
		List<ExamBean> list=new ArrayList<>();
		list=session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public ExamBean getExamByID(String examId) {
		ExamBean eb=null;
		Session session=factory.getCurrentSession();
		eb=session.get(ExamBean.class, examId);
		return eb;
	}

	@Override
	public List<String> getAllClassId() {
		String hql="SELECT DISTINCT e.classId From ExamBean e";
		Session session=factory.getCurrentSession();
		List<String> list=new ArrayList<>();
		list=session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public void deleteExam(String examId) {
		Session session=factory.getCurrentSession();
		ExamBean bean=session.get(ExamBean.class,examId);
		if(bean !=null) {
		session.delete(bean);
		}
	}

	@Override
	public void updateAll(String examId, String newClass,Timestamp newExamTime, String newExamSubject,
			int newEmployeeId, int newMaxAppointment) {
		String hql="Update ExamBean set classId = :newClass ,examTime=:newExamTime,ExamSubject=:newExamSubject,EmployeeId=:newEmployeeId,maxAppointment=:newMaxAppointment Where examId = :id";
				Session session=factory.getCurrentSession();		
				session.createQuery(hql)
				.setParameter("newClass", newClass)
				.setParameter("newExamTime", newExamTime)
				.setParameter("newExamSubject", newExamSubject)
				.setParameter("newEmployeeId", newEmployeeId)
				.setParameter("newMaxAppointment", newMaxAppointment)
				.setParameter("id", examId)
				.executeUpdate();
	}

	@Override
	public void updateStatus(int newStatus,String examId) {
		String hql="Update ExamBean set status= :newStatus where examId=:id";
		Session session=factory.getCurrentSession();
		session.createQuery(hql).
		setParameter("newStatus", newStatus)
		.setParameter("id", examId)
		.executeUpdate();
	}

	@Override
	public List<ExamBean> getExamsByClass(String classId) {
		String hql="From ExamBean eb where eb.classId=:classId And status=0";
		List<ExamBean> list=new ArrayList<>();
		Session session=factory.getCurrentSession();
		list=session.createQuery(hql).setParameter("classId", classId).getResultList();
		return list;
	}

	@Override
	public List<StudentBean> getStudentByClassId(String classId) {
		String hql="From StudentBean as sb where sb.thisIsClass=:classId";
		List<StudentBean> list=new ArrayList<>();
		Session session=factory.getCurrentSession();
		list=session.createQuery(hql).setParameter("classId", classId).getResultList();
		return list;
	}
	@Override
	public List<ExamBean> getExamByEmpId(int employeeId) {
		String hql="From ExamBean eb where eb.employeeId=:employeeId";
		List<ExamBean> list=new ArrayList<>();
		Session session=factory.getCurrentSession();
		list=session.createQuery(hql).setParameter("employeeId", employeeId).getResultList();
		return list;	}
	
	@Override
	public List<AppBean> getStudentByExamId(String examId) {
		String hql="From AppBean  ab where ab.examid=:examId and statusCFM=1";
		List<AppBean> list=new ArrayList<>();
		Session session=factory.getCurrentSession();
		list=session.createQuery(hql).setParameter("examId", examId).getResultList();
		return list;
	}

	@Override
	public List<AppBean> getScore() {
		String hql="FROM AppBean";
		Session session=factory.getCurrentSession();
		List<AppBean> list=new ArrayList<>();
		list=session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public List<ExamBean> getAllExamOnly0() {
		String hql="FROM ExamBean where status=0";
		Session session=factory.getCurrentSession();
		List<ExamBean> list=new ArrayList<>();
		list=session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public List<ExamBean> getAllExamOnly1() {
		String hql="FROM ExamBean where status=1";
		Session session=factory.getCurrentSession();
		List<ExamBean> list=new ArrayList<>();
		list=session.createQuery(hql).getResultList();
		return list;
	}

}
