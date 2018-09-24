package com.exam.ExamManage.repository;



import java.sql.Timestamp;
import java.util.List;

import com.exam.ExamManage.model.ExamBean;
import com.exam.examAppointment.model.AppBean;
import com.exam.loginSystem.model.StudentBean;

public interface ExamDAO {
	//新增考試
	void insertExam(ExamBean exam);
	//更新考試所屬班級
	void updateClassID(String examId,String newClass);
	//更新考試所有資訊
	void updateAll(String examId, String newClass,Timestamp newExamTime,String newExamSubject,int newemployeeId,int maxAppointment);
	//更新考試狀態=Delete
	void updateStatus(int status,String examId);
	//列出所有考試清單
	List<ExamBean> getAllExams();
	//列出所選班級考試清單
	List<ExamBean> getExamsByClass(String classId);
	//列出所選考試編號的考試
	ExamBean getExamByID(String examId);
	//列出所有目前已有安排的考試班級
	List<String> getAllClassId();
	//刪除考試
	void deleteExam(String examId);	
	//取得班級的學生資訊用在寄信
	List<StudentBean> getStudentByClassId(String classId);
	//取得員工負責的考試用在Calendar
	List<ExamBean> getExamByEmpId(int employeeId);
	//取得考試的學生用在考試明細
	List<AppBean>getStudentByExamId(String examId);
	//取得考試分數
	List<AppBean> getScore();
	//列出所有考試清單只有存在的
	List<ExamBean> getAllExamOnly0();
	List<ExamBean> getAllExamOnly1();
}
