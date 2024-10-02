package com.tech.dao;
import java.sql.*;
import java.util.Random;
import java.util.random.RandomGenerator.StreamableGenerator;

import com.mysql.cj.conf.BooleanPropertyDefinition.AllowableValues;
import com.mysql.cj.x.protobuf.MysqlxSql.StmtExecute;
import com.tech.entities.User;
public class UserDao 
{
  private Connection connection;
   public UserDao(Connection con)
   {
	   this.connection = con;
   }
   public boolean saveUser(User user)
   {
       boolean flag = false;
	   try {
		   String checkQuery = "select * from user where user_email=?";
		   PreparedStatement stmt = connection.prepareStatement(checkQuery);
		   stmt.setString(1, user.getEmailString());
		   
		   ResultSet resultSet = stmt.executeQuery();
		   if(resultSet.next())
		   {
			   return flag;
		   }
		   Thread.sleep(3000);
		   String query  = "insert into user (user_id, user_email,user_name,"
		   		+ "gender,password,registration_date) values (?,?,?,?,?,?)" ;
		   
		   
		   stmt = connection.prepareStatement(query);
		   stmt.setInt(1, user.getId());
		   stmt.setString(2, user.getEmailString()); 
		   stmt.setString(3, user.getName());
		   stmt.setString(4, user.getGender()+"");
		   stmt.setString(5, user.getPasswordString());
		   stmt.setObject(6,user.getDateTime());
		   stmt.executeUpdate();
		   flag = true;
		   
	   }
	   catch(Exception e)
	   {
		   e.printStackTrace();
	   }
	   return flag;
   }
   //Get user by userEmail and user password.
   public User getUserDetail(String email, String password)
   {
	   User user = null;
	   try {
		   String query = "select * from user where user_email=? and password=?";
		   PreparedStatement stmt = connection.prepareStatement(query);
		   stmt.setString(1, email);
		   stmt.setString(2, password);
		   
		   ResultSet res = stmt.executeQuery();
		  if(res.next())
		  {
			  String image;
			  if( res.getString("profilePic")!=null)
			  {
				  image = res.getString("profilePic");
				  
			  }
			  else 
			  {
				  if(res.getString("gender").equals("M"))
				  {
					  image = "male-user-icon.png";
				  }
				  else {
					  image = "female-user-icon.png";
				  }
			   }
			  user = new User(res.getInt("user_id"), res.getString("user_name"), 
					  res.getString("user_email"),res.getString("password"),
					  res.getString("gender").charAt(0),res.getTimestamp("registration_date"),image);
		  }
		   
	   }catch(Exception e)
	   {
		   e.printStackTrace();
	   }
	   return user;
   }
   public boolean updateUser(User user)
   {
	   try {
		   String query;
		   PreparedStatement stmt;
		   int res;
		   if(user.getImage().length()>0)
		   {
			    query = "update user set user_email = ?, password = ?, profilePic = ? where user_id=?";
			    stmt = connection.prepareStatement(query);
				stmt.setString(1, user.getEmailString());
				stmt.setString(2, user.getPasswordString());
				stmt.setString(3, user.getImage());
				stmt.setInt(4, user.getId());
				 res = stmt.executeUpdate();
				 if(res>0)
				    	return true;
		   }
		   else {
			   query = "update user set user_email = ?, password = ? where user_id=?";
			    stmt = connection.prepareStatement(query);
				stmt.setString(1, user.getEmailString());
				stmt.setString(2, user.getPasswordString());
				stmt.setInt(3, user.getId());
				 res = stmt.executeUpdate();
				 if(res>0)
				    	return true;
		   }
	   }catch(Exception e)
	   {
		   e.printStackTrace();
		   
	   }
	   return false;
   }
   public User getUserById(int id)
   {
	   User user=null;
       try {
		   
		   String query = "select * from user where user_id=?";
		   PreparedStatement stmt = connection.prepareStatement(query);
		   stmt.setInt(1, id);
		  
		   
		    ResultSet res = stmt.executeQuery();
		    if(res.next())
		    {
		    	System.out.println(res.getInt("user_id"));
		    	user = new User(res.getInt("user_id"), res.getString("user_name"), 
						  res.getString("user_email"),res.getString("password"),
						  res.getString("gender").charAt(0),res.getTimestamp("registration_date"), res.getString("profilePic"));
		    }
		   
	   }catch(Exception e)
	   {
		   e.printStackTrace();
		   
	   }
       return user;
   }
}
