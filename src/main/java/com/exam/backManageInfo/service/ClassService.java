package com.exam.backManageInfo.service;

import java.sql.Date;
import java.util.List;

import com.exam.backManageInfo.model.ClassBean;

public interface ClassService {
	List<ClassBean> getAllClass();
	
	void createClass(ClassBean bean);
	void deleteClass(String classId);
	void updateClass(String classId, String className, String address, Date examStart, Date examEnd);
}
