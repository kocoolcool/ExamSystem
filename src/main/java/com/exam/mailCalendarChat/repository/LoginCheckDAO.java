package com.exam.mailCalendarChat.repository;

public interface LoginCheckDAO {
	
	Boolean checkBackManagerLogin(String email);
	Boolean checkExamManagerLogin(String email);
}
