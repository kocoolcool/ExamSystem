package com.exam.leaveManage.repository.impl;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

import com.exam.leaveManage.model.LeaveBean;

public interface LeaveDAO {  //List<agentName>

	public List<LeaveBean> getAllLeaveBean();
	public List<LeaveBean> getApprovalLeave();
	public List<LeaveBean> getUnApprovedLeave();	
	public Set<String> getAgentName(Timestamp startDate,Timestamp endDate,int id);
	public List<LeaveBean> getLeaveBeanByEmployeeId(int employeeId);
	public void createLeaveBean(LeaveBean Leave);
	public void deleteLeaveBean(int eventId);
	public void updateLeaveBean(int eventId,Timestamp startDate,Timestamp endDate,String reason);
	public void approvalLeave(int eventId);
	public void updateLeaveDate(int eventId,Timestamp startDate,Timestamp endDate,String reason);
	
}