package com.springmvc.forgot;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springmvc.entity.User;

@Controller
@RequestMapping("/newPassword")
public class NewPassword {
	
	
	private static final long serialVersionUID = 1L;
	
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
//	@GetMapping
//	public String newPassword() {
//		return "newPassword";
//	}
	
	@PostMapping
	protected void doPost(HttpServletRequest request, HttpServletResponse response, @ModelAttribute User user)
			throws ServletException, IOException {
		System.out.println(user);
		HttpSession session = request.getSession();
		String dbPassword = user.getPassword();
		System.out.println("DB Pass: "+dbPassword);
		String newPassword = request.getParameter("password");
		String confPassword = request.getParameter("confPassword");
		System.out.println("New Pass: "+newPassword);
		System.out.println("Conf Pass: "+confPassword);
		
		System.out.println("------------------------------------------------------------------------");
//		String rawPassword = newPassword+confPassword;
//		System.out.println("RawPassword: "+rawPassword);
//		user.setPassword(bCryptPasswordEncoder.encode(rawPassword));
		String encodePassword =bCryptPasswordEncoder.encode(newPassword);
		String encodePassword2 =bCryptPasswordEncoder.encode(confPassword);
		System.out.println("New Password: "+encodePassword);
		System.out.println("Conf Password: "+encodePassword2);
		System.out.println("DB Pass: "+dbPassword);
		System.out.println(bCryptPasswordEncoder.matches("RawPassword: "+encodePassword,"DBPass: "+ user.getPassword()));
//		System.out.println("Updated Pass: "+encodePassword);
		
		RequestDispatcher dispatcher = null;
		if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {

			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emp_db?useSSL=false", "root",
						"Admin@12345");
				PreparedStatement pst = con.prepareStatement("update user_table set password = ? where email = ? ");
				pst.setString(1, encodePassword);
				pst.setString(2, (String) session.getAttribute("email"));

				int rowCount = pst.executeUpdate();
				if (rowCount > 0) {
					request.setAttribute("status", "resetSuccess");
					dispatcher = request.getRequestDispatcher("resetSuccess");
				} else {
					request.setAttribute("status", "resetFailed");
					dispatcher = request.getRequestDispatcher("newPassword-Set");
				}
				dispatcher.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
