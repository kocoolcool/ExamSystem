package com.exam.config;

import java.util.ArrayList;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.oxm.jaxb.Jaxb2Marshaller;
import org.springframework.web.accept.ContentNegotiationManager;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.ContentNegotiatingViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;
import org.springframework.web.servlet.view.xml.MarshallingView;


@Configuration
@EnableWebMvc
@ComponentScan("com.exam")

public class WebAppConfig extends WebMvcConfigurerAdapter {

	
	//攔截登入的請求
//	@Bean
//    public LocalInterceptor localInterceptor() {
//         return new LocalInterceptor();
//    }

	
  //攔截登入的請求
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
    	//此處定義攔截什麼請求->addPathPatterns("/用於新增攔截規則")
//        registry.addInterceptor(new MyInterceptor2()).addPathPatterns("/itIsSecret");//new MyInterceptor2()這個放學生登入後可以進入的路徑--身分識別碼->1
//        registry.addInterceptor(new MyInterceptor0()).addPathPatterns("/itIsSecret1");//new MyInterceptor0()這個放主考官登入後可以進入的路徑--身分識別碼->1
//        registry.addInterceptor(new MyInterceptor1()).addPathPatterns("/itIsSecret2");//new MyInterceptor1()這個放系統管理者登入後可以進入的路徑--身分識別碼->1
        registry.addInterceptor(new MyInterceptor2()).addPathPatterns("/index_Student");//new MyInterceptor2()這個放學生登入後可以進入的路徑--身分識別碼->2
        registry.addInterceptor(new MyInterceptor0()).addPathPatterns("/index_Admin");//new MyInterceptor0()這個放主考官登入後可以進入的路徑--身分識別碼->1

        registry.addInterceptor(new MyInterceptor1()).addPathPatterns("/index_Exami");//new MyInterceptor1()這個放系統管理者登入後可以進入的路徑--身分識別碼->0
//        registry.addInterceptor(new MyInterceptor1()).addPathPatterns("/4");
//        registry.addInterceptor(new MyInterceptor1()).addPathPatterns("/5");
//        registry.addInterceptor(new MyInterceptor1()).addPathPatterns("/6");
//        registry.addInterceptor(new MyInterceptor1()).addPathPatterns("/7");
//        registry.addInterceptor(new MyInterceptor1()).addPathPatterns("/8");
//        registry.addInterceptor(new MyInterceptor1()).addPathPatterns("/9");
        // excludePathPatterns 使用者排除攔截
        super.addInterceptors(registry);
    }
    
    
	@Bean
	public ViewResolver internalResourceViewResolver() {
		InternalResourceViewResolver resolver = 
				new InternalResourceViewResolver();
		resolver.setViewClass(JstlView.class);
//		resolver.setPrefix("/WEB-INF/views/");  
		resolver.setPrefix("/"); 
//		resolver.setSuffix(".jsp");
		return resolver;
	}
	
//	@Bean
//	public MessageSource messageSource() {
//		ResourceBundleMessageSource resource = 
//				new ResourceBundleMessageSource();
//		resource.setBasename("message"); 
//		return resource;
//	}

	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {

		registry.addResourceHandler("/css/**").addResourceLocations("/WEB-INF/resources/css/");
		registry.addResourceHandler("/js/**").addResourceLocations("/WEB-INF/resources/js/");
		registry.addResourceHandler("/images/**").addResourceLocations("/WEB-INF/resources/images/");
		registry.addResourceHandler("/fonts/**").addResourceLocations("/WEB-INF/resources/fonts/");
		registry.addResourceHandler("/php/**").addResourceLocations("/WEB-INF/resources/php/");	
		registry.addResourceHandler("/vendor/**").addResourceLocations("/WEB-INF/resources/");	
		
		
		registry.addResourceHandler("/mailCalendarChat/css/**").addResourceLocations("/WEB-INF/resources/css/");
		registry.addResourceHandler("/mailCalendarChat/js/**").addResourceLocations("/WEB-INF/resources/js/");
		registry.addResourceHandler("/mailCalendarChat/images/**").addResourceLocations("/WEB-INF/resources/images/");
		registry.addResourceHandler("/mailCalendarChat/fonts/**").addResourceLocations("/WEB-INF/resources/fonts/");
		registry.addResourceHandler("/mailCalendarChat/php/**").addResourceLocations("/WEB-INF/resources/php/");	
		
		registry.addResourceHandler("/backManage/css/**").addResourceLocations("/WEB-INF/resources/css/");
		registry.addResourceHandler("/backManage/js/**").addResourceLocations("/WEB-INF/resources/js/");
		registry.addResourceHandler("/backManage/images/**").addResourceLocations("/WEB-INF/resources/images/");
		registry.addResourceHandler("/backManage/fonts/**").addResourceLocations("/WEB-INF/resources/fonts/");
		registry.addResourceHandler("/backManage/php/**").addResourceLocations("/WEB-INF/resources/php/");	

		registry.addResourceHandler("/examAppointment/css/**").addResourceLocations("/WEB-INF/resources/css/");
		registry.addResourceHandler("/examAppointment/js/**").addResourceLocations("/WEB-INF/resources/js/");
		registry.addResourceHandler("/examAppointment/images/**").addResourceLocations("/WEB-INF/resources/images/");
		registry.addResourceHandler("/examAppointment/fonts/**").addResourceLocations("/WEB-INF/resources/fonts/");
		registry.addResourceHandler("/examAppointment/php/**").addResourceLocations("/WEB-INF/resources/php/");	
		
		registry.addResourceHandler("/ExamManage/css/**").addResourceLocations("/WEB-INF/resources/css/");
		registry.addResourceHandler("/ExamManage/js/**").addResourceLocations("/WEB-INF/resources/js/");
		registry.addResourceHandler("/ExamManage/images/**").addResourceLocations("/WEB-INF/resources/images/");
		registry.addResourceHandler("/ExamManage/fonts/**").addResourceLocations("/WEB-INF/resources/fonts/");
		registry.addResourceHandler("/ExamManage/php/**").addResourceLocations("/WEB-INF/resources/php/");	
		
		registry.addResourceHandler("/leaveManage/css/**").addResourceLocations("/WEB-INF/resources/css/");
		registry.addResourceHandler("/leaveManage/js/**").addResourceLocations("/WEB-INF/resources/js/");
		registry.addResourceHandler("/leaveManage/images/**").addResourceLocations("/WEB-INF/resources/images/");
		registry.addResourceHandler("/leaveManage/fonts/**").addResourceLocations("/WEB-INF/resources/fonts/");
		registry.addResourceHandler("/leaveManage/php/**").addResourceLocations("/WEB-INF/resources/php/");	
	
		registry.addResourceHandler("/loginSystem/css/**").addResourceLocations("/WEB-INF/resources/css/");
		registry.addResourceHandler("/loginSystem/js/**").addResourceLocations("/WEB-INF/resources/js/");
		registry.addResourceHandler("/loginSystem/images/**").addResourceLocations("/WEB-INF/resources/images/");
		registry.addResourceHandler("/loginSystem/fonts/**").addResourceLocations("/WEB-INF/resources/fonts/");
		registry.addResourceHandler("/loginSystem/php/**").addResourceLocations("/WEB-INF/resources/php/");	
		
	}
	
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setDefaultEncoding("UTF-8");
		resolver.setMaxUploadSize(81920000);
		return resolver;
	}
	

}
