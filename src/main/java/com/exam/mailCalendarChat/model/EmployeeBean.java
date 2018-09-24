package com.exam.mailCalendarChat.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.exam.ExamManage.model.ExamBean;
import com.exam.leaveManage.model.LeaveBean;

@Entity
@Table(name="employee")
public class EmployeeBean  implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@OneToMany(
			mappedBy="employeebean",
			cascade={CascadeType.REMOVE}
			)
	private Set<LeaveBean> leaveBean;
	
	@OneToMany(
			mappedBy="employeeBean",
			cascade={CascadeType.REMOVE}
			)
	private Set<ExamBean> examBean;
	
	public Set<ExamBean> getExamBean() {
		return examBean;
	}
	public void setExamBean(Set<ExamBean> examBean) {
		this.examBean = examBean;
	}
	public Set<LeaveBean> getLeaveBean() {
		return leaveBean;
	}
	public void setLeaveBean(Set<LeaveBean> leaveBean) {
		this.leaveBean = leaveBean;
	}
	
	@Id
	private Integer employeeId;
	private String employeeName;
	private String position;
	private String email;
	private String address;
	private String phone;
	private Integer whichIdentity;
	private byte[] photo;
	private String photoName;
	public Integer getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Integer getWhichIdentity() {
		return whichIdentity;
	}
	public void setWhichIdentity(Integer whichIdentity) {
		this.whichIdentity = whichIdentity;
	}
	public byte[] getPhoto() {
		return photo;
	}
	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}
	public String getPhotoName() {
		return photoName;
	}
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	@Override
	public String toString() {
		return "employeeBean [employeeId=" + employeeId + ", employeeName=" + employeeName + ", position=" + position
				+ ", email=" + email + ", address=" + address + ", phone=" + phone + ", whichIdentity=" + whichIdentity
				+ ", photoName=" + photoName + "]";
	}
	
	
	
}
