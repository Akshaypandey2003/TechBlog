package com.tech.entities;


import java.util.Date;

import javax.management.loading.PrivateClassLoader;

import java.sql.Timestamp;

import jakarta.security.auth.message.AuthStatus;

public class User {
	private int id;
	private String name;
	private String emailString;
	private String passwordString;
	private char gender;
	private Timestamp dateTime;
	private String image;
	
	/**
	 * constructor to initialize instance variables.
	 */
	
	public User(int id, String name, String email, String password, char gender) {
       
		this.id= id;
		this.name = name;
		this.emailString = email;
		this.passwordString = password;
		this.gender = gender;
		Date date = new Date();
		dateTime = new Timestamp(date.getTime());
	}
	public User(int id, String name, String email, String password, char gender,Timestamp dateTime,String image) {
	       
		this.id= id;
		this.name = name;
		this.emailString = email;
		this.passwordString = password;
		this.gender = gender;
		Date date = new Date();
		this.dateTime = dateTime;
		this.image = image;
	}
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the emailString
	 */
	public String getEmailString() {
		return emailString;
	}

	/**
	 * @param emailString the emailString to set
	 */
	public void setEmailString(String emailString) {
		this.emailString = emailString;
	}

	/**
	 * @return the passwordString
	 */
	public String getPasswordString() {
		return passwordString;
	}

	/**
	 * @param passwordString the passwordString to set
	 */
	public void setPasswordString(String passwordString) {
		this.passwordString = passwordString;
	}

	/**
	 * @return the gender
	 */
	public char getGender() {
		return gender;
	}

	/**
	 * @param gender the gender to set
	 */
	public void setGender(char gender) {
		this.gender = gender;
	}

	/**
	 * @return the dateTime
	 */
	public Timestamp getDateTime() {
		return dateTime;
	}

	/**
	 * @param dateTime the dateTime to set
	 */
	public void setDateTime(Timestamp dateTime) {
		this.dateTime = dateTime;
	}
	
	/**
	 * @param image the image to set
	 */
	public String getImage() {
		return image;
	}

	/**
	 * @param gender the gender to set
	 */
	public void setImage(String image) {
		this.image = image;
	}

	

	
}
