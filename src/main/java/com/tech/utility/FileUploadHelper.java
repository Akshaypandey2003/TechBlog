package com.tech.utility;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class FileUploadHelper 
{
	public static boolean deleteFile(String path) {
	    boolean flag = false;
	    try {
	        // Create a File object for the file to be deleted
	        File file = new File(path);

	        // Check if the file exists before trying to delete it
	        if (file.exists()) {
	            // Attempt to delete the file
	            flag = file.delete();

	            if (flag) {
	                System.out.println("File successfully deleted: " + path);
	            } else {
	                System.out.println("Failed to delete the file: " + path);
	            }
	        } else {
	            System.out.println("File not found at path: " + path);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        System.out.println("An error occurred while deleting the file.");
	    }
	    return flag;
	}

  public static boolean saveFile(InputStream is, String path)
  {
	  System.out.println(path);
	  boolean flag = false;
	  try {
		  
		  byte[] buffer = new byte[1024];
	        int bytesRead = 0;
	        
	        FileOutputStream fos = new FileOutputStream(path);
	        
	        while ((bytesRead = is.read(buffer)) != -1) {
	            fos.write(buffer, 0, bytesRead);
	        }
	        
	        fos.flush();
	        fos.close();
	        flag = true;
		  
	  }catch(Exception e)
	  {
		  e.printStackTrace();
	  }
	  return flag;
  }
}
