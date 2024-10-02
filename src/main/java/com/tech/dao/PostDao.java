package com.tech.dao;
import java.sql.*;
import java.util.ArrayList;

import com.tech.entities.*;
public class PostDao 
{
   Connection connection;
  public PostDao(Connection con)
  {
	  this.connection = con;
  }
  public ArrayList<Category> getAllCategories()
  {
	  ArrayList<Category>list = new ArrayList<Category>();
	  
	  try {
		  
		  String query = "select * from category";
		  
		  PreparedStatement stmt = connection.prepareStatement(query);
		  ResultSet resultSet = stmt.executeQuery();
		  
		  while(resultSet.next())
		  {
			  Category cat = new Category(resultSet.getInt("categoryId"),resultSet.getString("categoryName"),resultSet.getString("categoryDesc"));
			 list.add(cat);
		  }
	  }catch(Exception e)
	  {
		  e.printStackTrace();
	  }
	  
	  return list;
  }
  public boolean savePost(Post post)
  {
	  boolean flag = false;
	  try {
		  String query = "insert into post(postId,categoryId,postTitle,postContent,postCode,postPic,userId) values(?,?,?,?,?,?,?)";
	      PreparedStatement stmt = connection.prepareStatement(query);
	      
	      stmt.setInt(1, post.getPostId());
	      stmt.setInt(2, post.getCatId());
	      stmt.setString(3, post.getPostTitleString());
	      stmt.setString(4, post.getPostContentString());
	      stmt.setString(5, post.getPostCode());
	      stmt.setString(6, post.getPostPicString());
	      stmt.setInt(7, post.getuserId());
	      
	      stmt.executeUpdate();
	      flag = true;
	  
	  }catch(Exception e)
	  {
		  e.printStackTrace();
	  }
	  
	  return flag;
  }
 public ArrayList<Post> getAllPosts()
 {
	 ArrayList<Post>list = new ArrayList<>();
	 //---- Fetching all the posts--------------
	 try {
		 
		 String query = "select * from post order by postDate desc";
         PreparedStatement stmt=connection.prepareStatement(query);
         ResultSet resultSet = stmt.executeQuery();
         
         while(resultSet.next())
         {
        	 int userId = resultSet.getInt("userId");
        	 int postId = resultSet.getInt("postId");
        	 int catId =  resultSet.getInt("categoryId");
        	 
        	 String title = resultSet.getString("postTitle");
        	 String content =  resultSet.getString("postContent");
        	 String postCode = resultSet.getString("postCode");
        	 String postPic = resultSet.getString("postPic");
        	Timestamp postDate = resultSet.getTimestamp("postDate");
        	 
        	 Post post = new Post(userId,postId,catId,title,content,postCode,postPic,postDate);
        	 list.add(post);
         }
		 
	 }catch(Exception e)
	 {
		 e.printStackTrace();
	 }
	 
	 return list;
 }
 public  ArrayList<Post> getAPostsByCategoryId(int catId)
 {
	 ArrayList<Post>list = new ArrayList<>();
	 
	 // ----- Fetching posts by category id -----------
try {
		 
		 String query = "select * from post where categoryId = ? order by postDate desc";
         PreparedStatement stmt=connection.prepareStatement(query);
         stmt.setInt(1, catId);
         
         ResultSet resultSet = stmt.executeQuery();
         
         while(resultSet.next())
         {
        	 int userId = resultSet.getInt("userId");
        	 int postId = resultSet.getInt("postId");
        	
        	 
        	 String title = resultSet.getString("postTitle");
        	 String content =  resultSet.getString("postContent");
        	 String postCode = resultSet.getString("postCode");
        	 String postPic = resultSet.getString("postPic");
        	Timestamp postDate = resultSet.getTimestamp("postDate");
        	 
        	 Post post = new Post(userId,postId,catId,title,content,postCode,postPic,postDate);
        	 list.add(post);
         }
		 
	 }catch(Exception e)
	 {
		 e.printStackTrace();
	 }
	 
	 return list;
 }
 public Post getPostByPostId(int id)
 {
	 Post post = null;
     try {
		 
		 String query = "select * from post where postId = ?";
         PreparedStatement stmt=connection.prepareStatement(query);
         stmt.setInt(1, id);
         
         ResultSet resultSet = stmt.executeQuery();
         
         while(resultSet.next())
         {
        	 int userId = resultSet.getInt("userId");
        	 int categoryId = resultSet.getInt("categoryId");
        	
        	 String title = resultSet.getString("postTitle");
        	 String content =  resultSet.getString("postContent");
        	 String postCode = resultSet.getString("postCode");
        	 String postPic = resultSet.getString("postPic");
        	Timestamp postDate = resultSet.getTimestamp("postDate");
        	 
        	 post = new Post(userId,id,categoryId,title,content,postCode,postPic,postDate);
        	
         }
		 
	 }catch(Exception e)
	 {
		 e.printStackTrace();
	 }
     return post;
	 
 }
 
}
