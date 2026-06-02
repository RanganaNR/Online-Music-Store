package com.contact;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class contactDBUtil { // Updated class name to start with an uppercase letter

    private static final String DB_URL = "jdbc:mysql://localhost:3306/music_store?useSSL=false";
    private static final String DB_USER = "root"; // Replace with your DB username
    private static final String DB_PASSWORD = "412790354125"; // Replace with your DB password

    // Static block to load the JDBC driver
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load the MySQL JDBC driver
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC Driver not found: " + e.getMessage());
            e.printStackTrace(); // Print the exception for debugging
        }
    }
    
    


    // Method to insert a message into the contact table
    public static boolean insertMessage(String name, String email, String message) {
        boolean isInserted = false;
        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO contact (name, email, message) VALUES (?, ?, ?)")) {

            // Set the parameters
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, message);

            // Execute the update
            int rowsAffected = preparedStatement.executeUpdate();
            isInserted = (rowsAffected > 0); // Check if insertion was successful

        } catch (SQLException e) {
            // Print detailed error message
            System.err.println("SQL State: " + e.getSQLState());
            System.err.println("Error Code: " + e.getErrorCode());
            System.err.println("Message: " + e.getMessage());
            e.printStackTrace(); // Print the exception stack trace for debugging
        }

        return isInserted;
    }

   
    
 // Method to update a contact record
    public static boolean updateContact(int contactid, String name, String email, String message) {
        boolean isSuccess = false;
        String sql = "UPDATE contact SET name = ?, email = ?, message = ? WHERE contactid = ?";

        try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, message);
            pstmt.setInt(4, contactid);

            int result = pstmt.executeUpdate();
            isSuccess = result > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isSuccess;
    }
    
    // Method to get all contact messages from the database
    public static List<contact> getAllContacts() {
        // Create an empty list to store contact objects
        List<contact> allContacts = new ArrayList<>();

        // SQL query to retrieve all contact messages
        String query = "SELECT * FROM contact"; // Ensure this matches your table and columns

        try {
            // Establish connection to the database
            Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            // Loop through the result set and create contact objects
            while (rs.next()) {
                int contactId = rs.getInt("contactid"); // Assuming column name is 'contactid'
                String name = rs.getString("name");
                String email = rs.getString("email");
                String message = rs.getString("message");

                // Create a contact object and add it to the list
                contact contactObj = new contact(contactId, name, email, message);
                allContacts.add(contactObj);
            }

            // Close the result set, statement, and connection
            rs.close();
            pstmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Return the list of all contacts
        return allContacts;
    }
    
    
    
    public static boolean deletecontact(String contactid) {
        boolean isSuccess = false;
        Connection con = null;
        PreparedStatement pstmt = null;
        
        try {
            // Convert contactid to integer, make sure it's a valid number
            int convId = Integer.parseInt(contactid);
            
            con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            
            String sql = "DELETE FROM contact WHERE contactid = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, convId);

            // Execute the delete command
            int rowsAffected = pstmt.executeUpdate();
            isSuccess = (rowsAffected > 0);  // Check if rows were deleted successfully

        } catch (SQLException e) {
            System.err.println("SQL Error during delete operation: " + e.getMessage());
            e.printStackTrace();
        } catch (NumberFormatException e) {
            System.err.println("Invalid contactid format: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return isSuccess;  // Return true if deletion was successful, false otherwise
    }

    
    // Method to get all contact messages from the database
    public static List<contact> getAllFeedbacks() {
        // Create an empty list to store contact objects
        List<contact> allContacts = new ArrayList<>();

        // SQL query to retrieve all contact messages
        String query = "SELECT * FROM contact"; // Ensure this matches your table and columns

        try {
            // Establish connection to the database
            Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            // Loop through the result set and create contact objects
            while (rs.next()) {
                int contactId = rs.getInt("contactid"); // Assuming column name is 'contactid'
                String name = rs.getString("name");
                String email = rs.getString("email");
                String message = rs.getString("message");

                // Create a contact object and add it to the list
                contact contactObj = new contact(contactId, name, email, message);
                allContacts.add(contactObj);
            }

            // Close the result set, statement, and connection
            rs.close();
            pstmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Return the list of all contacts
        return allContacts;
    }


    
    
    
  }
