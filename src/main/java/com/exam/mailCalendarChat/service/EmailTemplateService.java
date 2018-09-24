package com.exam.mailCalendarChat.service;

import java.util.List;

import com.exam.mailCalendarChat.model.EmailTemplateBean;

public interface EmailTemplateService {

	List<EmailTemplateBean> getAllEmailTemplates();
	EmailTemplateBean getEmailTemplatebean (int emailId);
	void createEmailTemplate(EmailTemplateBean bean);
	void deleteEmailTemplate(int emailId);
	void updateEmailTemplate(int emailId, String title, String content);
	
}
