package com.tech.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import org.apache.catalina.connector.Response;

import com.tech.dao.UserDao;
import com.tech.entities.*;
import com.tech.utility.ConnectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/html");
		String emailString = req.getParameter("email-input");
		String passwordString = req.getParameter("password-input");
		
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		User user = dao.getUserDetail(emailString, passwordString);
		
		PrintWriter out = resp.getWriter();
		if(user==null)
		{
			Message  msg = new Message("Invalid Credentials!","error","alert-danger");
		    req.getSession().setAttribute("message", msg);
			resp.sendRedirect("login.jsp");	
		}
		else 
		{
			 req.getSession().setAttribute("currentUser", user);
			 resp.sendRedirect("profile.jsp");
		}
		
	}

}
