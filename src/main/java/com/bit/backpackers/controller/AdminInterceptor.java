package com.bit.backpackers.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.bit.backpackers.model.entity.MemberVo;



public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		HttpSession session = request.getSession();
		MemberVo user = (MemberVo)session.getAttribute("user");
	
		// 비회원 진입시
		if(user == null) {
			response.sendRedirect("/backpackers/user/login");
			return false;
		}
		
		//회원이 진입시
		if(user.getGrade() != 1) {
			response.sendRedirect("/backpackers");
			return false;
		}
		
		return true;
		
	}
}