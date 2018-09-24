package com.exam.backManageInfo.model;

import java.io.Serializable;
import java.sql.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.exam.ExamManage.model.ExamBean;

@Entity
@Table(name="Class")
public class ClassBean implements Serializable {

	@OneToMany(
			mappedBy="classBean",
			cascade={CascadeType.REMOVE}
			)
	private Set<ExamBean> examBean;
	
	public Set<ExamBean> getExamBean() {
		return examBean;
	}
	public void setExamBean(Set<ExamBean> examBean) {
		this.examBean = examBean;
	}
	@Id
	private String classId;
	private String className;
	private String address;
	private Date examStart;
	private Date examEnd;
	private Integer state;
	
	
	public ClassBean(Set<ExamBean> examBean, String classId, String className, String address, Date examStart,
			Date examEnd, Integer state) {
		this.examBean = examBean;
		this.classId = classId;
		this.className = className;
		this.address = address;
		this.examStart = examStart;
		this.examEnd = examEnd;
		this.state = state;
	}
	
	
	public ClassBean() {
	}
	public String getClassId() {
		return classId;
	}
	public void setClassId(String classId) {
		this.classId = classId;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getExamStart() {
		return examStart;
	}
	public void setExamStart(Date examStart) {
		this.examStart = examStart;
	}
	public Date getExamEnd() {
		return examEnd;
	}
	public void setExamEnd(Date examEnd) {
		this.examEnd = examEnd;
	}
	public Integer getstate() {
		return state;
	}
	public void setstate(Integer state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "ClassBean [classId=" + classId + ", className=" + className + ", address=" + address + ", examStart="
				+ examStart + ", examEnd=" + examEnd + ", state=" + state + "]";
	}

	
	
}
