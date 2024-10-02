package com.tech.utility;
import java.sql.*;

import javax.management.loading.PrivateClassLoader;
public class ConnectionProvider 
{
  private static Connection con;
  public static Connection getConnection() {
	  
	  try {
		  
		if(con==null)
		{
			Class.forName("com.mysql.jdbc.Driver");
		  
		  con = DriverManager.getConnection
					("jdbc:mysql://localhost:3306/techblog","root","Akhil@2003");
			
	  
		 }
	  }
	  catch(Exception e)
	  {
		  e.printStackTrace();
	  }
	  return con;
  }
}
