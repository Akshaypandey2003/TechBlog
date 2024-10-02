package com.tech.entities;

public class Message 
{
	private String content;
	private String type;
	private String cssType;
    
	public Message(String content, String type,String cssType) {
		
		this.content = content;
		this.type = type;
		this.cssType = cssType;
	}
	/**
	 * @return the contentType
	 */
	public String getContent() {
		return content;
	}
	/**
	 * @param contentType the contentType to set
	 */
	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * @return the type
	 */
	public String getType() {
		return type;
	}
	/**
	 * @param type the type to set
	 */
	public void setType(String type) {
		this.type = type;
	}  
	public String getcssType() {
		return cssType;
	}
	/**
	 * @param type the type to set
	 */
	public void setcssType(String cssType) {
		this.cssType = cssType;
	}  
  
}
