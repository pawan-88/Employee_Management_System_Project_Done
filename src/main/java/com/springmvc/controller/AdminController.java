package com.springmvc.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;

import com.springmvc.dao.UserDao;
import com.springmvc.dao.UserDaoImpl;

@Controller
public class AdminController {
	
	protected void adminRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException,IOException {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter printWriter = response.getWriter()){
			
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			//authentication user
			UserDaoImpl userDaoImpl  = new UserDaoImpl();
			}
		
	}

}
