package com.tech.servlets;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.Timestamp;
import java.util.Date;
import java.util.Random;

import org.apache.jasper.tagplugins.jstl.core.If;

import com.tech.dao.UserDao;
import com.tech.entities.User;
import com.tech.utility.ConnectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
@MultipartConfig
public class RegisterServlet extends HttpServlet
{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		
		String checkBox = req.getParameter("checkBox-input");
		 
		if(checkBox==null)
			out.println("UncheckedBox");
		else 
		{
			String name = req.getParameter("name-input");
			String email = req.getParameter("email-input");
			String gender = req.getParameter("gender-input");
			String password = req.getParameter("password-input");
			Random random = new Random();
		    int id = 10000 + random.nextInt(90000);
		    
		    // Create a user and save all these details in user object .
		    Date date = new Date();
			User user = new User(id, name, email, password,gender.charAt(0));
			
			// Store the data in data base through UserDao class
			UserDao dao = new UserDao(ConnectionProvider.getConnection());
			if(dao.saveUser(user))
			out.println("done");
			else {
				out.println("error");
			}
		}
		
	}

}
