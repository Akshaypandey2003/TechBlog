package com.tech.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.http.HttpRequest;

import com.tech.dao.UserDao;
import com.tech.entities.Message;
import com.tech.entities.User;
import com.tech.utility.ConnectionProvider;
import com.tech.utility.FileUploadHelper;

import jakarta.security.auth.message.callback.PrivateKeyCallback.Request;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet
{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		// Fetching the updated data....
		String email = req.getParameter("edit-email");
		String password = req.getParameter("edit-password");
		Part part = req.getPart("edit-image");
		String imageName = part.getSubmittedFileName();
		
		//Fetching the current session data...
		
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("currentUser");
		
		String oldPicPath="";
		ServletContext context = getServletContext();
		
		
		if(user.getImage()!=null)
		{
		  oldPicPath= "C:\\Servlet Tutorial\\TechTalk\\ProfilePics"+File.separator+user.getImage();
		 
		}
		
		
		user.setEmailString(email);
		user.setPasswordString(password);
		if(imageName.length()>0)
		user.setImage(imageName);
		
		// Updating the user's data in data base...
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		boolean isUpdated = dao.updateUser(user);
		
		if(isUpdated)
		{		
			if(oldPicPath.length()>0 && imageName.length()>0)
			{
				FileUploadHelper.deleteFile(oldPicPath);
			}
			

			String path = "C:\\Servlet Tutorial\\TechTalk\\ProfilePics"+File.separator+imageName;
			
			if(imageName.length()>0  && FileUploadHelper.saveFile(part.getInputStream(), path))
			{
				Message  msg = new Message("Profile Updated Successfully.","success","alert-success");
			    req.getSession().setAttribute("message", msg);
			}
			else if(imageName.length()==0)
			{
				Message  msg = new Message("Profile Updated Successfully.","success","alert-success");
			    req.getSession().setAttribute("message", msg);
			}
			else {
				Message  msg = new Message("Something Went wrong!.","error","alert-danger");
			    req.getSession().setAttribute("message", msg);
			}
		}
		else {
			Message  msg = new Message("Something Went wrong!.","error","alert-danger");
		    req.getSession().setAttribute("message", msg);
		}
		resp.sendRedirect("profile.jsp");
		
		
	}

}
