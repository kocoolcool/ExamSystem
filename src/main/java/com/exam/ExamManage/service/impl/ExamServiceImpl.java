package com.exam.ExamManage.service.impl;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.exam.ExamManage.model.ExamBean;
import com.exam.ExamManage.repository.ExamDAO;
import com.exam.ExamManage.service.ExamService;
import com.exam.backManageInfo.model.ClassBean;
import com.exam.backManageInfo.repository.ClassDAO;
import com.exam.examAppointment.model.AppBean;
import com.exam.loginSystem.model.StudentBean;
import com.exam.mailCalendarChat.model.EmployeeBean;
import com.exam.mailCalendarChat.repository.EmployeeDAO;

@Service
public class ExamServiceImpl implements ExamService {
	@Autowired
	private	ExamDAO examDao;
	@Autowired
	private ClassDAO classDao;
	@Autowired
	private EmployeeDAO employeeDao;

	@Override
	@Transactional
	public List<ExamBean> getAllExam(){
		return examDao.getAllExams();
	}
	
	@Override
	@Transactional
	public void updateClassID(String examId,String newClass) {
		examDao.updateClassID(examId, newClass);
		
	}

	@Override
	@Transactional
	public ExamBean getExamByID(String examId) {
		return examDao.getExamByID(examId);
	}

	

	@Override
	@Transactional
	public List<String> getAllClassId() {
		
		return examDao.getAllClassId();
	}

	@Override
	@Transactional
	public List<ExamBean> getExamsByClass(String classId) {
		return examDao.getExamsByClass(classId);
		
	}

	@Override
	@Transactional
	public void insertExam(ExamBean exam) {
		examDao.insertExam(exam);
	}

	@Override
	@Transactional
	public List<ClassBean> getAllClass() {
		return classDao.getAllClass();
	}

	@Override
	@Transactional
	public ClassBean getClassById(String classId) {
		return classDao.getClassById(classId);
	}

	@Override
	@Transactional
	public List<EmployeeBean> getEmployeeList() {
		
		return employeeDao.getAllEmployees();
	}

	@Override
	@Transactional
	public void updateAll(String examId, String newClass, Timestamp newExamTime, String newExamSubject,
			int newemployeeId, int maxAppointment) {
		examDao.updateAll(examId, newClass, newExamTime, newExamSubject, newemployeeId, maxAppointment);
		
	}

	@Override
	@Transactional
	public void deleteExam(String examId) {
		examDao.deleteExam(examId);
		
	}

	@Override
	@Transactional
	public List<String> getAllEmployee() {
		return	employeeDao.getAllEmployee();
	}
	
	@Override
	@Transactional
	public List<EmployeeBean> getAllEmployeeOnly0() {
		return	employeeDao.getAllEmployeeOnly0();
	}

	@Override
	@Transactional
	public List<StudentBean> getStudentByClassId(String classId) {
		return examDao.getStudentByClassId(classId);
	}
	
	@Override
	@Transactional
	public List<ExamBean> getExamByEmpId(int employeeId) {
		return examDao.getExamByEmpId(employeeId);
	}
	
	@Override
	@Transactional
	public List<AppBean> getStudentByExamId(String examId) {
		
		return examDao.getStudentByExamId(examId);
	}

	@Override
	@Transactional
	public void updateStatus(int newStatus, String examId) {
		examDao.updateStatus(newStatus, examId);
		
	}

	@Override
	@Transactional
	public List<AppBean> getScore() {
		return examDao.getScore();
	}

	@Override
	@Transactional
	public List<ExamBean> getAllExamOnly0() {
		return examDao.getAllExamOnly0();
	}

	@Override
	@Transactional
	public List<ExamBean> getAllExamOnly1() {
		return examDao.getAllExamOnly1();
	}

	
	
}

