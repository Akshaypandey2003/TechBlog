package com.tech.servlets;

import java.io.IOException;

import org.apache.catalina.connector.Response;

import com.tech.entities.*;
import com.mysql.cj.jdbc.ha.ReplicationMySQLConnection;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet
{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getSession().removeAttribute("currentUser");
		Message msg = new Message("Logout successfully","success","alert-success");
		
		req.getSession().setAttribute("message", msg);
		resp.sendRedirect("login.jsp");
		
	}
  
	
}	


