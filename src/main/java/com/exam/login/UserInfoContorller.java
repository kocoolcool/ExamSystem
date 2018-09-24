package com.exam.login;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.exam.google.GoogleVerify;
import com.exam.loginSystem.model.StudentBean;
//import com.exam.model.UserInfoBean;


import com.exam.loginSystem.service.StudentService;
import com.exam.mailCalendarChat.service.CMManageService;
import com.exam.mailCalendarChat.service.EmployeeService;
import com.exam.mailCalendarChat.model.CMBeanForShow;
import com.exam.mailCalendarChat.model.CMManageBean;
import com.exam.mailCalendarChat.model.EmployeeBean;


@Controller
public class UserInfoContorller {
	
	
	@Autowired
	UserInfoService userInfoService;

	@Autowired
	StudentService studentService;
	
	@Autowired
	EmployeeService employeeService;
	
	@Autowired
	CMManageService cMManageService;
	
	
	//從js對應過來=>完成google驗證的方式
	@RequestMapping(value = "loginSystem/Template", method = RequestMethod.POST)
//	public String homeLogin(Model model, @ModelAttribute("UserInfoBean") UserInfoBean ub, HttpServletRequest req,String email,String password) {
	public ModelAndView homeLogin(Model model, StudentBean sb, HttpServletRequest req, HttpServletResponse response,
			HttpSession session, String email,String password, RedirectAttributes redirectAttributes) {
	    //ub.setUserEmail(email);
	    //ub.setUserPassword(password);
		String idToken = (String) req.getParameter("idToken");
		//System.out.println(idToken);
		if (idToken != null) {
			GoogleVerify gv = new GoogleVerify(idToken);//idToken封包解譯出的資料
			try {
				gv.googleVerify();
				//gv.getEmail()會得到登入者的googleEmail
				
				
				//撈出全部學生資料比對該email有沒有在學生table->有就設定身分識別碼(取出值)  給一個Httpsession型別的物件存放LoginOK屬性
				List<StudentBean> list1= studentService.getAllStudents();
		        for(StudentBean itsForMap: list1) {                                          //表示從list陣列中，從陣列第一個值取值取到最後一個值
		        	if(itsForMap.getEmail().equals(gv.getEmail())) {
		        		
		    			StudentBean sb2= new StudentBean();
		    			sb2= studentService.getStudentBeanByEmail(gv.getEmail());
		    			
		    			System.out.println("現在的一筆學生資料 " + sb2);
		    			
		    			
						session= req.getSession(false);
						if(session==null) {
						  session= req.getSession();
						}
		    			session.setAttribute("LoginOK", sb2);
		    			session.setAttribute("WhichIdentity", "2");           //Session裡面會有登入之認證和身分識別碼
		    			session.setAttribute("studentId", sb2.getStudentId());//新增
		    			System.out.println("進到google驗證=>如果google帳號已經存在學生資料庫  則搜尋出一筆資料");

		    			
		    			//////////////////////////////////////////////////////
		    			///////////////////////////////////////////////////////
		    			////////輪撥牆////////////////////////////////
		    			List<CMManageBean> allCMManageBeanSotredList= cMManageService.getAllCMManageBeanByOrder();
		    			List<CMBeanForShow> allCMBeanForShowList = new ArrayList<CMBeanForShow>();
		    			
		    			for(CMManageBean eachBean : allCMManageBeanSotredList) {
		    				
		    				CMBeanForShow cMBeanForShow = new CMBeanForShow();
		    				cMBeanForShow.setTitle(eachBean.getTitle());
		    				cMBeanForShow.setLinkURL(eachBean.getLinkURL());
		    				Blob blobTemp = eachBean.getImage();
		    				
		    				if(blobTemp != null) {
		    					try {
		    						byte[] byteTemp = blobTemp.getBytes(1, (int)blobTemp.length());
		    						String stringTemp = Base64.getEncoder().encodeToString(byteTemp);
		    						cMBeanForShow.setBase64image(stringTemp);
		    						allCMBeanForShowList.add(cMBeanForShow);
		    					} catch (SQLException e) {
		    						// TODO Auto-generated catch block
		    						e.printStackTrace();
		    					}
		    				}
		    				
		    			}
//		    			model.addAttribute("allCMBeanForShowList",allCMBeanForShowList);
//		    			redirectAttributes.addFlashAttribute("allCMBeanForShowList",allCMBeanForShowList);
		    			session.removeAttribute("allCMBeanForShowList");
		    			session.setAttribute("allCMBeanForShowList",allCMBeanForShowList);
		    			////////////////////////////////////////////////
		    			/////////////////////////////////////////////////////
		    			///////////////////////////////////////////////////
		    			
		    			
		    			
		    			
		    			return new ModelAndView("redirect:/index_Student");
		        	}
		        }
				
		        
				List<EmployeeBean> list2= employeeService.getAllEmployees();
		        for(EmployeeBean itsForMap: list2) {                                          //表示從list陣列中，從陣列第一個值取值取到最後一個值
		        	if(itsForMap.getEmail().equals(gv.getEmail())) {
		        		
		        		EmployeeBean eb= new EmployeeBean();
		    			eb= employeeService.getEmployeeBeanByEmail(gv.getEmail());
		    			System.out.println("現在的一筆員工資料 " + eb);
		    			
		    			
						session= req.getSession(false);
						if(session==null) {
						  session= req.getSession();
						}
		    			session.setAttribute("LoginOK", eb);
		    			session.setAttribute("WhichIdentity", eb.getWhichIdentity());
		    			if(eb.getWhichIdentity()== 1) {
			    			System.out.println("進到google驗證=>如果google帳號已經存在員工資料庫  則搜尋出一筆資料(1)");
							return new ModelAndView("redirect:/index_Exami");
		    			}
		    			else {
			    			System.out.println("進到google驗證=>如果google帳號已經存在員工資料庫  則搜尋出一筆資料(0)");
						    return new ModelAndView("redirect:/index_Admin");
		    			}//else結束處
		        	}//外層if結束處
		        }//for迴圈結束處
				
		        
				List<StudentBean> list3= studentService.getAllStudents();
				List<EmployeeBean> list4= employeeService.getAllEmployees();
		        for(StudentBean itsForMap: list3) {
		        	if(itsForMap.getEmail().equals(gv.getEmail())==false) {
		        		for(EmployeeBean itsForMap2: list4) {
				        	if(itsForMap2.getEmail().equals(gv.getEmail())==false) {
				    			System.out.println("進到google驗證=>google帳號不存在任何資料庫  轉向註冊頁");
							    return new ModelAndView("redirect:register1");
				        	}
				        	else {
				        		//什麼都不做
				        	}
		        		}			
		        	}
		        	else{
		        		//什麼都不做
		        	}
		        }
		        
		        
		        //原本的程式碼
//				//存google帳戶的資訊進資料庫->如果這個google帳號不曾登入->蔚慶將之存進資料庫(但我可以做別的事)
//				if (userInfoService.checkGoogle(gv.getEmail()) == false) {//.checkGoogle()是以一個google使用者名稱得到資料庫內一筆資料
//					System.out.println("進到google驗證=>此google帳號不存在資料庫內");
//					return new ModelAndView("redirect:/register");
//					//ub.setUserName(gv.getName());
//					//ub.setUserEmail(gv.getEmail());
//					//ub.setGoogleUserId(gv.getUserId());
//					//ub.setGoogleAccount(true);
//					//userInfoService.addUser(ub);->把拿到的使用者資料存入資料庫
//					//session.setAttribute("user", sb);
//					//以session代表登入狀態
//				}else {
//					sb = userInfoService.getGoogleUserById(gv.getEmail());//如果google帳號已經存在資料庫  則搜尋出一筆資料  設定session物件
//
//					session= req.getSession(false);
//					
//					if(session==null) {
//					  session= req.getSession();
//					}
//					
//					session.setAttribute("LoginOK", sb);
//					System.out.println("進到google驗證=>如果google帳號已經存在資料庫  則搜尋出一筆資料");
//					return new ModelAndView("redirect:/Template");
//
//				}
		        //原本的程式碼

			} catch (GeneralSecurityException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			//下面原本是蔚慶的程式碼
//			return new ModelAndView("redirect:/holidays");//->這要改
//		}

//		if (ub != null) {
//			if (userInfoService.checkUser(ub)) {
//				ub = userInfoService.getUserEmail(ub.getUserEmail());
//				session.setAttribute("user", ub);
//				System.out.println("登入成功");
//				return new ModelAndView("redirect:/holidays");
//			} else {
//				UserInfoBean uf = userInfoService.getUserEmail(ub.getUserEmail());
//				if (uf == null) {
//					map.put("accountMsg", "帳號不存在");
//					
//				} else if (uf.getUserEmail().equals(uf.getUserEmail()))
//
//				{
//					map.put("accountMsg", "密碼錯誤");
//				}
//				System.out.println("登入失敗");
//				model.addAttribute("msg", map);
//				return new ModelAndView("redirect:/"+page);
//			}
//		
			//上面原本是蔚慶的程式碼
		}
		return new ModelAndView("redirect:/itIsSecret");
	}
     
	
//	@RequestMapping("/{page}/logout")
//	public ModelAndView logOut(@PathVariable String page,HttpSession session) {
//		
//			session.removeAttribute("user");
//	
//		
//		return new ModelAndView("redirect:/"+page);
//	}
	
	
	
//	@RequestMapping("/index")
//    public String index() {
//		return "index";
//	}
//	@RequestMapping("/hotels")
//	public String hotels() {
//		return "hotels";
//	}
//	@RequestMapping("/flights-hotels")
//	public String flights() {
//		return "flights-hotels";
//	}
//	
//	
//	@RequestMapping("/deals")
//	public String deals() {
//		return "deals";
//	}
//	@RequestMapping("/holidays")
//	public String holidays() {
//		return "holidays";
//	}
	
	
//	@RequestMapping("/signup")
//	public String signUp() {
//		return "signup";
//	}
//    
//	
//	@RequestMapping(value="/signup/index", method = RequestMethod.POST)
//	public ModelAndView registerAccount(UserInfoBean ub, String firstName, 
//		String lastName,String userNumber,String userEmail,String userPassword) {
//		ub.setUserName(lastName+firstName);
//		ub.setUserNumber(Integer.valueOf(userNumber));
//		ub.setUserEmail(userEmail);
//		ub.setUserPassword(userPassword);
//		if(!userInfoService.checkUser(ub)) {
//		    userInfoService.addUser(ub);	
//		};
//		return new ModelAndView("redirect:/index");
//	}
//	
//	@RequestMapping(value ="/holidays/update",method = RequestMethod.POST)
//	public ModelAndView updateAccount(UserInfoBean ub,String userNameUpdate, 
//			String userPasswordUpdate, String userNumberUpdate,String userEmailUpdate, HttpSession session) {
//		ub = userInfoService.getUserEmail(userEmailUpdate);
//		if(userNameUpdate.equals("") || userNameUpdate ==null) {
//		   
//		}else {
//			ub.setUserName(userNameUpdate);	
//		}
//		if(userPasswordUpdate.equals("") || userPasswordUpdate ==null) {
//	
//		}else {
//			ub.setUserPassword(userPasswordUpdate);	
//		}
//		if(userNumberUpdate.equals("") || userNumberUpdate ==null) {
//		    
//		}else {
//			ub.setUserNumber(Integer.valueOf(userNumberUpdate));
//		}
//		
//		userInfoService.updateUser(ub);
//        session.setAttribute("user", ub);
//		
//		return new ModelAndView("redirect:/holidays");
//	}
	
}
