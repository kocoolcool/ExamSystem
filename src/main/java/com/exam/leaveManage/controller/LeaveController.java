package com.exam.leaveManage.controller;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.exam.ExamManage.model.ExamBean;
import com.exam.ExamManage.service.ExamService;
import com.exam.leaveManage.model.LeaveBean;
import com.exam.leaveManage.service.LeaveService;
import com.exam.mailCalendarChat.model.EmployeeBean;
import com.exam.mailCalendarChat.service.EmployeeService;

@Controller
public class LeaveController {
	
	@Autowired
	LeaveService leaveService;
	
	@Autowired
	EmployeeService employeeService;
	
	@Autowired
	ExamService examService;
	
	@RequestMapping(value="/FullCalendar")
	public String FullCalendar(Model model,HttpServletRequest req) {
		
		getAllLeave(model,req);
		
//		EmployeeBean user = employeeService.getEmployeeById(1);
		HttpSession s=req.getSession(false);
		EmployeeBean user=(EmployeeBean) s.getAttribute("LoginOK"); 
			
		model.addAttribute("User",user);
			
		if(user.getWhichIdentity()==1) {
			System.out.println("這是考官介面------------------------------------------------------------------");
			return "leaveManage/FullCalendar.jsp";			
		}else {
			System.out.println("這是管理員介面----------------------------------------------------------------");
			return "leaveManage/FullCalendar2.jsp";					
		}		
		
	}
	//寫在@RequestMapping(value="/FullCalendar")裡面
	public void getAllLeave(Model model,HttpServletRequest req) {
		
		//確認身分
//		EmployeeBean user=employeeService.getEmployeeById(1);
		HttpSession s=req.getSession(false);
		EmployeeBean user=(EmployeeBean) s.getAttribute("LoginOK"); 		
		
		//考官看到的月曆
		if(user.getWhichIdentity()==1) {
		
			int number = (int)user.getEmployeeId();
			//安排考試---------------------------------------------------------------------------------------------
			List<ExamBean> exlist = examService.getExamByEmpId(number);
			List<Object> allExamDataList = new ArrayList<Object>();
			
			for(ExamBean bean :exlist) {
				
				if( bean.getStatus()==0) {  
					
					Map<String,Object> listTemp = new HashMap<String,Object>();
					
					EmployeeBean tempEmp=employeeService.getEmployeeById(bean.getEmployeeId());
					listTemp.put("title",bean.getExamSubject()+":"+tempEmp.getEmployeeName()+"--"+bean.getCurrentAppointment()+"/"+bean.getMaxAppointment());
					String startTime = bean.getExamTime().toString();
					String[] startTimeSplit = startTime.split(" ");
					
					listTemp.put("start", startTimeSplit[0]+"T"+startTimeSplit[1].substring(0,8));
					//將enventId也當參數傳過去
					listTemp.put("employee",bean.getEmployeeId());
					
					listTemp.put("ExamId", bean.getExamId());
					
					listTemp.put("color", "#FFAA33");
					
					listTemp.put("textColor", "white");
					
					allExamDataList.add(listTemp);
				}
				String ExamjsonString =JSONValue.toJSONString(allExamDataList);
				model.addAttribute("ExamDataByEmpId",ExamjsonString);
			}
			
		//先得到所有的LeaveBean---------------------------------------------------------------------------------
		List<LeaveBean> list = leaveService.getUnApprovedLeave();
		//用來篩選要保留的欄位，並傳送
		List<Object> allLeaveDataList = new ArrayList<Object>();
		
		
		for(LeaveBean bean :list) {
			int id = 1000;//<----越大越好
			if (bean.getEmployeeId()!=null) {
				 id=bean.getEmployeeId();
			}
			//&& bean.getEmployeeId()==1
			if( bean.getState()==0 && (id == user.getEmployeeId())) {  //有登入資訊後把1改成登入人id

				//當作FullCalendar的作為["title" : '', "start":'', "end":""]的map
				Map<String,Object> listTemp = new HashMap<String,Object>();
//				List<Object> listTemp = new ArrayList<Object>();
				//當作FullCalendar的title
				listTemp.put("title", bean.getEmployeebean().getEmployeeName() + " : " + bean.getReason());
				
				//當作FullCalendar的start
				String startTime = bean.getStartDate().toString();
				String[] startTimeSplit = startTime.split(" ");
				
				listTemp.put("start", startTimeSplit[0]+"T"+startTimeSplit[1].substring(0,8));
				
				//當作FullCalendar的end
				String endtTime = bean.getEndDate().toString();
				String[] endTimeSplit = endtTime.split(" ");
				
				listTemp.put("end", endTimeSplit[0]+"T"+endTimeSplit[1].substring(0,8));
				
				//將enventId也當參數傳過去
				listTemp.put("eventId", bean.getEventId());
				
				//將reason也當參數傳過去
				listTemp.put("employeeId", bean.getEmployeeId());
								
				listTemp.put("reason", bean.getReason());
				
				listTemp.put("color", "#FF0000");
				
				listTemp.put("textColor", "white");
				
				allLeaveDataList.add(listTemp);
			}
			String jsonString =JSONValue.toJSONString(allLeaveDataList);
			model.addAttribute("allLeaveData",jsonString);
		}
		System.out.println(allLeaveDataList+"1111111111111111111111111111111");
//以上為為核可的--以下為核可的--------------------------------------------------------------------------------------
		        //先得到所有的LeaveBean
				List<LeaveBean> list2 = leaveService.getApprovalLeave();
				//用來篩選要保留的欄位，並傳送
				List<Object> allLeaveDataList2 = new ArrayList<Object>();
		for(LeaveBean bean :list2) {
					int id=1000;
//					System.out.println(bean);
					if (bean.getEmployeeId()!=null) {
						 id=bean.getEmployeeId();
//					System.out.println(id+"------------------------------------");

					}
//					System.out.println(id);
					//&& bean.getEmployeeId()==1
					if( bean.getState()==0 && (id==user.getEmployeeId())) {

						//當作FullCalendar的作為["title" : '', "start":'', "end":""]的map
						Map<String,Object> listTemp = new HashMap<String,Object>();
//						List<Object> listTemp = new ArrayList<Object>();
						//當作FullCalendar的title
						listTemp.put("title", bean.getEmployeebean().getEmployeeName() + " : " + bean.getReason());
						
						//當作FullCalendar的start
						String startTime = bean.getStartDate().toString();
						String[] startTimeSplit = startTime.split(" ");
						
						listTemp.put("start", startTimeSplit[0]+"T"+startTimeSplit[1].substring(0,8));
						
						//當作FullCalendar的end
						String endtTime = bean.getEndDate().toString();
						String[] endTimeSplit = endtTime.split(" ");
						
						listTemp.put("end", endTimeSplit[0]+"T"+endTimeSplit[1].substring(0,8));
						
						//將enventId也當參數傳過去
						listTemp.put("eventId", bean.getEventId());
						
						//將reason也當參數傳過去
						listTemp.put("employeeId", bean.getEmployeeId());
						
						listTemp.put("reason", bean.getReason());
						
						listTemp.put("color", "#378006");
						
						listTemp.put("textColor", "white");
						
						allLeaveDataList2.add(listTemp);
					}
					String jsonString2 =JSONValue.toJSONString(allLeaveDataList2);
					model.addAttribute("allLeaveData2",jsonString2);

				}    
				System.out.println(allLeaveDataList2+"22222222222222222222222222222222");
		}
		
		//管理員視角-------------------------------------------------------------------------------------------
		if(user.getWhichIdentity()==0) {
			
			//安排考試---------------------------------------------------------------------------------------------
			List<ExamBean> exlist2 = examService.getAllExam();
			List<Object> allExamDataList2 = new ArrayList<Object>();
			
			for(ExamBean bean :exlist2) {
				
				if( bean.getStatus()==0) {  
					
					Map<String,Object> listTemp = new HashMap<String,Object>();
					
					EmployeeBean tempEmp=employeeService.getEmployeeById(bean.getEmployeeId());
					listTemp.put("title",bean.getExamSubject()+":"+tempEmp.getEmployeeName()+"--"+bean.getCurrentAppointment()+"/"+bean.getMaxAppointment());
					String startTime = bean.getExamTime().toString();
					String[] startTimeSplit = startTime.split(" ");
					
					listTemp.put("start", startTimeSplit[0]+"T"+startTimeSplit[1].substring(0,8));
					//將enventId也當參數傳過去
					listTemp.put("employee",bean.getEmployeeId());
					
					listTemp.put("ExamId", bean.getExamId());
					
					listTemp.put("color", "#FFAA33");
					
					listTemp.put("textColor", "white");
					
					allExamDataList2.add(listTemp);
				}
				String ExamjsonString2 =JSONValue.toJSONString(allExamDataList2);
				model.addAttribute("allExamData",ExamjsonString2);
			}
			/////////////////////////////////////////////////////////////////////////////////////////////////////
			
			//先得到所有的LeaveBean
			List<LeaveBean> list = leaveService.getUnApprovedLeave();
			//用來篩選要保留的欄位，並傳送
			List<Object> allLeaveDataList = new ArrayList<Object>();
			
			
			for(LeaveBean bean :list) {

				//&& bean.getEmployeeId()==1
				if( bean.getState()==0) {  //有登入資訊後把1改成登入人id

					//當作FullCalendar的作為["title" : '', "start":'', "end":""]的map
					Map<String,Object> listTemp = new HashMap<String,Object>();
//					List<Object> listTemp = new ArrayList<Object>();
					//當作FullCalendar的title
					listTemp.put("title", bean.getEmployeebean().getEmployeeName() + " : " + bean.getReason());
					
					//當作FullCalendar的start
					String startTime = bean.getStartDate().toString();
					String[] startTimeSplit = startTime.split(" ");
					
					listTemp.put("start", startTimeSplit[0]+"T"+startTimeSplit[1].substring(0,8));
					
					//當作FullCalendar的end
					String endtTime = bean.getEndDate().toString();
					String[] endTimeSplit = endtTime.split(" ");
					
					listTemp.put("end", endTimeSplit[0]+"T"+endTimeSplit[1].substring(0,8));
					
					//將enventId也當參數傳過去
					listTemp.put("eventId", bean.getEventId());
					
					//將reason也當參數傳過去
					listTemp.put("employeeId", bean.getEmployeeId());
					
					listTemp.put("reason", bean.getReason());
					
					listTemp.put("color", "#FF0000");
					
					listTemp.put("textColor", "white");
					
					allLeaveDataList.add(listTemp);
				}
				String jsonString =JSONValue.toJSONString(allLeaveDataList);
				model.addAttribute("allLeaveData",jsonString);
			}
			System.out.println(allLeaveDataList+"1111111111111111111111111111111");
//以上為為核可的--以下為核可的--------------------------------------------------------------------------------------
			        //先得到所有的LeaveBean
					List<LeaveBean> list2 = leaveService.getApprovalLeave();
					//用來篩選要保留的欄位，並傳送
					List<Object> allLeaveDataList2 = new ArrayList<Object>();
			for(LeaveBean bean :list2) {

//						System.out.println(id);
						//&& bean.getEmployeeId()==1
						if( bean.getState()==0) {

							//當作FullCalendar的作為["title" : '', "start":'', "end":""]的map
							Map<String,Object> listTemp = new HashMap<String,Object>();
//							List<Object> listTemp = new ArrayList<Object>();
							//當作FullCalendar的title
							listTemp.put("title", bean.getEmployeebean().getEmployeeName() + " : " + bean.getReason());
							
							//當作FullCalendar的start
							String startTime = bean.getStartDate().toString();
							String[] startTimeSplit = startTime.split(" ");
							
							listTemp.put("start", startTimeSplit[0]+"T"+startTimeSplit[1].substring(0,8));
							
							//當作FullCalendar的end
							String endtTime = bean.getEndDate().toString();
							String[] endTimeSplit = endtTime.split(" ");
							
							listTemp.put("end", endTimeSplit[0]+"T"+endTimeSplit[1].substring(0,8));
							
							//將enventId也當參數傳過去
							listTemp.put("eventId", bean.getEventId());
							
							//將reason也當參數傳過去
							listTemp.put("employeeId", bean.getEmployeeId());

							listTemp.put("reason", bean.getReason());
							
							listTemp.put("color", "#378006");
							
							listTemp.put("textColor", "white");
							
							allLeaveDataList2.add(listTemp);
						}
						String jsonString2 =JSONValue.toJSONString(allLeaveDataList2);
						model.addAttribute("allLeaveData2",jsonString2);

					}    
					System.out.println(allLeaveDataList2+"22222222222222222222222222222222");
			}
		
	}
	
	//顯示主管關切換到所有exam
		@RequestMapping(value="/onlyExam")
		public String onlyExam(Model model) {
			
			List<ExamBean> exlist03 = examService.getAllExam();
			List<Object> allExamDataList2 = new ArrayList<Object>();
			
			for(ExamBean bean :exlist03) {
				
				if( bean.getStatus()==0) {  
					
					Map<String,Object> listTemp = new HashMap<String,Object>();
					
					EmployeeBean tempEmp=employeeService.getEmployeeById(bean.getEmployeeId());
					listTemp.put("title",bean.getExamSubject()+":"+tempEmp.getEmployeeName()+"--"+bean.getCurrentAppointment()+"/"+bean.getMaxAppointment());
					String startTime = bean.getExamTime().toString();
					String[] startTimeSplit = startTime.split(" ");
					
					listTemp.put("start", startTimeSplit[0]+"T"+startTimeSplit[1].substring(0,8));
					//將enventId也當參數傳過去
					listTemp.put("employee",bean.getEmployeeId());
					
					listTemp.put("ExamId", bean.getExamId());
					
					listTemp.put("color", "#FFAA33");
					
					listTemp.put("textColor", "white");
					
					allExamDataList2.add(listTemp);
				}
				String ExamjsonString2 =JSONValue.toJSONString(allExamDataList2);
				model.addAttribute("allExamDataBysa",ExamjsonString2);
				
			}
//			System.out.println(model);
			return "leaveManage/FullCalendar2.jsp";
		}
		
		@RequestMapping(value="/onlyLeave")
		public String onlyLeave(Model model,HttpServletRequest req) {

			HttpSession s = req.getSession(false);
			EmployeeBean user=(EmployeeBean) s.getAttribute("LoginOK");
//			EmployeeBean user = employeeService.getEmployeeById(1);
			model.addAttribute("User",user);
			
			//先得到所有的LeaveBean
			List<LeaveBean> list = leaveService.getUnApprovedLeave();
			//用來篩選要保留的欄位，並傳送
			List<Object> allLeaveDataList = new ArrayList<Object>();
			
			
			for(LeaveBean bean :list) {

				//&& bean.getEmployeeId()==1
				if( bean.getState()==0) {  //有登入資訊後把1改成登入人id

					//當作FullCalendar的作為["title" : '', "start":'', "end":""]的map
					Map<String,Object> listTemp = new HashMap<String,Object>();
//					List<Object> listTemp = new ArrayList<Object>();
					//當作FullCalendar的title
					listTemp.put("title", bean.getEmployeebean().getEmployeeName() + " : " + bean.getReason());
					
					//當作FullCalendar的start
					String startTime = bean.getStartDate().toString();
					String[] startTimeSplit = startTime.split(" ");
					
					listTemp.put("start", startTimeSplit[0]+"T"+startTimeSplit[1].substring(0,8));
					
					//當作FullCalendar的end
					String endtTime = bean.getEndDate().toString();
					String[] endTimeSplit = endtTime.split(" ");
					
					listTemp.put("end", endTimeSplit[0]+"T"+endTimeSplit[1].substring(0,8));
					
					//將enventId也當參數傳過去
					listTemp.put("eventId", bean.getEventId());
					
					//將reason也當參數傳過去
					listTemp.put("employeeId", bean.getEmployeeId());
					
					listTemp.put("reason", bean.getReason());
					
					listTemp.put("color", "#FF0000");
					
					listTemp.put("textColor", "white");
					
					allLeaveDataList.add(listTemp);
				}
				String jsonString =JSONValue.toJSONString(allLeaveDataList);
				model.addAttribute("allLeaveData",jsonString);
			}
			System.out.println(allLeaveDataList+"1111111111111111111111111111111");
	//以上為為核可的--以下為核可的--------------------------------------------------------------------------------------
			        //先得到所有的LeaveBean
					List<LeaveBean> list2 = leaveService.getApprovalLeave();
					//用來篩選要保留的欄位，並傳送
					List<Object> allLeaveDataList2 = new ArrayList<Object>();
			for(LeaveBean bean :list2) {

//						System.out.println(id);
						//&& bean.getEmployeeId()==1
						if( bean.getState()==0) {

							//當作FullCalendar的作為["title" : '', "start":'', "end":""]的map
							Map<String,Object> listTemp = new HashMap<String,Object>();
//							List<Object> listTemp = new ArrayList<Object>();
							//當作FullCalendar的title
							listTemp.put("title", bean.getEmployeebean().getEmployeeName() + " : " + bean.getReason());
							
							//當作FullCalendar的start
							String startTime = bean.getStartDate().toString();
							String[] startTimeSplit = startTime.split(" ");
							
							listTemp.put("start", startTimeSplit[0]+"T"+startTimeSplit[1].substring(0,8));
							
							//當作FullCalendar的end
							String endtTime = bean.getEndDate().toString();
							String[] endTimeSplit = endtTime.split(" ");
							
							listTemp.put("end", endTimeSplit[0]+"T"+endTimeSplit[1].substring(0,8));
							
							//將enventId也當參數傳過去
							listTemp.put("eventId", bean.getEventId());
							
							//將reason也當參數傳過去
							listTemp.put("employeeId", bean.getEmployeeId());

							listTemp.put("reason", bean.getReason());
							
							listTemp.put("color", "#378006");
							
							listTemp.put("textColor", "white");
							
							allLeaveDataList2.add(listTemp);
						}
						String jsonString2 =JSONValue.toJSONString(allLeaveDataList2);
						model.addAttribute("allLeaveData2",jsonString2);

					}
			return "leaveManage/FullCalendar2.jsp";
		}
		
		@RequestMapping(value="/personal")
		public String personal(Model model,HttpServletRequest req) {
			
			HttpSession s = req.getSession(false);
			EmployeeBean user=(EmployeeBean) s.getAttribute("LoginOK");
//			EmployeeBean user = employeeService.getEmployeeById(1);
			int number = (int)user.getEmployeeId();
			//安排考試---------------------------------------------------------------------------------------------
			List<ExamBean> exlist = examService.getExamByEmpId(number);
			List<Object> allExamDataList = new ArrayList<Object>();
			
			for(ExamBean bean :exlist) {
				
				if( bean.getStatus()==0) {  
					
					Map<String,Object> listTemp = new HashMap<String,Object>();
					
					EmployeeBean tempEmp=employeeService.getEmployeeById(bean.getEmployeeId());
					listTemp.put("title",bean.getExamSubject()+":"+tempEmp.getEmployeeName()+"--"+bean.getCurrentAppointment()+"/"+bean.getMaxAppointment());
					String startTime = bean.getExamTime().toString();
					String[] startTimeSplit = startTime.split(" ");
					
					listTemp.put("start", startTimeSplit[0]+"T"+startTimeSplit[1].substring(0,8));
					//將enventId也當參數傳過去
					listTemp.put("employee",bean.getEmployeeId());
					
					listTemp.put("ExamId", bean.getExamId());
					
					listTemp.put("color", "#FFAA33");
					
					listTemp.put("textColor", "white");
					
					allExamDataList.add(listTemp);
				}
				String ExamjsonString =JSONValue.toJSONString(allExamDataList);
				model.addAttribute("ExamDataByEmpId",ExamjsonString);
			}
			
			//先得到所有的LeaveBean---------------------------------------------------------------------------------
					List<LeaveBean> list = leaveService.getUnApprovedLeave();
					//用來篩選要保留的欄位，並傳送
					List<Object> allLeaveDataList = new ArrayList<Object>();
					
					for(LeaveBean bean :list) {
						int id = 1000;//<----越大越好
						if (bean.getEmployeeId()!=null) {
							 id=bean.getEmployeeId();
						}
						
						if( bean.getState()==0 && (id == user.getEmployeeId())) {

							//當作FullCalendar的作為["title" : '', "start":'', "end":""]的map
							Map<String,Object> listTemp = new HashMap<String,Object>();
//							List<Object> listTemp = new ArrayList<Object>();
							//當作FullCalendar的title
							listTemp.put("title", bean.getEmployeebean().getEmployeeName() + " : " + bean.getReason());
							
							//當作FullCalendar的start
							String startTime = bean.getStartDate().toString();
							String[] startTimeSplit = startTime.split(" ");
							
							listTemp.put("start", startTimeSplit[0]+"T"+startTimeSplit[1].substring(0,8));
							
							//當作FullCalendar的end
							String endtTime = bean.getEndDate().toString();
							String[] endTimeSplit = endtTime.split(" ");
							
							listTemp.put("end", endTimeSplit[0]+"T"+endTimeSplit[1].substring(0,8));
							
							//將enventId也當參數傳過去
							listTemp.put("eventId", bean.getEventId());
							
							//將reason也當參數傳過去
							listTemp.put("employeeId", bean.getEmployeeId());
											
							listTemp.put("reason", bean.getReason());
							
							listTemp.put("color", "#FF0000");
							
							listTemp.put("textColor", "white");
							
							allLeaveDataList.add(listTemp);
						}
						String jsonString =JSONValue.toJSONString(allLeaveDataList);
						model.addAttribute("allLeaveData",jsonString);
					}
					System.out.println(allLeaveDataList+"1111111111111111111111111111111");
	//以上為為核可的--以下為核可的--------------------------------------------------------------------------------------
					        //先得到所有的LeaveBean
							List<LeaveBean> list2 = leaveService.getApprovalLeave();
							//用來篩選要保留的欄位，並傳送
							List<Object> allLeaveDataList2 = new ArrayList<Object>();
					for(LeaveBean bean :list2) {
								int id=1000;
//								System.out.println(bean);
								if (bean.getEmployeeId()!=null) {
									 id=bean.getEmployeeId();
//								System.out.println(id+"------------------------------------");

								}
//								System.out.println(id);
								//&& bean.getEmployeeId()==1
								if( bean.getState()==0 && (id==user.getEmployeeId())) {

									//當作FullCalendar的作為["title" : '', "start":'', "end":""]的map
									Map<String,Object> listTemp = new HashMap<String,Object>();
//									List<Object> listTemp = new ArrayList<Object>();
									//當作FullCalendar的title
									listTemp.put("title", bean.getEmployeebean().getEmployeeName() + " : " + bean.getReason());
									
									//當作FullCalendar的start
									String startTime = bean.getStartDate().toString();
									String[] startTimeSplit = startTime.split(" ");
									
									listTemp.put("start", startTimeSplit[0]+"T"+startTimeSplit[1].substring(0,8));
									
									//當作FullCalendar的end
									String endtTime = bean.getEndDate().toString();
									String[] endTimeSplit = endtTime.split(" ");
									
									listTemp.put("end", endTimeSplit[0]+"T"+endTimeSplit[1].substring(0,8));
									
									//將enventId也當參數傳過去
									listTemp.put("eventId", bean.getEventId());
									
									//將reason也當參數傳過去
									listTemp.put("employeeId", bean.getEmployeeId());
									
									listTemp.put("reason", bean.getReason());
									
									listTemp.put("color", "#378006");
									
									listTemp.put("textColor", "white");
									
									allLeaveDataList2.add(listTemp);
								}
								String jsonString2 =JSONValue.toJSONString(allLeaveDataList2);
								model.addAttribute("allLeaveData2",jsonString2);

							}    
							System.out.println(allLeaveDataList2+"22222222222222222222222222222222");
							model.addAttribute("User",user);
			
			return "leaveManage/FullCalendar2.jsp";
		}
	
	@RequestMapping(value="/deleteLeaveBean")
	public String deleteLeaveBean(@RequestParam int eventId) {
		
		leaveService.deleteLeaveBean(eventId);
		return "redirect:FullCalendar";
	}
	
	@RequestMapping(value="/approvalLeaveBean")
	public String approvalLeaveBean(@RequestParam int eventId) {
		
		leaveService.approvalLeave(eventId);
		return "redirect:FullCalendar";
	}
//	@RequestMapping(value="/updateLeaveBean")
//	public String updateLeaveBean(@RequestParam int eventId, 
//				@RequestParam String startDate, @RequestParam String endDate,
//				@RequestParam String reason) {
//		
//		Long startDateLong = null;
//		Long endDateLong = null;
//		
//												   //2018-07-05T09:00:00
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		
//		String startDateString = startDate.replace("T", " ");
//		try {
//			startDateLong = sdf.parse(startDateString).getTime();
//			
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
//		
//		String endDateString = endDate.replace("T", " ");
//		try {
//			endDateLong = sdf.parse(endDateString).getTime();
//			
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
//		
//		leaveService.updateLeaveDate(eventId, new Timestamp(startDateLong), 
//														new Timestamp(endDateLong), reason);
//		return "mailCalendarChat/FullCalendar.jsp";
//	}
	
	@RequestMapping(value="/getAgentName")
	public void getAgentName(@RequestParam String LeaveStartDate, @RequestParam String LeaveEndDate,
			HttpServletRequest req,HttpServletResponse response) {
		System.out.println("==" + LeaveStartDate);

		response.setHeader("content-type", "charset=UTF-8");
		response.setCharacterEncoding("UTF-8");;
//		Long startDateLong= null;
//		Long endDateLong = null;
//		
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		try {
//			startDateLong = sdf.parse((setLeaveStartDate+" 00:00:00")).getTime();
//			endDateLong = sdf.parse((setLeaveEndDate+" 23:59:59")).getTime();
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
//		
//		System.out.println("start long : " + startDateLong);
		List<Object> LeaveAgentData = new ArrayList<Object>();
		Set<String> agentNameList = null;
		
		HttpSession s = req.getSession(false);
		EmployeeBean user=(EmployeeBean) s.getAttribute("LoginOK");		
//		    EmployeeBean user = employeeService.getEmployeeById(1);
		
			agentNameList = leaveService.getAgentName(java.sql.Timestamp.valueOf(LeaveStartDate),java.sql.Timestamp.valueOf(LeaveEndDate),user.getEmployeeId());
			System.out.println(agentNameList);
			System.out.println(agentNameList.size());
			
			Iterator<String> iter = agentNameList.iterator();
			while(iter.hasNext()) {
				Map<String,Object> listTemp = new HashMap<String,Object>();
				String tempArray[] = iter.next().split(" : ");
				listTemp.put("employeeId", tempArray[0]);
				listTemp.put("agentName", tempArray[1]);
				System.out.println(listTemp);
				LeaveAgentData.add(listTemp);
			}
			
			String jsonString =JSONValue.toJSONString(LeaveAgentData);
			try {
				response.getWriter().print(jsonString);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
//			return agentNameList;
//			return "FullCalendar123";
//		for(String value : agentNameList) {
//			System.out.println(value);
//		}		
	}
	
	@RequestMapping(value="/createLeaveBean")
	public String createLeaveBean(@RequestParam String Start,@RequestParam String End
			,@RequestParam String Agent,@RequestParam String Reason,HttpServletRequest req) {
		
		LeaveBean bean = new LeaveBean();
		HttpSession s = req.getSession(false);
		EmployeeBean user=(EmployeeBean) s.getAttribute("LoginOK");
//		EmployeeBean user = employeeService.getEmployeeById(1);
		
		bean.setStartDate(java.sql.Timestamp.valueOf(Start));
		bean.setEndDate(java.sql.Timestamp.valueOf(End));
		
		System.out.println(Agent+"------------------"+Reason);
//		int a = Integer.valueOf(Agent);
//		EmployeeBean b = employeeService.getEmployeeById(a);		
//		bean.setAgentName(b.getEmployeeName());
		bean.setAgentName(Agent);
		
		bean.setReason(Reason);
		bean.setState(0);
		bean.setApproval(1);
		bean.setEmployeeId(user.getEmployeeId());
		System.out.println("rrrrrrrrrrrrrr");
		leaveService.createLeaveBean(bean);
		return "redirect:FullCalendar";
	}
/////////////////////////////////////////////////////////////////////////////////////////////////
//金昌的
	@ModelAttribute("employeeList")
	 public Map<Integer, String> getCategoryList(){
	  Map<Integer,String> employeeMap=new HashMap<>();
	  List<EmployeeBean> list=examService.getEmployeeList();
	  
	  for(EmployeeBean cb:list) {
	   employeeMap.put(cb.getEmployeeId(), cb.getEmployeeName());
	  }
	  return employeeMap;
	 }
/////////////////////////////////////////////////////////////////////////////////////////////////	
	@RequestMapping(value="/testgetALLBean")
	public String getAllBean(Model model) {
		List<LeaveBean> list = leaveService.getAllLeaveBean();
		model.addAttribute("test", list);
		return "test.jsp";
	}
	
	@RequestMapping(value="/test")
	public String TEST(Model model) {
//		LeaveBean Leave = new LeaveBean();
//		Leave.setAgentName("孫小美");
//		Leave.setApproval(0);
//		Leave.setState(0);
//		Leave.setEndDate(java.sql.Timestamp.valueOf("2011-11-11 08:00:00"));
//		Leave.setStartDate(java.sql.Timestamp.valueOf("2011-11-12 20:00:00"));
//		Leave.setEmployeeId(1);
//		leaveService.createLeaveBean(Leave);
		
//		leaveService.updateLeaveBean(5, java.sql.Timestamp.valueOf("2011-11-11 08:00:00"), java.sql.Timestamp.valueOf("2011-11-12 20:00:00"), "rrrrr");
//		leaveService.deleteLeaveBean(5);
//		leaveService.approvalLeave(5);
//		System.out.println(leaveService.getLeaveBeanByEmployeeId(1));
		EmployeeBean user = employeeService.getEmployeeById(1);
			
		System.out.println(leaveService.getAgentName(java.sql.Timestamp.valueOf("2018-07-29 08:00:00"), java.sql.Timestamp.valueOf("2018-07-29 20:00:00"),user.getEmployeeId()));
		return "test.jsp";
	}
}
