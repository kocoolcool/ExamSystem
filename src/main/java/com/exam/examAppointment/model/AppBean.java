package com.exam.examAppointment.model;



import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;



import com.exam.examAppointment.model.AppBean;

@Entity
@Table(name="AppointmentTable")
public class AppBean {
	
    @Id
	private int studentid;
	private String examid;
	private java.util.Date applicationdate;
	private int statusCFM;
	private int score;
	

    public AppBean(){}
	@Override
	public String toString() {
		return "{"+studentid+":"+examid+":"+applicationdate+":"+statusCFM+":"+score+"}";
	}
	public int getStudentid() {
		return studentid;
	}
	public void setStudentid(int studentid) {
		this.studentid = studentid;
	}
	public String getExamid() {
		return examid;
	}
	public void setExamid(String examid) {
		this.examid = examid;
	}
	public java.util.Date getApplicationdate() {
		return applicationdate;
	}
	public void setApplicationdate(java.util.Date applicationdate) {
		this.applicationdate = applicationdate;
	}
	public int getStatusCFM() {
		return statusCFM;
	}
	public void setStatusCFM(int statusCFM) {
		this.statusCFM = statusCFM;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
}
