package com.exam.mailCalendarChat.controller;

import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.data.crossstore.ChangeSetPersister.NotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

import com.revinate.sendgrid.exception.ResourceNotFoundException;

//@Controller
@ControllerAdvice
public class ExceptionController extends Exception{

	@ExceptionHandler(Exception.class)
	public ModelAndView exceptionHandler(Exception exception) {
		ModelAndView mv = new ModelAndView();
//		mv.addObject("exception", exception.getMessage());
		exception.printStackTrace();
		mv.setViewName("ExceptionHandler.jsp");
		return mv;
	}
	
//	@ExceptionHandler(NotFoundException.class)
//	@ResponseStatus(value=HttpStatus.NOT_FOUND,reason = "暫時不提供服務，請見諒!")
//	public ModelAndView handleResourceNotFoundException() {
//
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("ExceptionHandler.jsp");
//		return mv;
//	}

//	@RequestMapping(value = "errors", method = RequestMethod.GET)
//	@ExceptionHandler(NotFoundException.class)
//	@ResponseStatus(value=HttpStatus.NOT_FOUND,reason = "暫時不提供服務，請見諒!")
//    public ModelAndView renderErrorPage(HttpServletRequest httpRequest) {
//         
//        ModelAndView errorPage = new ModelAndView("ExceptionHandler.jsp");
//        String errorMsg = "";
//        int httpErrorCode = getErrorCode(httpRequest);
// 
//        switch (httpErrorCode) {
//            case 400: {
//                errorMsg = "Http Error Code: 400. Bad Request";
//                break;
//            }
//            case 401: {
//                errorMsg = "Http Error Code: 401. Unauthorized";
//                break;
//            }
//            case 404: {
//                errorMsg = "Http Error Code: 404. Resource not found";
//                break;
//            }
//            case 500: {
//                errorMsg = "Http Error Code: 500. Internal Server Error";
//                break;
//            }
//        }
//        errorPage.addObject("errorMsg", errorMsg);
//        return errorPage;
//    }
//	
//	 private int getErrorCode(HttpServletRequest httpRequest) {
//	        return (Integer) httpRequest
//	          .getAttribute("javax.servlet.error.status_code");
//	    }

}
