package com.exam.backManageInfo.service.impl;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.exam.backManageInfo.model.ClassBean;
import com.exam.backManageInfo.repository.ClassDAO;
import com.exam.backManageInfo.service.ClassService;

@Service
@Transactional
public class ClassServiceImpl implements ClassService {

	@Autowired
	ClassDAO classDAO;
	
	@Override
	public List<ClassBean> getAllClass() {
		// TODO Auto-generated method stub
		return classDAO.getAllClass();
	}

	@Override
	public void createClass(ClassBean bean) {
		// TODO Auto-generated method stub
		classDAO.createClass(bean);
	}

	@Override
	public void deleteClass(String classId) {
		// TODO Auto-generated method stub
		classDAO.deleteClass(classId);
	}

	@Override
	public void updateClass(String classId, String className, String address, Date examStart, Date examEnd) {
		// TODO Auto-generated method stub
		classDAO.updateClass(classId, className, address, examStart, examEnd);
	}

}
