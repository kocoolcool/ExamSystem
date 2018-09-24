package com.exam.ExamManage.controller;


import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exam.ExamManage.model.ExamBean;
import com.exam.ExamManage.model.TestBean;
import com.exam.ExamManage.service.ExamService;
import com.exam.backManageInfo.model.ClassBean;
import com.exam.examAppointment.model.AppBean;
import com.exam.leaveManage.service.LeaveService;
import com.exam.loginSystem.model.StudentBean;
import com.exam.loginSystem.service.StudentService;
import com.exam.mailCalendarChat.model.EmployeeBean;
import com.exam.mailCalendarChat.service.EmployeeService;
import com.revinate.sendgrid.SendGrid;
import com.revinate.sendgrid.exception.SendGridException;
import com.revinate.sendgrid.model.Email;
import com.revinate.sendgrid.model.Response;

@Controller
public class ExamController {
	@Autowired
	ExamService examService;
	@Autowired
	EmployeeService employeeService; 
	@Autowired
	LeaveService leaveService;
	@Autowired
	StudentService studentService;
	@Autowired
	ServletContext context;
	
	//考試選單目錄
	@RequestMapping("/ExamManage")
	public String Exam(Model model) {
	model.addAttribute("title","Welcome");
	model.addAttribute("subtitle","考試選單");
	return "ExamManage/ExamMenu.jsp";
	}
	
	//顯示所有考試
	@RequestMapping("/ExamManage/AllExam")
	public String selectAllexam(Model model) {
	List<ExamBean>listOnly0=examService.getAllExamOnly0();
	List<ExamBean>listOnly1=examService.getAllExamOnly1();
	model.addAttribute("exam",listOnly0);
	model.addAttribute("exam1",listOnly1);
	return "ExamManage/AllExam.jsp";
	}
	
//	//顯示所有考試
//	@RequestMapping("/ExamManage/AllExamOnly0")
//	public String selectAllexamOnly0(Model model) {
//	List<ExamBean>list=examService.getAllExam();
//	model.addAttribute("exam",list);
//	return "ExamManage/AllExam.jsp";
//	}
	
	//顯示所有班級清單
	@RequestMapping("/ExamManage/AllClassList")
	public String selectAllClassId(Model model) {
			List<String> list=examService.getAllClassId();
		model.addAttribute("classes",list);
		return "ExamManage/AllClassList.jsp";
	}
	
	//顯示被選擇班級的考試清單
	@RequestMapping("/ExamManage/{classId}")
	public String selectExamsByClass(@PathVariable("classId")String classID,Model model) {
		List<ExamBean>ExamBeans=examService.getExamsByClass(classID);
		model.addAttribute("exam",ExamBeans);
		return "ExamManage/AllExam.jsp";
	}
	
	//顯示被選擇的考試明細
	@RequestMapping("/ExamManage/ExamDetail")
	public String selectExamById(@RequestParam("ExamId") String examId,Model model) {
		List<AppBean> bean=examService.getStudentByExamId(examId);
		List<StudentBean> bean1=new ArrayList<>();
		Map<Object,Object> mapdata=new HashMap<Object,Object>();
		List<TestBean> testList=new ArrayList<>();
		
		for(AppBean cb:bean) {
			TestBean test1=new TestBean();
			StudentBean sb=studentService.getStudentBean(cb.getStudentid());
			Blob blobTemp=sb.getPhoto();
			byte[] byteTemp;
			try {
				byteTemp = blobTemp.getBytes(1, (int)blobTemp.length());
				String baseImageTemp = Base64.getEncoder().encodeToString(byteTemp);
				test1.setPhoto(baseImageTemp);
				test1.setName(sb.getStudentName());
				test1.setGendar(sb.getGender());
				test1.setStudentClass(sb.getClassId());
				test1.setDate(cb.getApplicationdate());
				testList.add(test1);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		model.addAttribute("examMap",testList);
		
		return "ExamManage/ExamDetail.jsp";
	}
	
	
	//InsertExam1-1(暫不用)
	@RequestMapping(value="/ExamManage/addExam",method=RequestMethod.GET)
	public String getAddNewExamForm(Model model) {
		ExamBean eb=new ExamBean();
		model.addAttribute("ExamBean",eb);
		return "ExamManage/addExam.jsp";
	}
	
	//InsertExam1-2(暫不用)
	@RequestMapping(value="/ExamManage/addExam",method=RequestMethod.POST)
	public String processAddNewExamForm(@ModelAttribute("ExamBean")ExamBean eb) {
		examService.insertExam(eb);
		return "redirect:/ExamManage/AllExam";
	}
	//InsertExam2-1
	@RequestMapping(value="/ExamManage/insert")
	public String insert(@RequestParam("classId")String classId,@RequestParam("examTime")String examTime,@RequestParam("examSubject")String examSubject,@RequestParam("maxAppointment")String maxAppointment,@RequestParam("employeeId")String employeeId,@RequestParam("examId")String examId) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = df.format(new Date());
		Timestamp ts = Timestamp.valueOf(examTime);
	    Integer	ma=Integer.valueOf(maxAppointment);
	    Integer ei=Integer.valueOf(employeeId);
	    ExamBean bean=new ExamBean();
	    bean.setExamId(examId);
	    bean.setClassId(classId);
	    bean.setExamSubject(examSubject);
	    bean.setExamTime(ts);
	    bean.setEmployeeId(ei);
	    bean.setMaxAppointment(ma);
	    bean.setCurrentAppointment(0);
	    examService.insertExam(bean);
	    
	    //Insert完自發信件
	    
	     List<StudentBean> list=examService.getStudentByClassId(classId);
	     	     
	     	 for(StudentBean cb:list) {
	     		SendGrid sendGrid = SendGrid.create("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").build();
	     		Email email = new Email();
	     		email.addTo(cb.getEmail());
	     		email.setFrom("EEIT101021@gmail.com");
	     		email.setSubject("考試開放報名");
	     		email.setHtml(" 您好!" +cb.getStudentName()+ "<br>" +"偉康科技已開放考試報名，歡迎有興趣之考生報名。"+"<br>"+"時間於"+ts.toString().substring(0, 16)+"<br><br><br>" +  "<br>" + "主辦單位 偉康科技" + "<br>"+
	     				"聯絡資訊:"+ "<br>" +"電話 :886-2-7701-5899 "+ "<br>"+"地址 : 台北市松山區南京東路五段89號9樓" 
	     				);	
	        try {
	            Response response = sendGrid.mail().send(email);
	            System.out.println(response);
	            sendGrid.close();
	        } catch (SendGridException e) {
	            e.printStackTrace();
	            sendGrid.close();
	        }
	    }
		return "ExamManage/AllExam";
	}
	
	
	//UpdateExam1-1(暫不用)
	@RequestMapping(value="/ExamManage/updateExam",method=RequestMethod.GET)
	public String getUpdateNewExamForm(Model model) {
		ExamBean eb=new ExamBean();
		System.out.println("Get:" +eb);
		model.addAttribute("ExamBean",eb);
		return "ExamManage/updateExam.jsp";
	}
	
	//UpdateExam1-2(暫不用)
	@RequestMapping(value="/ExamManage/updateExam",method=RequestMethod.POST)
	public String processUpdateNewExamForm(@ModelAttribute("ExamBean")ExamBean eb) {
		examService.updateAll(eb.getExamId(), eb.getClassId(), eb.getExamTime(), eb.getExamSubject(), eb.getEmployeeId(), eb.getMaxAppointment());
		return "redirect:/ExamManage/AllExam";
	}
	
//	UpdateExam2-1
	@RequestMapping("/ExamManage/getExamById")
	public void getExamById(@RequestParam("examId") String examId,HttpServletRequest request,HttpServletResponse response) {
		ExamBean bean=examService.getExamByID(examId);
		List list = new ArrayList();
		list.add(bean.getClassId());
		list.add(bean.getExamTime().toString().substring(0, 10));
		list.add(bean.getExamTime().toString().substring(11, 16));
		list.add(bean.getExamSubject());
		list.add(bean.getMaxAppointment());
		list.add(bean.getEmployeeId());
		list.add(bean.getExamId());
		response.setHeader("content-type", "charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		String jsonString =JSONValue.toJSONString(list);
		try {
			response.getWriter().print(jsonString);
		} catch (IOException e) {
			e.printStackTrace();
		};
	}
	
//	UpdateExam2-2
	@RequestMapping(value="/ExamManage/update")
	public String update(@RequestParam("classId")String classId,@RequestParam("examTime")String examTime,@RequestParam("examSubject")String examSubject,@RequestParam("maxAppointment")String maxAppointment,@RequestParam("employeeId")String employeeId,@RequestParam("examId")String examId) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = df.format(new Date());
		Timestamp ts = Timestamp.valueOf(examTime);
	    Integer	ma=Integer.valueOf(maxAppointment);
	    Integer ei=Integer.valueOf(employeeId);
		examService.updateAll(examId, classId, ts, examSubject, ei, ma);
		return "redirect:/ExamManage/AllExam";
	}
	
	//Delete真刪除
	@RequestMapping(value="/ExamManage/delete")
	public String delete(@RequestParam("examId")String examId) {
		examService.deleteExam(examId);
		return "redirect:/ExamManage/AllExam";
	}
	
	//Delete只改狀態
		@RequestMapping(value="/ExamManage/deleteTo0")
		public String deleteTo0(@RequestParam("examId")String examId) {
			examService.updateStatus(1,examId);
			return "redirect:/ExamManage/AllExam";
		}
	
	//${classMap}
	//篩選出班級清單
	@ModelAttribute("classList")
	public Map<String,String>getClassList(){
		Map<String,String> classMap=new HashMap<>();
		List<ClassBean> list=examService.getAllClass();
		for(ClassBean cb:list) {
			classMap.put(cb.getClassId(), cb.getClassId());
		}
		return classMap;
	}
	
	//篩選出員工清單
	@ModelAttribute("employeeList")
	public Map<Integer, String> getCategoryList(){
		Map<Integer,String> employeeMap=new HashMap<>();
		List<EmployeeBean> list=examService.getAllEmployeeOnly0();
		
		for(EmployeeBean cb:list) {
			employeeMap.put(cb.getEmployeeId(), cb.getEmployeeName());
		}
		return employeeMap;
	}
	
	
	//篩選出所有員工清單用在modal暫時沒用到
		@RequestMapping(value="/ExamManage/employeeList88888")
		public void employeeList1(Model model,HttpServletRequest request,HttpServletResponse response) {
				List<String> list=examService.getAllEmployee();
				model.addAttribute("employee",list);
				response.setHeader("content-type", "charset=UTF-8");
				response.setCharacterEncoding("UTF-8");
				String jsonString =JSONValue.toJSONString(list);
				try {
					response.getWriter().print(jsonString);
				} catch (IOException e) {
					e.printStackTrace();
				};
		}

		
		
		//報表使用查各科總平均
		@RequestMapping("ExamManage/showData1")
		public  String getScore(Model model) {
			int javaScore=0;
			int cScore=0;
			int pythonScore=0;
			int ccScore=0;
			int javaScriptScore=0;
			int otherScore=0;
			int count1=0;
			int count2=0;
			int count3=0;
			int count4=0;
			int count5=0;
			int count6=0;
			int javaScoreAvg=0;
			int cScoreAvg=0;
			int pythonScoreAvg=0;
			int ccScoreAvg=0;
			int javaScriptScoreAvg=0;
			int otherScoreAvg=0;
			
				List<AppBean> list=examService.getScore();
			for(AppBean ab:list) {
			String a=ab.getExamid().substring(0, ab.getExamid().indexOf("2"));
			StudentBean sb=studentService.getStudentBean(ab.getStudentid());
//				System.out.println(sb.getScore());
				if(sb.getScore()!=null) {
			switch(a) {    
		    case "Java":javaScore+=sb.getScore();
		    			count1++;	
		    			System.out.println("javaScore"+count1+":"+javaScore);
		    			break ;
		    case "C#":  cScore+=sb.getScore();
						count2++;	
						System.out.println("cScore"+count2+":"+cScore);
		    			break; 
		    
		    case "Python": pythonScore+=sb.getScore();
						count3++;	
						System.out.println("pythonScore"+count3+":"+pythonScore);
						break; 
		    	
		    case "C++": ccScore+=sb.getScore();
		    			count4++;	
						System.out.println("ccScore"+count4+":"+ccScore);
		    			break;    
   
  
		    case "JavaScript":  javaScriptScore+=sb.getScore();
						count5++;	
						System.out.println("javaScriptScore"+count5+":"+javaScriptScore);
						break;    
		    default: otherScore+=sb.getScore();
						count6++;	
						System.out.println("otherScore"+count6+":"+otherScore);
						break;     
			}
		}    

			
		}
			if(count1 !=0) {
		    javaScoreAvg=javaScore/count1;
			System.out.println("javaScoreAvg"+javaScoreAvg);
			}
			if(count2 !=0) {
			cScoreAvg=cScore/count2;
			System.out.println("cScoreAvg"+cScoreAvg);
			}
			if(count3 !=0) {
		    pythonScoreAvg=pythonScore/count3;
			System.out.println("pythonScoreAvg"+pythonScoreAvg);
			}
			if(count4 !=0) {
		    ccScoreAvg=ccScore/count4;
			System.out.println("ccScoreAvg"+ccScoreAvg);
			}
			if(count5 !=0) {
		    javaScriptScoreAvg=javaScriptScore/count5;
			System.out.println("javaScriptScoreAvg"+javaScriptScoreAvg);
			}
			if(count6 !=0) {
		    otherScoreAvg=otherScore/count6;
			System.out.println("otherScoreAvg"+otherScoreAvg);
			}
			int[] allAvg = { javaScoreAvg, cScoreAvg, pythonScoreAvg, ccScoreAvg, javaScriptScoreAvg,otherScoreAvg };
			model.addAttribute("allAvg",allAvg);
			
			
			return "ExamManage/showData1.jsp";
		
		}	
		
		//報表使用查各科要求薪資
		@RequestMapping("ExamManage/showData2")
		public  String getSalary(Model model) {
//			int javaSalary=0;
//			int cSalary=0;
//			int pythonSalary=0;
//			int ccSalary=0;
//			int javaScriptSalary=0;
////			int otherScore=0;
//			int count1=0;
//			int count2=0;
//			int count3=0;
//			int count4=0;
//			int count5=0;
////			int count6=0;
//			int javaSalaryAvg=0;
//			int cSalaryAvg=0;
//			int pythonSalaryAvg=0;
//			int ccSalaryAvg=0;
//			int javaScriptSalaryAvg=0;
////			int otherScoreAvg=0;
//			
//				List<EmployeeBean> list=employeeService.getAllEmployees();
//			for(AppBean ab:list) {
//			String a=ab.getExamid().substring(0, ab.getExamid().indexOf("2"));
//			StudentBean sb=studentService.getStudentBean(ab.getStudentid());
////				System.out.println(sb.getScore());
//				if(sb.getScore()!=null) {
//			switch(a) {    
//		    case "Java":javaScore+=sb.getScore();
//		    			count1++;	
//		    			System.out.println("javaScore"+count1+":"+javaScore);
//		    			break ;
//		    case "C#":  cScore+=sb.getScore();
//						count2++;	
//						System.out.println("cScore"+count2+":"+cScore);
//		    			break; 
//		    
//		    case "Python": pythonScore+=sb.getScore();
//						count3++;	
//						System.out.println("pythonScore"+count3+":"+pythonScore);
//						break; 
//		    	
//		    case "C++": ccScore+=sb.getScore();
//		    			count4++;	
//						System.out.println("ccScore"+count4+":"+ccScore);
//		    			break;    
//   
//  
//		    case "JavaScript":  javaScriptScore+=sb.getScore();
//						count5++;	
//						System.out.println("javaScriptScore"+count5+":"+javaScriptScore);
//						break;    
//		    default: otherScore+=sb.getScore();
//						count6++;	
//						System.out.println("otherScore"+count6+":"+otherScore);
//						break;     
//			}
//		}    
//
//			
//		}
//			if(count1 !=0) {
//		    javaScoreAvg=javaScore/count1;
//			System.out.println("javaScoreAvg"+javaScoreAvg);
//			}
//			if(count2 !=0) {
//			cScoreAvg=cScore/count2;
//			System.out.println("cScoreAvg"+cScoreAvg);
//			}
//			if(count3 !=0) {
//		    pythonScoreAvg=pythonScore/count3;
//			System.out.println("pythonScoreAvg"+pythonScoreAvg);
//			}
//			if(count4 !=0) {
//		    ccScoreAvg=ccScore/count4;
//			System.out.println("ccScoreAvg"+ccScoreAvg);
//			}
//			if(count5 !=0) {
//		    javaScriptScoreAvg=javaScriptScore/count5;
//			System.out.println("javaScriptScoreAvg"+javaScriptScoreAvg);
//			}
//			if(count6 !=0) {
//		    otherScoreAvg=otherScore/count6;
//			System.out.println("otherScoreAvg"+otherScoreAvg);
//			}
//			int[] allAvg = { javaScoreAvg, cScoreAvg, pythonScoreAvg, ccScoreAvg, javaScriptScoreAvg,otherScoreAvg };
//			model.addAttribute("allAvg",allAvg);
			
			
			return "ExamManage/showData2.jsp";
		
		}	
//		-------------------------以下沒用到--------------------------------------	
		
//		@RequestMapping(value="/getEmployeeName")
//		public void getAgentName(@RequestParam String examTime,HttpServletResponse response) {
//			response.setHeader("content-type", "charset=UTF-8");
//			response.setCharacterEncoding("UTF-8");;
//			List<Object> LeaveAgentData = new ArrayList<Object>();
//			Set<String> agentNameList = null;
//			
//			    EmployeeBean user = employeeService.getEmployeeById(1);
//			
//				agentNameList = leaveService.getAgentName(java.sql.Timestamp.valueOf(examTime),user.getEmployeeId());
//				
//				Iterator<String> iter = agentNameList.iterator();
//				while(iter.hasNext()) {
//					Map<String,Object> listTemp = new HashMap<String,Object>();
//					String tempArray[] = iter.next().split(" : ");
//					listTemp.put("employeeId", tempArray[0]);
//					listTemp.put("agentName", tempArray[1]);
//					System.out.println(listTemp);
//					LeaveAgentData.add(listTemp);
//				}
//				
//				String jsonString =JSONValue.toJSONString(LeaveAgentData);
//				try {
//					response.getWriter().print(jsonString);
//				} catch (IOException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//		}
		
		
		
		
	//新增一筆考試方法二
//	@RequestMapping(value="/ExamManage/addExam",method=RequestMethod.POST)
//	public String createExam(@RequestParam("examId") String examId,@RequestParam("classId") String classId, @RequestParam("examTime") Timestamp examTime,
//			@RequestParam("examSubject") String examSubject,@RequestParam("maxAppointment")Integer maxAppointment,
//			@RequestParam("employeeId")Integer employeeId) {
//		
//		ExamBean bean = new ExamBean();
//		bean.setExamId(examId);
//		bean.setClassId(classId);;
//		bean.setExamTime(examTime);;
//		bean.setExamSubject(examSubject);
//		bean.setMaxAppointment(maxAppointment);
//		bean.setEmployeeId(employeeId);
//		examService.insertExam(bean);
//		return "redirect:/ExamManage/AllExam";
//	}
	
	//由id找到一個考試，並傳json回去
//		@RequestMapping(value="/getExamByExamId")
//		public void getEmailTemplateById(@RequestParam("examId") String examId, Model model, HttpServletRequest request,HttpServletResponse response) {
//		
//			ExamBean bean =examService.getExamByID(examId);
//			
//			response.setHeader("content-type", "charset=UTF-8");
//			response.setCharacterEncoding("UTF-8");
//			
//			List list = new ArrayList();
//			list.add(bean.getExamId());
//			list.add(bean.getClassId());
//			list.add(bean.getExamTime());
//			list.add(bean.getExamSubject());
//			list.add(bean.getMaxAppointment());
//			list.add(bean.getExamId());
//			 String jsonString =JSONValue.toJSONString(list);
//			try {
//				response.getWriter().print(jsonString);
//			} catch (IOException e) {
//				
//				e.printStackTrace();
//			};
//		}
			
		//更新一場考試
//		@RequestMapping(value="/ExamManage/updateExam")
//		public String updateEmailTemplate(@RequestParam("examId") String examId, 
//				@RequestParam("classId") String classId, @RequestParam("examTime") Timestamp examTime,
//				@RequestParam("examSubject") String examSubject,@RequestParam("maxAppointment")Integer maxAppointment,
//				@RequestParam("employeeId")Integer employeeId) {
//			
//			examService.updateAll(examId, classId, examTime, examSubject, employeeId, maxAppointment);
//		
//			return "redirect:/ExamManage/AllExam";
//		}
	
	
	
	//顯示所選擇的考試有點問題
//	@RequestMapping("/ExamManage/{examId}")
//	public String getExam(@PathVariable("examId")String examId,Model model) {
//		ExamBean bean=examService.getExamByID(examId);
//		System.out.println(bean);
//		model.addAttribute("exam",bean);
//		return "ExamManage/AllExam.jsp";
//	}
	
//	  @RequestMapping(value = "/save", method = RequestMethod.POST)
//       public String saveExam(@ModelAttribute("exam") ExamBean examBean,
//                     BindingResult result) {
//		  	examService.insertExam(examBean);
//              return "redirect:/ExamManage/AllExam";
//       }
	
//	  @RequestMapping("/delete/{examId}")
//       public String deleteBook(@PathVariable("examId") String examId) {
//		     examService.deleteExam(examId);
//              return "redirect:/ExamManage/AllExam";
//       }	
	
	
//	@GetMapping("/ExamManage/showAllExam")
//	public String showAllExam(Model model,@RequestParam(defaultValue="0") int page) {
//	model.addAttribute("data",examRepo.findAll(PageRequest.of(page, 4)));
//	return "ExamManage/showAllExam.jsp";
//	}
//	
//	@PostMapping("/ExamManage/save")
//	public String save(ExamBean c) {
//		examRepo.save(c);
//		return "redirect:/ExamManage/showAllExam";
//	}
//	@GetMapping("/ExamManage/delete")
//	public String deleteExam(Integer id) {
//		examRepo.deleteById(id);
//		return "redirect:/ExamManage/showAllExam";
//	}
//	@GetMapping("/ExamManage/findOne")
//	@ResponseBody
//	public ExamBean fineOne(Integer id) {
//		return	examRepo.getOne(id);
//		
//	}
}
