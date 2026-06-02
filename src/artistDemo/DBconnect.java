package artistDemo;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnect {
	
	private static String url="jdbc:mysql://localhost:3306/music_store?useSSL=false&serverTimezone=UTC";
	private static String user="root";
	private static String Password="412790354125";
	private static Connection con;
	
	public static Connection getConnection() {
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			 con = DriverManager.getConnection(url, user, Password);
			 
			 
		}
		catch(Exception e){
			System.out.println("Database connection is unsuccessfull");
		}
		
		return con;
	}

}
