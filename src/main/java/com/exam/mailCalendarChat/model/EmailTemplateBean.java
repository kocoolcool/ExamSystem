package com.exam.mailCalendarChat.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="EmailTemplate")
public class EmailTemplateBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer emailId;
	private String title;
	private String content;
	private Integer status;
	public Integer getEmailId() {
		return emailId;
	}
	public void setEmailId(Integer emailId) {
		this.emailId = emailId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "EmailTemplateBean [emailId=" + emailId + ", title=" + title + ", content=" + content + ", status="
				+ status + "]";
	}
	
	
}
