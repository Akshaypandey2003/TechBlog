package com.tech.entities;


import java.util.Random;
import java.sql.*;

public class Post 
{
 private int postId;
 private int catId;
 private int userId;
 private String postTitleString;
 private String postContentString;
 private String postCode;
 private String postPicString;
 private Timestamp postDate;
 
 
 
 
 public Post(int userId,int postId, int catId, String postTitleString, String postContentString, String postCode,
		String postPicString, Timestamp timestamp) {
	
	 this.userId = userId;
	this.postId = postId;
	this.catId = catId;
	this.postTitleString = postTitleString;
	this.postContentString = postContentString;
	this.postCode = postCode;
	this.postPicString = postPicString;
	this.postDate = timestamp;
}
 
public Post(int userId,int catId, String postTitleString, String postContentString, String postCode,
			String postPicString, Timestamp postDate) 
 {
	 Random numRandom = new Random();
	 postId = numRandom.nextInt(1000)+90000;
		
	 this.userId = userId;
		this.catId = catId;
		this.postTitleString = postTitleString;
		this.postContentString = postContentString;
		this.postCode = postCode;
		this.postPicString = postPicString;
		this.postDate = postDate;
	}
/**
 * @return the postId
 */
public int getuserId() {
	return userId;
}
/**
 * @param postId the postId to set
 */
public void setuserId(int userId) {
	this.userId = userId;
}

/**
 * @return the postId
 */
public int getPostId() {
	return postId;
}
/**
 * @param postId the postId to set
 */
public void setPostId(int postId) {
	this.postId = postId;
}
/**
 * @return the catId
 */
public int getCatId() {
	return catId;
}
/**
 * @param catId the catId to set
 */
public void setCatId(int catId) {
	this.catId = catId;
}
/**
 * @return the postTitleString
 */
public String getPostTitleString() {
	return postTitleString;
}
/**
 * @param postTitleString the postTitleString to set
 */
public void setPostTitleString(String postTitleString) {
	this.postTitleString = postTitleString;
}
/**
 * @return the postContentString
 */
public String getPostContentString() {
	return postContentString;
}
/**
 * @param postContentString the postContentString to set
 */
public void setPostContentString(String postContentString) {
	this.postContentString = postContentString;
}
/**
 * @return the postCode
 */
public String getPostCode() {
	return postCode;
}
/**
 * @param postCode the postCode to set
 */
public void setPostCode(String postCode) {
	this.postCode = postCode;
}
/**
 * @return the postPicString
 */
public String getPostPicString() {
	return postPicString;
}
/**
 * @param postPicString the postPicString to set
 */
public void setPostPicString(String postPicString) {
	this.postPicString = postPicString;
}
/**
 * @return the postDate
 */
public Timestamp getPostDate() {
	return postDate;
}
/**
 * @param postDate the postDate to set
 */
public void setPostDate(Timestamp postDate) {
	this.postDate = postDate;
}

}
