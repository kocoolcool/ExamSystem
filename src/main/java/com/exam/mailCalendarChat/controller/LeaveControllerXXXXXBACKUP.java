package com.exam.mailCalendarChat.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.exam.leaveManage.model.LeaveBean;
import com.exam.leaveManage.service.LeaveService;
import com.exam.mailCalendarChat.repository.EmployeeDAO;

@Controller
public class LeaveControllerXXXXXBACKUP {
	
//	@Autowired
//	LeaveService leaveService;
//	
//	@Autowired
//	EmployeeDAO employeeDAO;
//	
////	@RequestMapping(value="/FullCalendar")
////	public String FullCalendar(Model model) {
////		
////		getAllLeave(model);
////		
////		return "mailCalendarChat/FullCalendar.jsp";
////	}
//	//寫在@RequestMapping(value="/FullCalendar")裡面
//	public void getAllLeave(Model model) {
//		//先得到所有的LeaveBean
//		List<LeaveBean> list = leaveService.getAllLeaveBean();
//		//用來篩選要保留的欄位，並傳送
//		List<Object> allLeaveDataList = new ArrayList<Object>();
//		for(LeaveBean bean :list) {
//			
//			if(bean.getState()==0) {
//
//				//當作FullCalendar的作為["title" : '', "start":'', "end":""]的map
//				Map<String,Object> listTemp = new HashMap<String,Object>();
////				List<Object> listTemp = new ArrayList<Object>();
//				//當作FullCalendar的title
//				listTemp.put("title", bean.getEmployeebean().getEmployeeName() + " : " + bean.getReason());
//				
//				//當作FullCalendar的start
//				String startTime = bean.getStartDate().toString();
//				String[] startTimeSplit = startTime.split(" ");
//				
//				listTemp.put("start", startTimeSplit[0]+"T"+startTimeSplit[1].substring(0,8));
//				
//				//當作FullCalendar的end
//				String endtTime = bean.getEndDate().toString();
//				String[] endTimeSplit = endtTime.split(" ");
//				
//				listTemp.put("end", endTimeSplit[0]+"T"+endTimeSplit[1].substring(0,8));
//				
//				//將enventId也當參數傳過去
//				listTemp.put("eventId", bean.getEventId());
//				
//				//將reason也當參數傳過去
//				listTemp.put("reason", bean.getReason());
//				
//				listTemp.put("color", "#378006");
//				
//				listTemp.put("textColor", "white");
//				
//				allLeaveDataList.add(listTemp);
//			}
//			String jsonString =JSONValue.toJSONString(allLeaveDataList);
//			model.addAttribute("allLeaveData",jsonString);
//		}
//
//	}
//	
//	
//	
//	@RequestMapping(value="/deleteLeaveBean")
//	public String deleteLeaveBean(@RequestParam int eventId) {
//		
//		leaveService.deleteLeaveBean(eventId);
//		return "redirect:FullCalendar";
//	}
//	
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
//		leaveService.updateLeaveBean(eventId, new Timestamp(startDateLong), 
//														new Timestamp(endDateLong), reason);
//		return "mailCalendarChat/FullCalendar.jsp";
//	}
//	
//	@RequestMapping(value="/getAgentName")
//	public void getAgentName(@RequestParam String setLeaveStartDate, @RequestParam String setLeaveEndDate) {
//		
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
//		List<String> agentNameList =leaveService.getAgentName(new Timestamp(startDateLong), new Timestamp(endDateLong));
//		for(String value : agentNameList) {
//			System.out.println(value);
//		}
		
//	}
	
}
