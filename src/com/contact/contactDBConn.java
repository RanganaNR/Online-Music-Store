package com.contact;

import java.sql.Connection;
import java.sql.DriverManager;



public class contactDBConn {

	private static String url = "jdbc:mysql://localhost:3306/music_store?useSSL=false";
	private static String username = "root";
	private static String password = "412790354125";
	private static Connection con;
	
	
	public static Connection getConnection() {
	
		try {
			Class.forName("con.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection(url, username, password);
		}
	    catch(Exception e) {
	    	System.out.println("Database connection is not success");
	    	
	    }
		
		return con;
		
}

	

	}
