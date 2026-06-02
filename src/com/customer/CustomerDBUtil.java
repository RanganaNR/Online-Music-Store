
package com.customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CustomerDBUtil {
    
    private static boolean isSuccess;
    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;

    public static List<Customer> validate(String email, String password) {
        ArrayList<Customer> cus = new ArrayList<>();

        try {
            con = DBConnect.getConnection();
            String sql = "SELECT * FROM customer WHERE email = ? AND password = ?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String phone = rs.getString(3);
                String userEmail = rs.getString(4);
                String role = rs.getString(5);
                String passU = rs.getString(6);

                Customer c = new Customer(id, name, phone, userEmail, role, passU);
                cus.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return cus;
    }

    public static boolean signup(String name, String phone, String email, String role, String password) {
        boolean isSuccess = false;

        try {
            con = DBConnect.getConnection();
            String sql = "INSERT INTO customer VALUES(0, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, phone);
            pstmt.setString(3, email);
            pstmt.setString(4, role);
            pstmt.setString(5, password);
            int rs = pstmt.executeUpdate();

            isSuccess = rs > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }

    
    
    public static boolean updateCustomer(String id, String name, String phone, String email, String role, String password) {
        boolean isSuccess = false;

        try {
            // Ensure ID is not null or empty before parsing
            if (id != null && !id.trim().isEmpty()) {
                int convId = Integer.parseInt(id);  // Convert string to int
               
                // Database connection and update logic
                con = DBConnect.getConnection();
                stmt = con.createStatement();
                String sql = "UPDATE customer SET name=?, phone=?, email=?, role=?, password=? WHERE id=?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, name);
                ps.setString(2, phone);
                ps.setString(3, email);
                ps.setString(4, role);
                ps.setString(5, password);
                ps.setInt(6, convId);  // Use the converted integer ID

                int result = ps.executeUpdate();
                
                if (result > 0) {
                    isSuccess = true;
                }
            } else {
                System.out.println("ID is null or empty, cannot update.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return isSuccess;
    }

    public static Customer getCustomerById(String id) {
        Customer customer = null;

        try {
            con = DBConnect.getConnection();
            String sql = "SELECT * FROM customer WHERE id=?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                customer = new Customer(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("phone"),
                    rs.getString("email"),
                    rs.getString("role"),
                    rs.getString("password")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return customer;
    }
    
    
    public static List<Customer> getCustomerDetails(String Id){
    	
    	int convertedID = Integer.parseInt(Id);
    	
    	ArrayList<Customer> cus = new ArrayList<>();
    	
    	try {
    		
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		String sql = "select * from customer where id='"+convertedID+"'" ;
    		rs = stmt.executeQuery(sql);
    		
    		while(rs.next()) {
    			int id = rs.getInt(1);
    			String name= rs.getString(2);
    			String phone= rs.getString(3);
    			String email= rs.getString(4);
    			String role= rs.getString(5);
    			String password= rs.getString(6);
    			
    			Customer c = new Customer(id,name,phone,email,role,password);
    			cus.add(c);
    		}
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	return cus;
    }
    
    

    public static boolean deleteCustomer(String id) {
        int convId = Integer.parseInt(id);

        try {
            con = DBConnect.getConnection();
            String sql = "DELETE FROM customer WHERE id=?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, convId);
            int r = pstmt.executeUpdate();

            isSuccess = r > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }
    
  //Method to retrieve all music records from the database
    public static List<Music> getAllMusic() {
        List<Music> musicList = new ArrayList<>();
        String sql = "SELECT * FROM music";

        try (Connection con = DBConnect.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Music music = new Music();
                music.setId(rs.getInt("content_id"));
                music.setTitle(rs.getString("title"));
                music.setDescription(rs.getString("description"));
                music.setFilePath(rs.getString("upload_file"));
                music.setImagePath(rs.getString("image_path"));
                music.setUploadDate(rs.getTimestamp("upload_date"));

                musicList.add(music);
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Replace with logger
        }

        return musicList;
    }
    
    public static ArrayList<Customer> getAllCustomers() throws SQLException {
        ArrayList<Customer> customers = new ArrayList<>();
        
        // Define your SQL query to retrieve all users
        String sql = "SELECT * FROM customer";
        
        // Create a connection object
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            // Get the connection
            conn = DBConnect.getConnection();  // Replace with your connection logic

            // Prepare the statement
            stmt = conn.prepareStatement(sql);

            // Execute the query
            rs = stmt.executeQuery();

            // Iterate through the result set and add each user to the ArrayList
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String role = rs.getString("role");
                String password = rs.getString("password");

                // Create a Customer object
                Customer customer = new Customer(id, name,phone,email,role,password);

                // Add the customer object to the ArrayList
                customers.add(customer);
            }
        } finally {
            // Close all resources
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }

        // Return the list of customers
        return customers;
    }
}




