package com.exam.examAppointment.service;

import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.exam.examAppointment.model.AppBean;
import com.exam.examAppointment.repository.AppDAO;

@Service
public class AppService {
	@Autowired
	private AppDAO appDao;
	public AppService(AppDAO dao) {
	this.appDao = dao;	}	
	
	@Transactional
	public List<AppBean> select(AppBean bean) {
		List<AppBean> result = null;
		if(bean!=null && bean.getStudentid()!=0) {
			AppBean tempxy = appDao.select(bean.getStudentid());
			if(tempxy!=null) {
				result = new ArrayList<AppBean>();
				result.add(tempxy);	}			
		} else {
			result = appDao.select(); 
		}
		return result;
	}
	@Transactional
	public AppBean insert(AppBean bean) {
		AppBean result = null;
		if(bean!=null) {			
			result = appDao.insert(bean);
		}
		return result;
	}
	@Transactional
	public AppBean update(AppBean bean) {
		AppBean result = null;
		if(bean!=null) {
			result = appDao.update(bean.getExamid(), bean.getApplicationdate(),
			bean.getStatusCFM(), bean.getScore(), bean.getStudentid());		
		}
		return result;
	}
	@Transactional
	public boolean delete(AppBean bean) {
		boolean result = false;
		if(bean!=null) {
			result = appDao.delete(bean.getStudentid());
		}
		return result;
	}
}
