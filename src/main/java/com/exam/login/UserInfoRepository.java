package com.exam.login;

import com.exam.loginSystem.model.StudentBean;

public interface UserInfoRepository {

//	UserInfoBean getUserByEmail(String userEmail);
//
//	void addUser(UserInfoBean userInfo);

	void updateUser(String userEmail, String userName, Integer userNumber, String userPassword);

	StudentBean getGoogleUserById(String googleEmail);
	
	
	
}