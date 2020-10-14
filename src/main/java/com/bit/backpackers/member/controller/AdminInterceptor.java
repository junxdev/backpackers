package com.bit.backpackers.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.bit.backpackers.member.model.entity.MemberVo;



public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		HttpSession session = request.getSession();
		MemberVo user = (MemberVo)session.getAttribute("user");
	
		// 로그인하지 않은 경우
		if(user == null) {
			response.sendRedirect("/backpackers/user/login");
			return false;
		}
		
		// 일반 회원이 로그인한 경우
		if(user.getGrade() != 1) {
			response.sendRedirect("/backpackers");
			return false;
		}
		
		return true;
		
	}
}