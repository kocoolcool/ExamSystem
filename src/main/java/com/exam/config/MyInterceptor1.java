package com.exam.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


public class MyInterceptor1 implements HandlerInterceptor {

	
	
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object theSessionAttribute)
            throws Exception {
    	
        System.out.println(">>>MyInterceptor1>>>>>>>這個處理主考官之身分登入  在請求處理之前進行呼叫（Controller方法呼叫之前）");
       
        
        theSessionAttribute = request.getSession().getAttribute("LoginOK");
        if (theSessionAttribute== null) {
            response.sendRedirect("loginSystem/index_forLogin1");//跳轉到此請求
            return false;
        }
        else{//String.valueOf(session.getAttribute("WhichIdentity"))->物件轉字串
        	//if(重設theSessionAttribute= request.getSession().getAttribute("WhichIdentity");然後去比對字串值(都轉成字串之型別)是2->表示一學生)
        	String theId= String.valueOf(request.getSession().getAttribute("WhichIdentity"));
        	//數字轉字串String.valueOf(數字);
        	if(theId.equals(String.valueOf(1))) {
            	return true;// 只有返回true才會繼續向下執行，返回false取消當前請求
        	}
        	//else會return false
            return false;
        }
        
        
        
    }
    
    
    
    
    
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
        System.out.println
        (">>>MyInterceptor1>>>>>>>請求處理之後進行呼叫，但是在檢視被渲染之前（Controller方法呼叫之後）");
    }
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        System.out.println
        (">>>MyInterceptor1>>>>>>>在整個請求結束之後被呼叫，也就是在DispatcherServlet 渲染了對應的檢視之後執行（主要是用於進行資源清理工作）");
    }
    
    
}
