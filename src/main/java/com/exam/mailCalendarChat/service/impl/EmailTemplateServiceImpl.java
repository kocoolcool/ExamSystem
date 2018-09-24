package com.exam.mailCalendarChat.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.exam.mailCalendarChat.model.EmailTemplateBean;
import com.exam.mailCalendarChat.repository.EmailTemplateDAO;
import com.exam.mailCalendarChat.service.EmailTemplateService;

@Service
@Transactional
public class EmailTemplateServiceImpl implements EmailTemplateService {

	@Autowired
	EmailTemplateDAO emailTemplateDAO;
	
	@Override
	public List<EmailTemplateBean> getAllEmailTemplates() {
		
		return emailTemplateDAO.getAllEmailTemplates();
	}

	@Override
	public void createEmailTemplate(EmailTemplateBean bean) {
		
		emailTemplateDAO.createEmailTemplate(bean);
		
	}

	@Override
	public void deleteEmailTemplate(int emailId) {
		emailTemplateDAO.deleteEmailTemplate(emailId);
		
	}

	@Override
	public void updateEmailTemplate(int emailId, String title, String content) {
		emailTemplateDAO.updateEmailTemplate(emailId, title, content);
		
	}

	@Override
	public EmailTemplateBean getEmailTemplatebean(int emailId) {
		
		return emailTemplateDAO.getEmailTemplatebean(emailId);
	}

}
