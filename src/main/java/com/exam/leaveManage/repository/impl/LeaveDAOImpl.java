package com.exam.leaveManage.repository.impl;



import java.sql.Timestamp;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.exam.leaveManage.model.LeaveBean;
import com.exam.mailCalendarChat.model.EmployeeBean;
import com.exam.mailCalendarChat.repository.impl.HibernateEmployeeDAO;


@Repository
public class LeaveDAOImpl implements LeaveDAO {

	@Autowired
	SessionFactory factory;
	@Autowired
	HibernateEmployeeDAO EmployeeDAO;
	
	@Override
	public List<LeaveBean> getAllLeaveBean() {
		String hql = "from LeaveBean WHERE state=0";
		Session session = factory.getCurrentSession();
		
		return session.createQuery(hql).getResultList();		
	}

	@Override
	public Set<String> getAgentName(Timestamp startDate, Timestamp endDate,int id) {
//		String hql = " FROM LeaveBean WHERE agentName NOT IN"+ 
//				"(SELECT agentName FROM LeaveBean WHERE (startDate BETWEEN :startDate AND :endDate OR endDate BETWEEN :startDate AND :endDate)"+ 
//				"OR startDate<:startDate AND endDate > :endDate)";
		
		String hql ="SELECT DISTINCT e.employeeId FROM LeaveBean as l FULL JOIN EmployeeBean as e on l.employeeId=e.employeeId "+ 
			    "WHERE e.employeeId  not in (SELECT employeeId FROM LeaveBean WHERE (startDate BETWEEN :startDate AND :endDate OR endDate BETWEEN :startDate AND :endDate) OR startDate<:startDate AND endDate > :endDate) "+
				"and (e.employeeId <> :id and whichIdentity=:WhichIdentity)"; 
        
		EmployeeBean bean = EmployeeDAO.getEmployeeById(id);
		int WhichIdentity = (int)bean.getWhichIdentity();
		Session session = factory.getCurrentSession();		
		List<Integer> agent = session.createQuery(hql).setParameter("startDate", startDate).setParameter("endDate", endDate).setParameter("id", id).setParameter("WhichIdentity", WhichIdentity).getResultList();

		System.out.println(agent);
		Set<String> empName=new HashSet();
		for(Integer id2 :agent ) {
			empName.add(String.valueOf(id2)+" : "+EmployeeDAO.getEmployeeById(id2).getEmployeeName());
			
		}
//		System.out.println(empName);
		return empName;
		
	}

	@Override
	public List<LeaveBean> getLeaveBeanByEmployeeId(int employeeId) {
		String hql = "from LeaveBean WHERE state=0 and employeeId = :employeeId";
		Session session = factory.getCurrentSession(); 
		
		return session.createQuery(hql).setParameter("employeeId", employeeId).getResultList();
	}

	@Override
	public void createLeaveBean(LeaveBean Leave) {
		Session session = factory.getCurrentSession();
		EmployeeBean ebean = EmployeeDAO.getEmployeeById(Leave.getEmployeeId());
		if(ebean!=null) {			
			Leave.setEmployeebean(ebean);  //確認Leave的EmployeeId是存在的??
			session.save(Leave);
		}else
			System.out.println("沒有這個傢伙(員工)!!");			
	}
	
	public EmployeeBean getEmployeeById(int id) {
		Session session = factory.getCurrentSession(); 
		return session.get(EmployeeBean.class, id);
		
	}

	@Override
	public void deleteLeaveBean(int eventId) {
		String hql = "UPDATE LeaveBean SET state = 1 WHERE eventId = :eventId";
		Session session = factory.getCurrentSession();

		int n = session.createQuery(hql).setParameter("eventId", eventId)
				.executeUpdate();		
	}

	@Override
	public void updateLeaveBean(int eventId, Timestamp startDate, Timestamp endDate, String reason) {
		Session session = factory.getCurrentSession();
		LeaveBean bean =session.get(LeaveBean.class, eventId);
		if(bean != null) {
			bean.setStartDate(startDate);
			bean.setEndDate(endDate);
			bean.setReason(reason);
			bean.setApproval(1);
		}
	}

	@Override
	public void approvalLeave(int eventId) {
		Session session = factory.getCurrentSession();
		LeaveBean bean =session.get(LeaveBean.class, eventId);	
		if(bean != null) {

			bean.setApproval(0);
		}
	}

	@Override
	public void updateLeaveDate(int eventId, Timestamp startDate, Timestamp endDate, String reason) {
		Session session = factory.getCurrentSession();
		LeaveBean bean =session.get(LeaveBean.class, eventId);
		if(bean != null) {
			bean.setStartDate(startDate);
			bean.setEndDate(endDate);
			bean.setReason(reason);
		}
		
	}

	@Override
	public List<LeaveBean> getApprovalLeave() {
		String hql = "from LeaveBean WHERE state=0 and approval=0";
		Session session = factory.getCurrentSession();
		
		return session.createQuery(hql).getResultList();
	}

	@Override
	public List<LeaveBean> getUnApprovedLeave() {
		String hql = "from LeaveBean WHERE state=0 and approval=1";
		Session session = factory.getCurrentSession();
		
		return session.createQuery(hql).getResultList();
	}



}
