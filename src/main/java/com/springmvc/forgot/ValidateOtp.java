package com.springmvc.forgot;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/Validate-Otp")
public class ValidateOtp {
	private static final long serialVersionUID = 1L;

	@PostMapping
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int value = Integer.parseInt(request.getParameter("otp"));
		HttpSession session = request.getSession();
		int otp = (int) session.getAttribute("otp");

		RequestDispatcher dispatcher = null;

		if (value == otp) {

			request.setAttribute("email", request.getParameter("email"));
			request.setAttribute("status", "success");
			dispatcher = request.getRequestDispatcher("newPassword-Set");
			dispatcher.forward(request, response);

		} else {
			request.setAttribute("message", "wrong otp");

			dispatcher = request.getRequestDispatcher("enterOtp");
			dispatcher.forward(request, response);

		}

	}

}
