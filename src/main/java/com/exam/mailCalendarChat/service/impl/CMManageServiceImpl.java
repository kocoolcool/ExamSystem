package com.exam.mailCalendarChat.service.impl;

import java.sql.Blob;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.exam.mailCalendarChat.model.CMManageBean;
import com.exam.mailCalendarChat.repository.CMManageDAO;
import com.exam.mailCalendarChat.service.CMManageService;

@Service
@Transactional
public class CMManageServiceImpl implements CMManageService {

	@Autowired
	CMManageDAO cMManageDAO;
	
	@Override
	public List<CMManageBean> getAllCMManageBean() {
		// TODO Auto-generated method stub
		return cMManageDAO.getAllCMManageBean();
	}

	@Override
	public CMManageBean getCMManageBeanById(int id) {
		// TODO Auto-generated method stub
		return cMManageDAO.getCMManageBeanById(id);
	}

	@Override
	public CMManageBean getCMManageBeanByImageName(String imageName) {
		// TODO Auto-generated method stub
		return cMManageDAO.getCMManageBeanByImageName(imageName);
	}

	@Override
	public void insertCMManageBean(CMManageBean cMManageBean) {
		cMManageDAO.insertCMManageBean(cMManageBean);

	}

	@Override
	public void deleteCMManageBean(int id) {
		cMManageDAO.deleteCMManageBean(id);

	}

	@Override
	public void updateCMManageBean(int id, String imageName, Blob image, String webURL, String title,
			String description, int sortNumber) {
		cMManageDAO.updateCMManageBean(id, imageName, image, webURL, title, description, sortNumber);

	}

	@Override
	public List<CMManageBean> getAllCMManageBeanByOrder() {
		// TODO Auto-generated method stub
		return cMManageDAO.getAllCMManageBeanByOrder();
	}

	@Override
	public void updateCMManageBeanSortNumber(int id, int sortNumber) {
		cMManageDAO.updateCMManageBeanSortNumber(id, sortNumber);
		
	}

}
