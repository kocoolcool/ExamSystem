package com.exam.leaveManage.service.impl;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.exam.leaveManage.model.LeaveBean;
import com.exam.leaveManage.repository.impl.LeaveDAO;
import com.exam.leaveManage.service.LeaveService;

@Service
@Transactional
public class LeaveServiceImpl implements LeaveService {

	@Autowired
	LeaveDAO leaveDAO;
	
	@Override
	public List<LeaveBean> getAllLeaveBean() {

		return leaveDAO.getAllLeaveBean();
	}

	@Override
	public Set<String> getAgentName(Timestamp startDate, Timestamp endDate,int id) {
		
		return leaveDAO.getAgentName(startDate, endDate,id);
	}

	@Override
	public List<LeaveBean> getLeaveBeanByEmployeeId(int employeeId) {
		// TODO Auto-generated method stub
		return leaveDAO.getLeaveBeanByEmployeeId(employeeId);
	}

	@Override
	public void createLeaveBean(LeaveBean Leave) {
		leaveDAO.createLeaveBean(Leave);

	}

	@Override
	public void deleteLeaveBean(int eventId) {
		leaveDAO.deleteLeaveBean(eventId);

	}

	@Override
	public void updateLeaveBean(int eventId, Timestamp startDate, Timestamp endDate, String reason) {
		leaveDAO.updateLeaveBean(eventId, startDate, endDate, reason);

	}

	@Override
	public void approvalLeave(int eventId) {
		leaveDAO.approvalLeave(eventId);
	}

	@Override
	public void updateLeaveDate(int eventId, Timestamp startDate, Timestamp endDate, String reason) {
		leaveDAO.updateLeaveDate(eventId, startDate, endDate, reason);
		
	}

	@Override
	public List<LeaveBean> getApprovalLeave() {
		return leaveDAO.getApprovalLeave();
	}

	@Override
	public List<LeaveBean> getUnApprovedLeave() {
		return leaveDAO.getUnApprovedLeave();
	}

}
