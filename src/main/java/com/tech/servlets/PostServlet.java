package com.tech.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.http.HttpRequest;
import java.security.Timestamp;

import javax.swing.border.TitledBorder;
import javax.swing.text.AbstractDocument.Content;

import org.apache.tomcat.jakartaee.bcel.classfile.Code;

import com.tech.dao.PostDao;
import com.tech.entities.Post;
import com.tech.entities.User;
import com.tech.utility.ConnectionProvider;
import com.tech.utility.FileUploadHelper;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/PostServlet")
@MultipartConfig
public class PostServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/html");
		int categoryId = Integer.parseInt(req.getParameter("post-category"));
	    String title = req.getParameter("post-title");
	    String content = req.getParameter("post-content");
	    String code  = req.getParameter("post-code");
	    Part part = req.getPart("post-pic");
	    String image = part.getSubmittedFileName();
	    
	    
	    // Getting current userid---->
	    
	    User user = (User)req.getSession().getAttribute("currentUser"); 
	    int id = user.getId();
	   PrintWriter out =  resp.getWriter();
	   
	   Post post = new Post(id,categoryId,title,content,code,image,null);
	   PostDao dao = new PostDao(ConnectionProvider.getConnection());
	   boolean isSaved = dao.savePost(post);
	   if(isSaved)
	   {
		  
		     ServletContext context = getServletContext();
		     String path = "C:\\Servlet Tutorial\\TechTalk\\BlogPics"+File.separator+image;
			 FileUploadHelper.saveFile(part.getInputStream(), path);
			 out.println("done");
	   }
	   else {
		   out.println("error");
	   }
	    
	}

}
