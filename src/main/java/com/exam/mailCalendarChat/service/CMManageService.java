package com.exam.mailCalendarChat.service;

import java.sql.Blob;
import java.util.List;

import com.exam.mailCalendarChat.model.CMManageBean;

public interface CMManageService {
	List<CMManageBean> getAllCMManageBean();
	CMManageBean getCMManageBeanById(int id);
	CMManageBean getCMManageBeanByImageName(String imageName);
	void insertCMManageBean(CMManageBean cMManageBean);
	void deleteCMManageBean(int id);
	void updateCMManageBean(int id, String imageName, Blob image, String linkURL, String title, String description, int sortNumber);
	
	List<CMManageBean> getAllCMManageBeanByOrder();
	void updateCMManageBeanSortNumber(int id, int sortNumber);
}
