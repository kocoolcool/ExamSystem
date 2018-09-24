package com.exam.login;

import com.exam.loginSystem.model.StudentBean;
//import com.exam.model.UserInfoBean;

public interface UserInfoService {

//	void updateUser(UserInfoBean userInfo);
//
//	UserInfoBean getUserEmail(String userEmail);
//
//	Boolean addUser(UserInfoBean userInfo);
//    
//	Boolean checkUser(UserInfoBean userInfo);
	
	Boolean checkGoogle(String googleUserId);
	
	StudentBean getGoogleUserById(String googleUserId);
	
	
	
}