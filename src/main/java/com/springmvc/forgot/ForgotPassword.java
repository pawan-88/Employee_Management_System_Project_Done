
package com.springmvc.forgot;
import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/send-otp")
public class ForgotPassword {

	
	
	private static final long serialVersionUID = 1L;
	
	@PostMapping
	protected void forgotPass(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    String email = request.getParameter("email");
	    RequestDispatcher dispatcher = null;
	    int value = 0;
	    HttpSession httpSession = request.getSession();

	    if (email != null && !email.equals("")) {
	        Random random = new Random();
	        value = random.nextInt(1255650);

	        String to = email;
	        Properties properties = new Properties();
	        properties.put("mail.smtp.host", "smtp.gmail.com");
	        properties.put("mail.smtp.socketFactory.port", "465");
	        properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	        properties.put("mail.smtp.auth", "true");
	        properties.put("mail.smtp.port", "465");

	        Session session = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication("pawansanap8619@gmail.com", "kkedimuoksplallc");
	            }
	        });
	        try {
	            MimeMessage message = new MimeMessage(session);
	            message.setFrom(new InternetAddress(email));
	            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
	            message.setSubject("Your Forgot Password OTP, please verify...");
	            message.setText("Your Forgot Password OTP is here: " + value);
	            Transport.send(message);
	            System.out.println("OTP Successfully Sent.... ");
	        } catch (MessagingException e) {
	            throw new RuntimeException(e);
	        }
	    }
	

//	@PostMapping
//	protected void forgotPass(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		String email = request.getParameter("email");
//		RequestDispatcher dispatcher = null;
//		int value=0;
//		HttpSession httpSession = request.getSession();
//		
//		if(email!=null || !email.equals("")) {
//			Random random = new Random();
//			value = random.nextInt(1255650);
//			
//			String to = email;
//			Properties properties = new Properties();
//			properties.put("mail.smtp.host", "smtp.gmail.com");
//			properties.put("mail.smtp.socketFactory.port", "465");
//			properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
//			properties.put("mail.smtp.auth", "true");
//			properties.put("mail.smtp.port", "465");
//			
//			Session session = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
//				protected PasswordAuthentication getPasswordAuthentication() {
//					return new PasswordAuthentication("pawansanap8619gmail.com", "kkedimuoksplallc");
//				}
//			});
//			try {
//				MimeMessage message = new MimeMessage(session);
//				message.setFrom(new InternetAddress("pawansanap8619gmail.com"));
//				message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
//				message.setSubject("Your Forgot Password OPT pls verify...");
//				message.setText("Your Forgot Password OTP is here: "+value);
//				Transport.send(message);
//				System.out.println("OPT SUccessfully Send.... ");
//			}
//			catch (MessagingException e) {
//				throw new RuntimeException();
//			}
//			try {
//			    MimeMessage message = new MimeMessage(session);
//			    message.setFrom(new InternetAddress(email));
//			    message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
//			    message.setSubject("Your Forgot Password OTP pls verify...");
//			    message.setText("Your Forgot Password OTP is here: " + value);
//			    Transport.send(message);
//			    System.out.println("OTP Successfully Sent....");
//			} catch (MessagingException e) {
//			    // Handle the exception here
//			    e.printStackTrace(); // You can log the exception or handle it in a custom way
//			}

			dispatcher = request.getRequestDispatcher("enterOtp");
			request.setAttribute("message","OTP is sent to your email id");
			//request.setAttribute("connection", con);
			httpSession.setAttribute("otp",value); 
			httpSession.setAttribute("email",email); 
			dispatcher.forward(request, response);
			//request.setAttribute("status", "success");
		}
		
	}

