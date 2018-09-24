package com.exam.ExamManage.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import javax.xml.bind.annotation.XmlType;

import com.exam.backManageInfo.model.ClassBean;
import com.exam.mailCalendarChat.model.EmployeeBean;
import com.fasterxml.jackson.annotation.JsonIgnore;
@Entity
@Table(name="Exam")
@XmlRootElement
public class ExamBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name="examId")
	private String examId;
	@XmlTransient
	@JsonIgnore
	@ManyToOne      
	@JoinColumn(name="classId",referencedColumnName="classId",insertable=false,
			updatable=false)
	private ClassBean classBean; 
	@XmlTransient
	@JsonIgnore
	@ManyToOne      
	@JoinColumn(name="employeeId",referencedColumnName="employeeId",insertable=false,
			updatable=false)
	private EmployeeBean employeeBean;
	
	public EmployeeBean getEmployeeBean() {
		return employeeBean;
	}
	public void setEmployeeBean(EmployeeBean employeeBean) {
		this.employeeBean = employeeBean;
	}
	public ClassBean getClassBean() {
		return classBean;
	}
	public void setClassBean(ClassBean classBean) {
		this.classBean = classBean;
	}


	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id",insertable=false)
	private Integer id;
	private String classId;
	private Timestamp examTime;
	private String examSubject;
	private Integer maxAppointment;
	private Integer employeeId;
	private Integer currentAppointment;
	@Column(name="status",insertable=false)
	private Integer status;

	
	
	
	public ExamBean(String examId, String classId, Timestamp examTime, String examSubject,
			Integer maxAppointment, Integer employeeId, Integer currentAppointment,Integer status) {
		this.examId = examId;
		this.classId = classId;
		this.examTime = examTime;
		this.examSubject = examSubject;
		this.maxAppointment = maxAppointment;
		this.employeeId = employeeId;
		this.currentAppointment = currentAppointment;
		this.status=status;
	}
	public ExamBean() {
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getExamId() {
		return examId;
	}
	public void setExamId(String examId) {
		this.examId = examId;
	}
	public String getClassId() {
		return classId;
	}
	public void setClassId(String classId) {
		this.classId = classId;
	}
	
	public Timestamp getExamTime() {
		return examTime;
	}
	public void setExamTime(Timestamp examTime) {
		this.examTime = examTime;
	}
	public String getExamSubject() {
		return examSubject;
	}
	public void setExamSubject(String examSubject) {
		this.examSubject = examSubject;
	}
	public Integer getMaxAppointment() {
		return maxAppointment;
	}
	public void setMaxAppointment(Integer maxAppointment) {
		this.maxAppointment = maxAppointment;
	}
	public Integer getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
	}
	public Integer getCurrentAppointment() {
		return currentAppointment;
	}
	public void setCurrentAppointment(Integer currentAppointment) {
		this.currentAppointment = currentAppointment;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "ExamBean [examId=" + examId + ", classBean=" + classBean + ", employeeBean=" + employeeBean + ", id="
				+ id + ", classId=" + classId + ", examTime=" + examTime + ", examSubject=" + examSubject
				+ ", maxAppointment=" + maxAppointment + ", employeeId=" + employeeId + ", currentAppointment="
				+ currentAppointment + ", status=" + status + "]";
	}
	

	
	
	
}
