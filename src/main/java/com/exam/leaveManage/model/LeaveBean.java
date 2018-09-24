package com.exam.leaveManage.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlRootElement;

import com.exam.mailCalendarChat.model.EmployeeBean;

@Entity
@Table(name="Leave")
@XmlRootElement
public class LeaveBean implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@ManyToOne        
	@JoinColumn(name="employeeId",referencedColumnName="employeeId",insertable=false,
			updatable=false)
	private EmployeeBean employeebean;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer eventId;
//	@Transient
	private Integer employeeId;
	private Timestamp startDate;
	private Timestamp endDate;
	private String reason;
	private String agentName;
	private Integer approval;
	private Integer state;
	
	public  Integer getEventId() {
		return eventId;
	}
	public void setEventId(Integer eventId) {
		this.eventId = eventId;
	}
	public Integer getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
	}
	public Timestamp getStartDate() {
		return startDate;
	}
	public void setStartDate(Timestamp startDate) {
		this.startDate = startDate;
	}
	public Timestamp getEndDate() {
		return endDate;
	}
	public void setEndDate(Timestamp endDate) {
		this.endDate = endDate;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getAgentName() {
		return agentName;
	}
	public void setAgentName(String agentName) {
		this.agentName = agentName;
	}
	public Integer getApproval() {
		return approval;
	}
	public void setApproval(Integer approval) {
		this.approval = approval;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}	
	////////////////////////////////////////
	public EmployeeBean getEmployeebean() {
		return employeebean;
	}
	public void setEmployeebean(EmployeeBean employeebean) {
		this.employeebean = employeebean;
	}
	@Override
	public String toString() {
		return "LeaveBean [eventId=" + eventId + ", employeebean=" + employeebean + ", employeeId=" + employeeId
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", reason=" + reason + ", agentName="
				+ agentName + ", approval=" + approval + ", state=" + state + "]";
	}
	
}
