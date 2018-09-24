package com.exam.ExamManage.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

import com.exam.ExamManage.model.ExamBean;
import com.exam.backManageInfo.model.ClassBean;
import com.exam.examAppointment.model.AppBean;
import com.exam.loginSystem.model.StudentBean;
import com.exam.mailCalendarChat.model.EmployeeBean;

public interface ExamService {

	List<ExamBean> getAllExam();
	void updateClassID(String examId,String newClass);
	ExamBean getExamByID(String examId);
	List<String> getAllClassId();
	List<ExamBean> getExamsByClass(String classId);
	void insertExam(ExamBean exam);
	List<ClassBean> getAllClass();
	ClassBean getClassById(String classId);
	List<EmployeeBean> getEmployeeList();
	void updateAll(String examId, String newClass,Timestamp newExamTime,String newExamSubject,int newemployeeId,int maxAppointment);
	void deleteExam(String examId);
	List<String> getAllEmployee();
	List<StudentBean> getStudentByClassId(String classId);
	List<ExamBean> getExamByEmpId(int employeeId);
	List<EmployeeBean> getAllEmployeeOnly0();
	List<AppBean>getStudentByExamId(String examId);
	public void updateStatus(int newStatus,String examId);
	List<AppBean> getScore();
	List<ExamBean> getAllExamOnly0();
	List<ExamBean> getAllExamOnly1();
}