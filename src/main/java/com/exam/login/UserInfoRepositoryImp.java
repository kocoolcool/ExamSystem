package com.exam.login;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.exam.loginSystem.model.StudentBean;
//import com.exam.model.UserInfoBean;

@Repository
public class UserInfoRepositoryImp implements UserInfoRepository {
	
	
	@Autowired
	SessionFactory factory;

	  
	
//	@Override
//	public UserInfoBean getUserByEmail(String userEmail) {
//		System.out.println("getUserEmail test");
//		String hql = "FROM UserInfoBean where userEmail=:userEmail";
//		Session session = factory.getCurrentSession();
//		System.out.println(userEmail);
//		UserInfoBean ub = (UserInfoBean)session.createQuery(hql).setParameter("userEmail", userEmail).uniqueResult();
//		if(ub == null) {
//			return null;
//		}
//		System.out.println(ub);
//		return ub;
//	}
	

//	@Override
//	public void addUser(UserInfoBean userInfo) {
//		System.out.println("addUser test");
//		Session session = factory.getCurrentSession();
//		session.save(userInfo);
//		
//	}

	
	@Override
	public void updateUser(String userEmail , String userName, Integer userNumber, String userPassword) {
		String hql = "UPDATE UserInfoBean SET  userName= :userName, userNumber = :userNumber, userPassword =:userPassword WHERE userEmail = :userEmail";
		Session session = factory.getCurrentSession();

		int n = session.createQuery(hql).setParameter("userEmail", userEmail)
				.setParameter("userName", userName)
				.setParameter("userNumber", userNumber)
				.setParameter("userPassword", userPassword)
				.executeUpdate();
		
	}


	//改這個方式
	@Override
	public StudentBean getGoogleUserById(String googleEmail) {
		System.out.println("googleUser:" + googleEmail);
		String hql="FROM StudentBean where email =:email";
		Session session = factory.getCurrentSession();
		StudentBean sb=  (StudentBean)session.createQuery(hql).setParameter("email", googleEmail).getSingleResult();
		System.out.println("googleStdentBean:"+ sb );
		return sb;
	}
	
	

}
