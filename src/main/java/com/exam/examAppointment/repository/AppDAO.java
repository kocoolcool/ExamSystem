package com.exam.examAppointment.repository;




import java.util.List;

import com.exam.examAppointment.model.AppBean;



public interface AppDAO {

	AppBean select(int studentid);

	List<AppBean> select();

	AppBean insert(AppBean bean);

	AppBean update(String examid, java.util.Date applicationdate, int statusCFM, int score, int studentid);

	boolean delete(int studentid);

}