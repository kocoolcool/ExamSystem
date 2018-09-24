package com.exam.config;

import javax.servlet.Filter;
import javax.servlet.ServletRegistration;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;


public class webAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class<?>[] {RootAppConfig.class};
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		
		return new Class<?>[] {WebAppConfig.class};
	}

	@Override
	protected String[] getServletMappings() {
		
		return new String[] {"/"};
	}

	@Override
	protected Filter[] getServletFilters() {
		
	
		CharacterEncodingFilter characterEncodingFilter =
				new CharacterEncodingFilter();
		characterEncodingFilter.setEncoding("UTF-8");
		
		return new Filter[] {characterEncodingFilter};
	}
	
	//spring mvc 404 handler
	//https://stackoverflow.com/questions/21061638/spring-mvc-how-to-return-custom-404-errorpages
	@Override
	protected void customizeRegistration(ServletRegistration.Dynamic registration) {
	    boolean done = registration.setInitParameter("throwExceptionIfNoHandlerFound", "true"); // -> true
	    if(!done) throw new RuntimeException();
	}
	
	

}
