package com.exam.loginSystem.controller;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.exam.loginSystem.model.StudentBean;
import com.exam.loginSystem.service.StudentService;


@Controller
public class StudentController {

	
	@Autowired//自動注入，不用new物件  能自動連線啟用物件的功能
	StudentService studentService;
	
	
	@Autowired
	ServletContext context;
	
	
	@RequestMapping("loginSystem/student") //用PK鍵搜尋單一筆資料
	public String getStudentById(@RequestParam("studentId") Integer id, Model model) {
		model.addAttribute("oneStudent", studentService.getStudentBean(id));
		return "loginSystem/student.jsp";  //跳轉至=student.jsp
	}
	
	
	
	//新增一筆學生資料（註冊頁）
	@RequestMapping(value="loginSystem/register1",method = RequestMethod.GET)//JSP網頁得到(get)控制器傳去的model物件
	public String getAddNewStudentForm(Model model) {
		StudentBean sb = new StudentBean();
	    model.addAttribute("studentBean",sb);
	    return "loginSystem/register1.jsp";
	}
	@RequestMapping(value="loginSystem/register1",method = RequestMethod.POST)
	
	public String AddNewStudentForm(@ModelAttribute("studentBean") StudentBean sb,
			Model model, BindingResult result, HttpServletRequest request) {
		//白名單列表lab09的287頁  partA
//		   String[] suppressedFields = result.getSuppressedFields();
//		   if (suppressedFields.length > 0) {
//			  throw new RuntimeException("嘗試傳入不允許的欄位: " 
//			  + StringUtils.arrayToCommaDelimitedString(suppressedFields));
//		   }
		//白名單列表修改結束處

		
		//是上傳照片程式碼368開始
		  MultipartFile studentImage = sb.getStudentImage();//從網頁上傳來的sb物件接收值為path="studentImage"(StudentBean內為了接收照片檔新增的屬性和get/set方式)
		  if (studentImage != null && !studentImage.isEmpty() ) {
		  String originalFilename = studentImage.getOriginalFilename();//抓上傳照片的檔名和副檔名
		    System.out.println(originalFilename);
		  String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		    System.out.println(ext);
		  String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		    System.out.println(rootDirectory);
		  //  建立Blob物件，交由 Hibernate 寫入資料庫
		  	  try {
				  byte[] b = studentImage.getBytes();  //檔案轉byte碼存入byte[]陣列
				  Blob blob = new SerialBlob(b);       //byte[]物件b傳入SerialBlob(建構子)成為blob物件
				  sb.setPhoto(blob);  //存入資料庫(塞值到photo變數(真正的學生table對應的StudentBean內之屬性名))
			  } catch(Exception e) {//抓住例外的狀況
				  e.printStackTrace();
				  throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			  }
			  sb.setPhotoName(sb.getStudentName()+"照片"+ext);
		  }
		  else {
			  sb.setPhotoName(null);
		  }
		  //以上是上傳照片程式碼	        
	    sb.setThisIsClass("Normal");
		sb.setWhichIdentity(1);
		//sb.setSalary(null);
		//sb.setStartWorkDate(null);
		sb.setClassId("Normal");
		sb.setWhichIdentity(1);
		//sb.setEncryptURL(null);
		//sb.getScore(null);
		
		studentService.createStudent(sb);//正式的新增一筆學生資料
	    return "redirect:/loginSystem/forSuccessRegister.jsp";
	}//add end
	
//	@InitBinder//白名單列表lab09的287頁  partA
//	public void whiteListing(WebDataBinder binder) {
//		binder.setAllowedFields(
//				"studentName",
//				"gender",
//				"address",
//				"phone",
//				"email",
//				"birthday",
//				"education",
//				"photo",
//				"photoName"
//				);
//		
//		
//	}
	
	
	//顯示一筆學生資料(顯示學生個人資料頁使用)                                     //JSP網頁得到(get)控制器傳去的model物件
	@RequestMapping(value="myStudentProfile" ,method=RequestMethod.GET) //用PK鍵搜尋單一筆資料
	public String myStudentProfile(@ModelAttribute("iCanNameSB") StudentBean sb, Model model, HttpSession session) {

		
		Object theId= session.getAttribute("studentId");
		String theId01=String.valueOf(theId);
		int theId02 = Integer.parseInt(theId01); 
		sb= studentService.getStudentBean(theId02);//撈出一行資料列
		model.addAttribute("myStudentBean", studentService.getStudentBean(theId02));

		
		return "myStudentProfile.jsp";  //跳轉至=myStudentProfile.jsp
	}
	
	
	//修改一筆學生資料(維護學生個人資料頁使用)                                     //JSP網頁得到(get)控制器傳去的model物件
	@RequestMapping(value="maintainStudentProfile" ,method=RequestMethod.GET)//consumes={"application/json"}
	
	public String getUpdateOneStudent(/*@RequestParam("studentId") Integer studentId, */
			@ModelAttribute("iCanNameStudentBean") StudentBean sb, Model model, HttpSession session) {
		  //System.out.println("1-----"+sb);
		Object theId= session.getAttribute("studentId");
		String theId01=String.valueOf(theId);
		int theId02 = Integer.parseInt(theId01); 
		//studentId= theId02;
		sb= studentService.getStudentBean(theId02/*sb.getStudentId()*/);//撈出一行資料列
		  //System.out.println("2-----"+sb);
		               //sb.setClassId("normal");//為了測試的
		
		
		//防止註冊後startWorkDate為空的狀態下=>修改個人資料時無法update的問題(要注意卡在startWorkDate的型別是Date的情況)
		if(sb.getStartWorkDate()== null) {
		               String timeStr = "1970-01-05";//故而給個任意日期以防止startWorkDate為空。
				       java.util.Date javaUtilDate = new java.util.Date();
				       SimpleDateFormat simpleDate1 =(SimpleDateFormat)DateFormat.getDateInstance();
				       simpleDate1.applyPattern("yyyy-MM-dd");
				       try {
						javaUtilDate= simpleDate1.parse(timeStr);
					   } 
				       catch (ParseException e) {e.printStackTrace();
					   }
				       java.sql.Date javaUtilDate2= new java.sql.Date(javaUtilDate.getTime());
				
		               sb.setStartWorkDate(javaUtilDate2);
		}
		
		               
		model.addAttribute("studentBean", sb);
		session.setAttribute("photo", sb.getPhoto());//運用session物件傳遞之
		return "maintainStudentProfile.jsp";	
	}                                                                   //JSP網頁發出(POST)傳來的ModelAttribute="物件"，倚靠@ModelAttribute傳入本方式
	@RequestMapping(value="maintainStudentProfile" ,method=RequestMethod.POST)//consumes={"application/json"}
	
	public String UpdateOneStudent(@ModelAttribute("studentBean") StudentBean sb, 
			@RequestParam("studentId") Integer id, Model model, 
			HttpSession session, HttpServletRequest request) {
		//@ModelAttribute("studentBean")必須和網頁上<form:form>送來的ModelAttribute名字一樣
		System.out.println("-----------已POST進來-------------");
		
		
	  //做法：如果沒有上傳照片就把原本取出來的blob型態照片檔在放回去sb物件
		MultipartFile studentImage = sb.getStudentImage();//從網頁上傳來的sb物件接收值為path="studentImage"(StudentBean內為了接收照片檔新增的屬性和get/set方式)
	  //如果對方有上傳照片->跟新增照片一樣
		if(studentImage != null && !studentImage.isEmpty()) {//檔案不為空
			  String originalFilename = studentImage.getOriginalFilename();//抓上傳照片的檔名和副檔名
			    System.out.println(originalFilename);
			  String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
			    System.out.println(ext);
			  String rootDirectory = request.getSession().getServletContext().getRealPath("/");
			    System.out.println(rootDirectory);
			    
			  sb.setPhotoName(sb.getStudentName()+"照片"+ext);
			
			  //  建立Blob物件，交由 Hibernate 寫入資料庫
			  	  try {
					  byte[] b = studentImage.getBytes();  //檔案轉byte碼存入byte[]陣列
					  Blob blob = new SerialBlob(b);       //byte[]物件b傳入SerialBlob(建構子)成為blob物件
					  sb.setPhoto(blob);  //存入資料庫(塞值到photo變數(真正的學生table對應的StudentBean內之屬性名))
				  } catch(Exception e) {//抓住例外的狀況
					  e.printStackTrace();
					  throw new RuntimeException("檔案上傳發生異常: 請回到首頁....."/*e.getMessage()*/);
				  }
	
		}
		else{ //如果使用者不上傳照片->把原本的照片設定給photo屬性
			sb.setPhoto((Blob)session.getAttribute("photo"));
		}
		
		
		studentService.updateStudent(sb);
		return "redirect:/myStudentProfile?studentId="+session.getAttribute("studentId");
	}//update end
	
	
	//顯示學生資料頁的圖片
	@RequestMapping(value = "getPicture/{studentId}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer studentId) {
	    StudentBean bean = studentService.getStudentBean(studentId);
	    HttpHeaders headers = new HttpHeaders();
	    Blob blob = bean.getPhoto();
	    int len = 0;
	    byte[] media = null;
	    if (blob != null) {
	        try {
	            len = (int) blob.length();
	            media = blob.getBytes(1, len);
	        } catch (SQLException e) {
	            throw new RuntimeException("ProductController的getPicture()發生SQLException: " + e.getMessage());
	        }
	    } else {
	        InputStream is = context.getResourceAsStream("/resources/images/NoImage.jpg");
	        ByteArrayOutputStream baos = new ByteArrayOutputStream();
	        byte[] b = new byte[8192];
	        try {
	            while ((len = is.read(b)) != -1) {
	                baos.write(b, 0, len);
	            } 
	        
	  	  } catch (Exception e) {
	            throw new RuntimeException("ProductController的getPicture()發生IOException: " 
				+ e.getMessage());
	        }
	        media = baos.toByteArray();
	    }
	    headers.setCacheControl(CacheControl.noCache().getHeaderValue());
	    ResponseEntity<byte[]> responseEntity = 
					new ResponseEntity<>(media, headers, HttpStatus.OK);
	    return responseEntity;
	}
	
}
