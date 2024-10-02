package com.tech.entities;

import java.util.Random;

import org.eclipse.jdt.internal.compiler.IDebugRequestor;

public class Category 
{
 private int catId;
 private String catNameString;
 private String catDescString;
 
 public Category(String catNameString, String catDescString) 
    {
	    Random numRandom = new Random();
	    catId = numRandom.nextInt(1000)+90000;
		this.catNameString = catNameString;
		this.catDescString = catDescString;
	}
 public Category(int id, String catNameString, String catDescString) 
 {
	   
	    this.catId = id;
		this.catNameString = catNameString;
		this.catDescString = catDescString;
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
 * @return the catNameString
 */
public String getCatNameString() {
	return catNameString;
}
/**
 * @param catNameString the catNameString to set
 */
public void setCatNameString(String catNameString) {
	this.catNameString = catNameString;
}
/**
 * @return the catDescString
 */
public String getCatDescString() {
	return catDescString;
}
/**
 * @param catDescString the catDescString to set
 */
public void setCatDescString(String catDescString) {
	this.catDescString = catDescString;
}
}
