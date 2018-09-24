package com.exam.mailCalendarChat.repository;

import com.exam.examAppointment.model.AppBean;

public interface SetHangoutsOnStudentDAO {

	AppBean getAppBeanByStudentId(int studentId);
}
