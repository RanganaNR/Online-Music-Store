package payment; // Ensure the package name is consistent

import java.sql.Connection; // This is the java.sql.Connection

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class CardDBUtil {

	public static ArrayList<Payment_card> getCardPaymentsAsArrayList() {
	    ArrayList<Payment_card> paymentList = new ArrayList<>();
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        con = DBconnection.getConnection();
	        if (con == null) {
	            System.err.println("Failed to establish database connection.");
	            return paymentList; // Return empty list if connection fails
	        } else {
	            System.out.println("Database connection established successfully.");
	        }

	        String sql = "SELECT * FROM card_payment";
	        pstmt = con.prepareStatement(sql);
	        rs = pstmt.executeQuery();

	        // Check if the result set is empty
	        if (!rs.isBeforeFirst()) { // This checks if there are any rows
	            System.out.println("No records found in card_payment table.");
	            return paymentList; // Return empty list if no records are found
	        } else {
	            System.out.println("Records found in card_payment table.");
	        }

	        // Loop through the result set and create Payment_card objects
	        while (rs.next()) {
	            Payment_card payment = new Payment_card(
	                rs.getInt("Card_payment_id"),
	                rs.getString("Name"),
	                rs.getString("Address"),
	                rs.getString("Postal_code"),
	                rs.getDouble("Pay_amount"),
	                rs.getDate("Payment_date"),
	                rs.getString("Card_type"),
	                rs.getString("Card_no"),
	                rs.getString("CVC"),
	                rs.getDate("Expire_date")
	            );
	            paymentList.add(payment);
	            System.out.println("Added payment: " + payment); // Print out added payment details for confirmation
	        }
	    } catch (SQLException e) {
	        e.printStackTrace(); // Print stack trace for debugging
	        System.err.println("SQL Error: " + e.getMessage());
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	            if (con != null && !con.isClosed()) con.close();
	        } catch (SQLException e) {
	            System.err.println("Error closing resources: " + e.getMessage());
	        }
	    }
	    System.out.println("Total payments retrieved: " + paymentList.size()); // Log the total retrieved

	    return paymentList; // Return the populated list
	}





    // Method to insert payment details
    public static boolean insertPaymentDetails(String Name, String Address, String Postal_code, String Pay_amount,
                                               String Payment_date, String Card_type, String Card_no, String CVC, String Expire_date) {
        boolean isSuccess = false;
        Connection con = null; // Declare Connection variable
        PreparedStatement ps = null; // Declare PreparedStatement variable

        try {
            con = DBconnection.getConnection(); // Ensure you call your DBConnection's getConnection
            String sql = "INSERT INTO card_payment (Name, Address, Postal_code, Pay_amount, Payment_date, Card_type, Card_no, CVC, Expire_date) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

            ps = con.prepareStatement(sql);
            ps.setString(1, Name);
            ps.setString(2, Address);
            ps.setString(3, Postal_code);
            ps.setDouble(4, Double.parseDouble(Pay_amount));
            ps.setDate(5, Date.valueOf(Payment_date)); // Make sure the date is in the correct format (yyyy-mm-dd)
            ps.setString(6, Card_type);
            ps.setString(7, Card_no);
            ps.setString(8, CVC);
            ps.setDate(9, Date.valueOf(Expire_date)); // Ensure expiry date is formatted correctly

            int result = ps.executeUpdate(); // Execute the update

            if (result > 0) {
                isSuccess = true; // Payment details inserted successfully
            }
        } catch (SQLException e) {
            System.err.println("SQL Error: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources if needed
            try {
                if (ps != null) ps.close(); // Close PreparedStatement if it was opened
                if (con != null && !con.isClosed()) con.close(); // Close the connection if it was opened
            } catch (SQLException e) {
                System.err.println("Error closing connection: " + e.getMessage());
            }
        }

        return isSuccess; // Return whether the insertion was successful
    }
    
 // Method to update payment details
    public static boolean updatePaymentDetails(int Card_payment_id, String Name, String Address, String Postal_code, String Pay_amount,
                                               String Payment_date, String Card_no, String CVC, String Expire_date) {
        boolean isSuccess = false;
        Connection con = null; // Declare Connection variable
        PreparedStatement ps = null; // Declare PreparedStatement variable

        try {
            con = DBconnection.getConnection(); // Ensure you call your DBConnection's getConnection
            String sql = "UPDATE card_payment SET Name = ?, Address = ?, Postal_code = ?, Pay_amount = ?,Payment_date = ?, Card_no = ?, CVC = ?, Expire_date = ? WHERE Card_payment_id = ?"; // Assuming payment_id is the primary key

            ps = con.prepareStatement(sql);
            ps.setString(1, Name);
            ps.setString(2, Address);
            ps.setString(3, Postal_code);
            ps.setDouble(4, Double.parseDouble(Pay_amount));
            ps.setDate(5, Date.valueOf(Payment_date)); // Ensure the date is in the correct format (yyyy-mm-dd)
            ps.setString(6, Card_no);
            ps.setString(7, CVC);
            ps.setDate(8, Date.valueOf(Expire_date)); // Ensure expiry date is formatted correctly
            ps.setInt(9, Card_payment_id); // Set the payment ID to identify the record to update

            int result = ps.executeUpdate(); // Execute the update

            if (result > 0) {
                isSuccess = true; // Payment details updated successfully
            }
        } catch (SQLException e) {
            System.err.println("SQL Error: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources if needed
            try {
                if (ps != null) ps.close(); // Close PreparedStatement if it was opened
                if (con != null && !con.isClosed()) con.close(); // Close the connection if it was opened
            } catch (SQLException e) {
                System.err.println("Error closing connection: " + e.getMessage());
            }
        }

        return isSuccess; // Return whether the update was successful
    }
    
 // Method to delete payment details from the card_payment table
    public static boolean deletePaymentDetails(int Card_payment_id) {
        boolean isSuccess = false;
        Connection con = null; // Declare Connection variable
        PreparedStatement ps = null; // Declare PreparedStatement variable

        try {
            con = DBconnection.getConnection(); // Get the connection from your DBConnection class
            String sql = "DELETE FROM card_payment WHERE Card_payment_id = ?"; // SQL query to delete a record

            ps = con.prepareStatement(sql);
            ps.setInt(1, Card_payment_id); // Set the payment ID to identify the record to delete

            int result = ps.executeUpdate(); // Execute the delete statement

            if (result > 0) {
                isSuccess = true; // Payment details deleted successfully
            }
        } catch (SQLException e) {
            System.err.println("SQL Error: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources if needed
            try {
                if (ps != null) ps.close(); // Close PreparedStatement if it was opened
                if (con != null && !con.isClosed()) con.close(); // Close the connection if it was opened
            } catch (SQLException e) {
                System.err.println("Error closing connection: " + e.getMessage());
            }
        }

        return isSuccess; // Return whether the deletion was successful
    }


}
