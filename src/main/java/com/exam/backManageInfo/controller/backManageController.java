package com.exam.backManageInfo.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.exam.backManageInfo.model.ClassBean;
import com.exam.backManageInfo.service.BackManageEmployeeService;
import com.exam.backManageInfo.service.BackManageStudentService;
import com.exam.backManageInfo.service.ClassService;
import com.exam.loginSystem.model.StudentBean;
import com.exam.mailCalendarChat.model.EmployeeBean;

@Controller
public class backManageController {

	@Autowired
	BackManageEmployeeService backManageEmployeeService;
	@Autowired
	BackManageStudentService backManageStudentService;
	@Autowired
	ClassService classService;

	// 顯示後台首頁
	@RequestMapping("/backManage")
	public String Exam(Model model) {
		model.addAttribute("title", "Welcome");
		model.addAttribute("subtitle", "後台管理系統");
		return "backManage/backManageLogin.jsp";
	}

	// 顯示所有 學生資料
	@RequestMapping("/backManage/ShowBackstudentManage")
	public String getAllStudent(Model model) {
		List<StudentBean> list2 = backManageStudentService.getAllStudents();
		model.addAttribute("student", list2);
		// System.out.println(list2);
		return "backManage/ShowBackstudentManage.jsp";
	}

	// 顯示所有 員工資料
	@RequestMapping("/backManage/ShowBackempManage")
	public String getAllemployee(Model model) {

		List<EmployeeBean> list1 = backManageEmployeeService.getAllEmployees();
		model.addAttribute("employee", list1);
		//System.out.println(list1);

		return "backManage/ShowBackempManage.jsp";
	}

	// 篩選員工資料
//	@ModelAttribute("employeeIdentityList")
//	public Map<Integer, String> getCategoryList() {// ?
//		Map<Integer, String> employeeMap = new HashMap<>();// ?
//		List<EmployeeBean> list = backManageEmployeeService.getEmployeeByIdentity();
//System.out.println(list+"----------單單");
//		for (EmployeeBean cb : list) {
//			if (cb.getWhichIdentity() == 0) {
//				employeeMap.put(cb.getEmployeeId(), "0");
//			}
//			System.out.println(employeeMap+"---------主人--------------");
//			if (cb.getWhichIdentity() == 1) {
//				employeeMap.put(cb.getEmployeeId(), "1");
//				System.out.println(employeeMap+"---------管人--------------");
//			}
//		}
//		return employeeMap;
//	}

	// insert一筆學生資料(方法二)
	// @RequestMapping(value="/backManage/ShowBackManage",
	// method=RequestMethod.POST)
	// public String createStudent(@RequestParam("studentId") int studentId,
	// @RequestParam("thisIsClass") String thisIsClass, @RequestParam("studentName")
	// String studentName
	// , @RequestParam("gender") String gender, @RequestParam("address") String
	// address, @RequestParam("phone") String phone
	// , @RequestParam("content") String content, @RequestParam("content") String
	// content, @RequestParam("content") String content
	// , @RequestParam("content") String content) {
	// StudentBean bean = new StudentBean();
	// bean.setStudentId(studentId);;
	// bean.setThisIsClass(thisIsClass);;
	// bean.setStudentName(studentName);
	// bean.setGender(gender);
	// bean.setAddress(address);
	// bean.setPhone(phone);
	// bean.setContent(content);
	// bean.setStatus(1);
	// backManageStudentService.createStudent(bean);
	// return "redirect:/ShowEmailTemplates";
	// }

	// 由id找到一筆信件，並傳json回去
	// @RequestMapping(value="/getEmailTemplateById")
	// public void getEmailTemplateById(@RequestParam("id") int emailId, Model
	// model, HttpServletRequest request,HttpServletResponse response) {
	// EmailTemplateBean bean =emailTemplateService.getEmailTemplatebean(emailId);
	// model.addAttribute("emailTitle", bean.getTitle());
	// model.addAttribute("emailContent", bean.getContent());

	//
	// response.setHeader("content-type", "charset=UTF-8");
	// response.setCharacterEncoding("UTF-8");
	//
	// List list = new ArrayList();
	// list.add(bean.getTitle());
	// list.add(bean.getContent());
	// list.add(bean.getEmailId());
	// String jsonString =JSONValue.toJSONString(list);
	// try {
	// response.getWriter().print(jsonString);
	// } catch (IOException e) {
	//
	// e.printStackTrace();
	// };
	//
	// System.out.println("-------------測試getEmailTemplate : " + bean.getTitle());
	//
	// }

	// //更新一筆信件
	// @RequestMapping(value="/mailCalendarChat/updateEmailTemplate")
	// public String updateEmailTemplate(@RequestParam("id") int emailId,
	// @RequestParam("title") String title, @RequestParam("content") String content)
	// {
	//
	// emailTemplateService.updateEmailTemplate(emailId, title, content);
	//
	// return "redirect:/ShowEmailTemplates";
	// }

	// 更新學生資料 /ExamManage/getExamById
	@RequestMapping(value = "backManage/getStudentById")
	public void getStudentById(@RequestParam("updatestudentId") String updatestudentId, HttpServletRequest request,
			HttpServletResponse response) {
		int a = (int) Integer.valueOf(updatestudentId);
		StudentBean bean = backManageStudentService.getStudentBean(a);

		List list = new ArrayList();
		// 目前時間
		Date date = new Date();
		// 設定日期格式
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// 進行轉換

		String dateStringA = null;
		String dateStringB = null;
		if (bean.getBirthday() != null) {
			dateStringA = sdf.format(bean.getBirthday());
		}
		if (bean.getStartWorkDate() != null) {
			dateStringB = sdf.format(bean.getStartWorkDate());
		}

		list.add(bean.getStudentName());

		list.add(bean.getGender().toString());

		list.add(bean.getPhone());
		list.add(bean.getAddress());
		list.add(dateStringA);
		list.add(bean.getEducation());
		list.add(bean.getSalary());
		list.add(dateStringB);
		list.add(bean.getStudentId());
		list.add(bean.getScore());
		list.add(bean.getEmail());
		//System.out.println(list);
		response.setHeader("content-type", "charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		//System.out.println("456456456----------------------------");
		String jsonString = JSONValue.toJSONString(list);
		try {
			//System.out.println(jsonString);
			response.getWriter().print(jsonString);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 更改單筆學生資料
	@RequestMapping(value = "backManage/update")
	public String updateStudent(@RequestParam("studentId") String studentId, @RequestParam("name") String name,
			@RequestParam("gender") String gender, @RequestParam("phone") String phone,
			@RequestParam("address") String address, @RequestParam("birthday") String birthday,
			@RequestParam("level") String level, @RequestParam("money") String money,
			@RequestParam("workday") String workday, @RequestParam("score") String score,
			@RequestParam("email") String email) {
		// System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
		int a = (int) Integer.valueOf(studentId);
		StudentBean studentBean = backManageStudentService.getStudentBean(a);
		// System.out.println(studentBean);

		studentBean.setStudentName(name);
		studentBean.setGender(gender);
		studentBean.setPhone(phone);
		studentBean.setAddress(address);

		// 設定日期格式
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// 進行轉換
		Date date;
		try {
			date = sdf.parse(birthday);
			java.sql.Date date2 = new java.sql.Date(date.getTime());
			studentBean.setBirthday(date2);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		studentBean.setEducation(level);

		int b = (int) Integer.valueOf(money);
		studentBean.setSalary(b);

		// 進行轉換
		if (workday != "") {
			Date wdate;
			try {
				wdate = sdf.parse(workday);
				java.sql.Date wdate2 = new java.sql.Date(wdate.getTime());
				studentBean.setStartWorkDate(wdate2);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}

		int c = (int) Integer.valueOf(score);
		studentBean.setScore(c);
		
		studentBean.setEmail(email);

		backManageStudentService.updateStudent(studentBean);
		// backManageStudentService.updateStudent(studentBean);
		return "backManage/ShowBackstudentManage.jsp";
	}

	// 員工相關修訂
	// 更新員工資料
	@RequestMapping(value = "backManage/updateEmp")
	public void updateEmp(@RequestParam("updateEmp") String updateEmp, HttpServletRequest request,
			HttpServletResponse response) {
		int a = (int) Integer.valueOf(updateEmp);
		EmployeeBean bean = backManageEmployeeService.getEmployeeById(a);

		List list = new ArrayList();

		list.add(bean.getEmployeeId());
		list.add(bean.getEmployeeName());
		list.add(bean.getPosition());
		list.add(bean.getEmail());
		list.add(bean.getAddress());
		list.add(bean.getPhone());
		list.add(bean.getWhichIdentity());
		// list.add(bean.getEmployeeId());

		// System.out.println(list);
		response.setHeader("content-type", "charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		// System.out.println("456456456----------------------------");
		String jsonString = JSONValue.toJSONString(list);
		try {
			System.out.println(jsonString);
			response.getWriter().print(jsonString);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 更改單筆員工資料
	@RequestMapping(value = "backManage/updateEmpbyId")
	public String updateEmpbyId(@RequestParam("empname") String empname, @RequestParam("position") String position,
			@RequestParam("email") String email, @RequestParam("address") String address,
			@RequestParam("phone") String phone, @RequestParam("whichIdentity") String whichIdentity,
			@RequestParam("showEmpId") String showEmpId) throws ParseException {
		// System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
		int a = (int) Integer.valueOf(showEmpId);
		EmployeeBean employeeBean = backManageEmployeeService.getEmployeeById(a);
		int b = (int) Integer.valueOf(whichIdentity);
		// System.out.println(studentBean);

		employeeBean.setEmployeeName(empname);
		employeeBean.setPosition(position);
		employeeBean.setEmail(email);
		employeeBean.setAddress(address);
		employeeBean.setPhone(phone);
		employeeBean.setPhone(whichIdentity);
		employeeBean.setEmployeeId(a);
		backManageEmployeeService.updateEmployee(a, empname, position, email, address, phone, b,
				employeeBean.getPhoto(), employeeBean.getPhotoName());

		return "backManage/ShowBackempManage.jsp";

	}

	// Delete 刪除學生資料
	@RequestMapping(value = "backManage/deleteStudent")
	public String delete(@RequestParam("studentId") String studentId) {
		// System.out.println(examId);
		int c = (int) Integer.valueOf(studentId);
		backManageStudentService.deleteStudent(c);
		// examService.deleteExam(examId);
		return "backManage/ShowBackstudentManage.jsp";
	}

	// InsertExam1-1 新增學生資料拿出表格
	@RequestMapping(value = "backManage/addStudent", method = RequestMethod.GET)
	public String getAddNewStudentForm(Model model) {
		StudentBean eb = new StudentBean();
		//System.out.println("Get:" + eb);
		model.addAttribute("StudentBean", eb);
		return "backManage/ShowBackstudentManage.jsp";
	}

	// //InsertExam1-2新增學生資料傳入表格
	// @RequestMapping(value="backManage/addStudent",method=RequestMethod.POST)
	// public String
	// processAddNewStudentForm(@ModelAttribute("StudentBean")StudentBean eb) {
	// System.out.println("Post:"+eb);
	// backManageStudentService.createStudent(eb);
	// return "redirect:/backManage/ShowBackstudentManage.jsp";
	// }
	// InsertExam2-1 新增學生資料傳入表格
	@RequestMapping(value = "backManage/addStudent", method = RequestMethod.POST)
	public String insertStudent(@RequestParam("name") String name, @RequestParam("gender") String gender,
			@RequestParam("phone") String phone, @RequestParam("address") String address,
			@RequestParam("birthday") String birthday, @RequestParam("level") String level,
			@RequestParam("money") String money, @RequestParam("workday") String workday,
			@RequestParam("thisisclass") String thisisclass, @RequestParam("email") String email) throws ParseException {
		System.out.println("AAAAAAAAAAAAAA");
		StudentBean studentBean = new StudentBean();

		studentBean.setStudentName(name);

		studentBean.setGender(gender);

		studentBean.setPhone(phone);

		studentBean.setAddress(address);

		// 設定日期格式
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// 進行轉換
		if (birthday != "") {
			Date date = sdf.parse(birthday);
			java.sql.Date date2 = new java.sql.Date(date.getTime());
			studentBean.setBirthday(date2);
		} else {
			birthday = null;
		}

		studentBean.setEducation(level);

		int b = (int) Integer.valueOf(money);
		studentBean.setSalary(b);
		// 進行轉換
		if (workday != "") {
			Date wdate = sdf.parse(workday);
			java.sql.Date wdate2 = new java.sql.Date(wdate.getTime());
			studentBean.setStartWorkDate(wdate2);
		} else {
			workday = null;
		}

		// PK鍵不能NULL
		studentBean.setThisIsClass(thisisclass);
		// 預設未考過
		studentBean.setWhichIdentity(0);
		
		studentBean.setEmail(email);

		backManageStudentService.createStudent(studentBean);

		return "backManage/ShowBackstudentManage.jsp";
	}

	//增加班級拿到資料
			@RequestMapping(value="/backManage/InsertClass", method=RequestMethod.GET)
			public String addClass(Model model) {
				ClassBean cb = new ClassBean();
				System.out.println("Get:" + cb);
				model.addAttribute("ClassBean", cb);
				return "backManage/ShowBackstudentManage.jsp";
			}
			//增加班級將資料放入
			@RequestMapping(value = "backManage/InsertClass", method = RequestMethod.POST)
			public String insertStudent(@RequestParam("classid") String classid, @RequestParam("classname") String classname,
					@RequestParam("classaddress") String classaddress) throws ParseException {
//				@RequestParam("examstart") String examstart, @RequestParam("examend") String examend,
				System.out.println("新增班級--------------------------------------------------------");
				ClassBean classBean = new ClassBean();
				
				classBean.setClassId(classid);

				classBean.setClassName(classname);

				classBean.setAddress(classaddress);

//				// 設定日期格式
//				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//				// 進行轉換
//				if (examstart != "") {
//					Date esdate = sdf.parse(examstart);
//					java.sql.Date date2 = new java.sql.Date(esdate.getTime());
//					classBean.setExamStart(date2);
//				} else {
//					examstart = null;
//				}


//				// 進行轉換
//				if (examend != "") {
//					Date eedate = sdf.parse(examend);
//					java.sql.Date edate2 = new java.sql.Date(eedate.getTime());
//					classBean.setExamEnd(edate2);
//				} else {
//					examend = null;
//				}
				System.out.println("新增班級222--------------------------------------------------------");
				// 預設未考過
				classBean.setstate(0);
		        
				classService.createClass(classBean);
				System.out.println("新增班級333--------------------------------------------------------");
				System.out.println("新增班級--------------------------------------------------------"+classBean);
				return "backManage/ShowBackstudentManage.jsp";
			}
	
	// 上傳 Excel
	// @RequestMapping(value="/addNewStudentgroup",method = RequestMethod.GET)
	// public String getNewStudentgroup(@RequestParam("studentId") Integer
	// studentId,Model model) {
	// StudentBean sb=new StudentBean();
	// //sb.getStudentId();
	// model.addAttribute("SBean",sb);
	// return "backManage/ShowBackstudentManage.jsp";
	// }
	// 讀到 Excel 做處理
	@RequestMapping("/backManage/fileUpload")
	public String NewStudentgroup(@RequestParam("file") MultipartFile Mfile, Model model) {
		Blob exBlob = null;

		FileOutputStream fos = null;

		MultipartFile studentExcel = Mfile;

		System.out.println(studentExcel);
		String originalFilename = studentExcel.getOriginalFilename();
		System.out.println(originalFilename);

		File file = new File("C:\\test\\" + originalFilename);
		System.out.println(file);
		// 上傳 後 下載
		if (studentExcel != null && !studentExcel.isEmpty()) {
			try {
				byte[] b = studentExcel.getBytes();
				exBlob = new SerialBlob(b);
				System.out.println(exBlob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		// 下載
		Blob blob = exBlob;
		int len = 0;
		byte[] media = null;
		if (blob != null) {
			try {
				fos = new FileOutputStream(file);
				len = (int) blob.length();
				media = blob.getBytes(1, len);
				fos.write(media);
				System.out.println(fos);
				fos.close();
			} catch (SQLException e) {
				throw new RuntimeException("ProductController的getPicture()發生SQLException: " + e.getMessage());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		System.out.println(file);

		// TeamStatisticsController.resolveExcel(file);

		try {
			// File fi = new File(fos);
			System.out.println(file);
			InputStream is = new FileInputStream(file);
			System.out.println(is);
			// Workbook
			HSSFWorkbook workbook = new HSSFWorkbook(is);
			// XSSFWorkbook workbook1;
			System.out.println(workbook);
			HSSFSheet sheet = workbook.getSheetAt(0);
			System.out.println(sheet);
			int firstRowNum = sheet.getFirstRowNum() + 1;
			int lastRowNum = sheet.getLastRowNum();
			System.out.println(firstRowNum);
			System.out.println(lastRowNum);
			// List<StudentBean> sList = backManageStudentService.getAllStudents();//???
			for (int x = firstRowNum; x <= lastRowNum; x++) {
				HSSFRow eachRow = sheet.getRow(x);
				// Cell cx0 = sheet.getCell(x,0);

				HSSFCell cx0 = eachRow.getCell(0);
				String strcx0 = cx0.getStringCellValue();
				System.out.println(strcx0);

				// System.out.println(thisisclass);

				System.out.println("1-------------------------------1");
				int y = 0;
				StudentBean stbsave = new StudentBean();
				System.out.println(eachRow.getCell(y));
				HSSFCell cellxy = eachRow.getCell(y);
				System.out.println("1213564=" + cellxy);

				System.out.println(eachRow.getCell(y).getStringCellValue());
				//System.out.println(eachRow.getCell(y).getStringCellValue());

				stbsave.setClassId(eachRow.getCell(y).getStringCellValue());
				stbsave.setThisIsClass(eachRow.getCell(y++).getStringCellValue());
				System.out.println("1" + eachRow.getCell(y).getStringCellValue());

				stbsave.setStudentName(eachRow.getCell(y++).getStringCellValue());

				System.out.println("1" + eachRow.getCell(y).getStringCellValue());
				stbsave.setGender(eachRow.getCell(y++).getStringCellValue());//

				System.out.println(eachRow.getCell(y).getStringCellValue());
				stbsave.setPhone(eachRow.getCell(y++).getStringCellValue());

				System.out.println(eachRow.getCell(y).getStringCellValue());
				stbsave.setAddress(eachRow.getCell(y++).getStringCellValue());

				System.out.println(eachRow.getCell(y).getStringCellValue());
				stbsave.setEmail(eachRow.getCell(y++).getStringCellValue());

				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

				// 由字串格式轉日期格式
				System.out.println(eachRow.getCell(y).getDateCellValue());
				stbsave.setBirthday(new java.sql.Date(eachRow.getCell(y++).getDateCellValue().getTime()));

				System.out.println(eachRow.getCell(y).getStringCellValue());
				stbsave.setEducation(eachRow.getCell(y++).getStringCellValue());

				System.out.println(eachRow.getCell(y).getNumericCellValue());
				stbsave.setSalary(new Integer((int) eachRow.getCell(y++).getNumericCellValue()));
				// 由字串格式轉日期格式
				System.out.println(eachRow.getCell(y).getDateCellValue());
				stbsave.setStartWorkDate(new java.sql.Date(eachRow.getCell(y++).getDateCellValue().getTime()));

				System.out.println(eachRow.getCell(y).getNumericCellValue());
				//stbsave.setScore(new Integer((int) eachRow.getCell(y++).getNumericCellValue()));
				stbsave.setScore(null);
				stbsave.setWhichIdentity(0);

				backManageStudentService.createStudent(stbsave);
				// psService.insertPlayerStatistics(psb);
			}
			workbook.close();
			is.close();
		} catch (Exception e) {
			e.getMessage();
		}
		return "redirect:/backManage/ShowBackstudentManage";
	}
}
// insert一筆學生資料(方法一)
// @RequestMapping(value="/mailCalendarChat/createEmailTemplate",
// method=RequestMethod.POST)
// public String createEmailTemplate(@ModelAttribute("EmailTemplateBean")
// EmailTemplateBean bean
// ,Model model,HttpServletRequest request) {
//
// emailTemplateService.createEmailTemplate(bean);
// return "redirect:/ShowEmailTemplates";
// }

//// 將一筆信件的status變成0，當成是DELETE
// @RequestMapping(value="/mailCalendarChat/deleteEmailTemplate")
// public String deleteEmailTemplate(@RequestParam("id") int emailId,Model
//// model) {
// emailTemplateService.deleteEmailTemplate(emailId);
// System.out.println("==========測試DELETE EMAIL");
//
// return "redirect:/ShowEmailTemplates";
// }
