package com.exam.login;

import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.exam.loginSystem.model.StudentBean;
//import com.exam.model.UserInfoBean;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;

@Service
public class UserInfoServiceImp implements UserInfoService {
    @Autowired
    UserInfoRepository repository;
   
    
//    @Override
//	@Transactional
//	public void updateUser(UserInfoBean userInfo) {
//		UserInfoBean ub = repository.getUserByEmail(userInfo.getUserEmail());
//		ub.setUserName(userInfo.getUserName());
//		ub.setUserNumber(userInfo.getUserNumber());
//		ub.setUserPassword(userInfo.getUserPassword());
//	}
//    
//	
//	@Override
//	@Transactional
//	public UserInfoBean getUserEmail(String userEmail) {
//		System.out.println("Service Test");
//		return repository.getUserByEmail(userEmail);
//	
//	}
    
    
//	@Override
//	@Transactional
//	public Boolean addUser(UserInfoBean userInfo) {
//		System.out.println("Service test");
//		UserInfoBean uf = repository.getUserByEmail(userInfo.getUserEmail());
//		System.out.println("Service uf:"+uf);
//		System.out.println("Service userInfo:" +userInfo);
//		if(uf == null) {
//		repository.addUser(userInfo);
//		  return true;
//		}
//		return false;
//	}

    
//	@Override
//	@Transactional
//	public Boolean checkUser(UserInfoBean userInfo){
//		String userEmail = userInfo.getUserEmail();
//		System.out.println("Service userEmail:" + userEmail);
//		String userPassword = userInfo.getUserPassword();
//		System.out.println("Service userInfo:"+ userPassword);
//		UserInfoBean uf = repository.getUserByEmail(userInfo.getUserEmail());
//		System.out.println("Service DB:" + uf);
//		
//		if((uf!=null)&& (userEmail.equals(uf.getUserEmail())) && (userPassword.equals(uf.getUserPassword()))) {
//			return true;
//		}	
//		return false;
//	}

    
	@Override
	@Transactional
	public Boolean checkGoogle(String googleEmail) {
		System.out.println(googleEmail);
		StudentBean sb= repository.getGoogleUserById(googleEmail);//如果以google資訊撈得出資料 回傳true
		if(sb !=null) {
			System.out.println("checkGoogle:" +sb);
			return true;
		}
		//如果以google資訊email沒獲得資料 回傳false
		System.out.println("checkGoogle:" +sb);
		return false;
	}
	

	@Override
	@Transactional
	public StudentBean getGoogleUserById(String googleEmail) {
		StudentBean sb = repository.getGoogleUserById(googleEmail);
		return sb;
	}

	
}


