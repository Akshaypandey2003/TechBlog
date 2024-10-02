package com.tech.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.FormatFlagsConversionMismatchException;

public class LikeDao 
{
	Connection connection;
  public LikeDao(Connection connection) {
		
		this.connection = connection;
	}
 public boolean insertLike(int postId, int userId)
  {
	 boolean flag = false;
	  try {
		  String query = "insert into likes(userId, postId) values (?,?)";
		  PreparedStatement stmt = connection.prepareStatement(query);
		  stmt.setInt(1, userId);
		  stmt.setInt(2, postId);
		 
		  int row =  stmt.executeUpdate();
		  if(row>0)
			  flag = true;
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	  return flag;
  }
 public int countLikeOnPost(int postId)
 {
	int count = 0;
	try {
		  String query = "select count(*) from likes where postId = ?";
		  PreparedStatement stmt = connection.prepareStatement(query);
		  
		  stmt.setInt(1, postId);
		 
		  ResultSet resultSet = stmt.executeQuery();
		  if(resultSet.next())
		  {
			  count = resultSet.getInt("count(*)");
		  }
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	return count;
	
 }
 public boolean isPostLiked(int postId, int userId)
 {
	 boolean flag = false;
	 try {
		  String query = "select * from likes where postId = ? and userId = ?";
		  PreparedStatement stmt = connection.prepareStatement(query);
		  
		  stmt.setInt(1, postId);
		  stmt.setInt(2, userId);
		 
		  ResultSet resultSet = stmt.executeQuery();
		  if(resultSet.next())
		  {
			  flag = true;
		  }
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	 return flag;
 }
 public boolean deleteLike(int postId,int userId)
 {
	 boolean flag = false;
	 try {
		  String query = "delete  from likes where postId = ? and userId = ?";
		  PreparedStatement stmt = connection.prepareStatement(query);
		  
		  stmt.setInt(1, postId);
		  stmt.setInt(2, userId);
		 
		 int row  = stmt.executeUpdate();
		  if(row>0)
		  {
			  flag = true;
		  }
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	 return flag;
 }
}
