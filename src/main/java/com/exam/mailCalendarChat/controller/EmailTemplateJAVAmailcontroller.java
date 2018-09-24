package com.exam.mailCalendarChat.controller;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.revinate.sendgrid.SendGrid;
import com.revinate.sendgrid.exception.SendGridException;
import com.revinate.sendgrid.model.Email;
import com.revinate.sendgrid.model.Response;

@Controller
public class EmailTemplateJAVAmailcontroller {

	@RequestMapping("/sendEmailToStudentWithTemplate")
	public String sendEmailToStudent(@RequestParam String selectedEmailList, @RequestParam String selectedNameList,
				@RequestParam String selectedTitle, @RequestParam String selectedContent) {

		//SendGrid寄信
		 SendGrid sendGrid = SendGrid.create("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").build();
//		 SendGrid sendGrid = SendGrid.create("XX").build();
	        Email email = new Email();
//	        email.setHeader("", "");
	        String[] emailList = selectedEmailList.split(",");
	        String[] nameList = selectedNameList.split(",");
	        
	        
	        
	        for(int i=0 ; i<emailList.length ; i++) {
	        	System.out.println("收件人 : " + emailList[i]);
		        email.addTo(emailList[i]);
		        email.setFrom("EEIT101021@gmail.com");
		        email.setSubject(selectedTitle);
//		        email.setText("My first email with SendGrid Java.");
		        email.setHtml(nameList[i] + " 您好!" + "<br>" + selectedContent + "<br><br><br>" + "偉康科技" + "<br>" + "服務處敬上");	
		        try {
		            Response response = sendGrid.mail().send(email);
		            System.out.println(response);
		            sendGrid.close();
		        } catch (SendGridException e) {
		            e.printStackTrace();
		            sendGrid.close();
		        }
	        	
	        	
	        }

//	        email.addTo("eeit10102@gmail.com");
//	        email.setFrom("eeit10102@gmail.com");
//	        email.setSubject("從emailTemplate發信");
////	        email.setText("My first email with SendGrid Java.");
//	        email.setHtml("<h1 style='color:red'>測試</h1>");	
//	        
//	        try {
//	            Response response = sendGrid.mail().send(email);
//	            System.out.println(response);
//	            sendGrid.close();
//	        } catch (SendGridException e) {
//	            e.printStackTrace();
//	            sendGrid.close();
//	        }
	        
	        return "ShowEmailTemplates";
	        //JAVA MAIL寄信
//		  String host = "smtp.gmail.com";  
//	        int port = 587;  
//	        final String username = "eeit10102@gmail.com";  
//	        final String password = "s@123456";  
//	  
//	        Properties props = new Properties();  
//	        props.put("mail.smtp.host", host);  
//	        props.put("mail.smtp.auth", "true");  
//	        props.put("mail.smtp.starttls.enable", "true");  
//	        props.put("mail.smtp.port", port);  
//	          
//	        Session session = Session.getInstance(props,new Authenticator(){  
//	              protected PasswordAuthentication getPasswordAuthentication() {  
//	                  return new PasswordAuthentication(username, password);  
//	              }} );  
//	           
//	        try {  
//	  
//	        Message message = new MimeMessage(session);  
//	        message.setFrom(new InternetAddress("eeit10102@gmail.com"));  
//	        message.setRecipients(Message.RecipientType.TO,   
//	                        InternetAddress.parse("eeit10102@gmail.com"));  
//	        message.setSubject("這是測試唷");  
//	        message.setText("<h1>內容測試!</h1>");	        
//	  
//	        Transport transport = session.getTransport("smtp");  
//	        transport.connect(host, port, username, password);  
//	  
//	        Transport.send(message);  
//	  
//	        System.out.println("Done"); 
//	        
//	  
//	        } catch (MessagingException e) {  
//	            throw new RuntimeException(e);  
//	        }  

	}
	
	
	@RequestMapping("sendEmailToContactUs")
	public String sendEmailToContactUs(HttpServletRequest request) {
		String userName=request.getParameter("userName");
		String userEmail= request.getParameter("userEmail");
		String contactUsViaEmailTitle=request.getParameter("contactUsViaEmailTitle");
		String contactUsViaEmailContent = request.getParameter("contactUsViaEmailContent");
//		System.out.println("==" +userName );
//		System.out.println("==" +userEmail );
//		System.out.println("==" + contactUsViaEmailTitle);
//		System.out.println("==" +contactUsViaEmailContent );
		 SendGrid sendGrid = SendGrid.create("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").build();
	        Email email = new Email();

		        email.addTo("eeit101021@gmail.com");
		        email.setFrom("ContactUsService");
		        email.setSubject(contactUsViaEmailTitle);
		        email.setHtml("<div>寄件者為 : "+userName +"</div><div>寄件者信箱 : " + userEmail+"</div><div>信件內容如下 : </div><hr>" + contactUsViaEmailContent);	
		        
		        try {
		            Response response = sendGrid.mail().send(email);
		            System.out.println(response);
		            sendGrid.close();
		        } catch (SendGridException e) {
		            e.printStackTrace();
		            sendGrid.close();
		        }
		
		
		return "mailCalendarChat/ContactUs.jsp";
	}
}
