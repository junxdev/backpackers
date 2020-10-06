package com.bit.backpackers.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class LoginInterceptor extends HandlerInterceptorAdapter {

	 private static final String LOGIN = "login";
	    private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	    @Override
	    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
	    		System.out.println("222���ͼ��� �ȴ�!!!");
	    	
	        HttpSession httpSession = request.getSession();
	        ModelMap modelMap = modelAndView.getModelMap();
	        Object memberVo =  modelMap.get("user");

	        logger.info("new login success");
	        if (memberVo != null) {
	            httpSession.setAttribute(LOGIN, memberVo);
	            //response.sendRedirect("/");
	            Object destination = httpSession.getAttribute("destination");
	            response.sendRedirect(destination != null ? (String) destination : "/");
	        }
	    }
	    
	    
	    @Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	    	System.out.println("11111���ͼ��� �ȴ�!!!");

	        HttpSession httpSession = request.getSession();
	        // ������ �α��� ���� ����
	        if (httpSession.getAttribute(LOGIN) != null) {
	            logger.info("clear login data before");
	            httpSession.removeAttribute(LOGIN);
	        }

	        return true;
	    }
	}