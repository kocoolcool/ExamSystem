package com.exam.mailCalendarChat.repository;

import java.util.List;

import com.exam.ExamManage.model.ExamBean;
import com.exam.backManageInfo.model.ClassBean;
import com.exam.loginSystem.model.StudentBean;

public interface FilterClassByEmployeeDAO {
	//根據考官登入身分，判斷他有被安排管理的班級
	List<ClassBean> getClassBeanByEmployee(int employeeId);
	List<StudentBean> getStudentBeanByEmployeeWithClass(int employeeId);
}
