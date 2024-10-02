package com.tech.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.http.HttpRequest;

import org.apache.catalina.connector.Response;
import org.apache.jasper.tagplugins.jstl.core.If;

import com.tech.dao.LikeDao;
import com.tech.utility.ConnectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/LikeServlet")
public class LikeServlet extends HttpServlet 
{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    resp.setContentType("text/html");
	    PrintWriter out = resp.getWriter();
	    String operation = req.getParameter("operation");
	    int uid = Integer.parseInt(req.getParameter("uid"));
	    int pid = Integer.parseInt(req.getParameter("pid"));
	    
	   if(operation.equals("like"))
	   {
		   LikeDao dao = new LikeDao(ConnectionProvider.getConnection());
		   if(dao.insertLike(pid,uid)){
			   out.println("true");
		   }
		   else {
			   out.println("false");
			   
		}
	   }
	  
	}

}
