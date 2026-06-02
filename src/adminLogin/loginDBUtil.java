package adminLogin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.customer.DBConnect;

public class loginDBUtil {

    // Insert operation
    public static boolean InsertAdmin(String AdminName, String password) {
        boolean isSuccess = false;
        String sql = "INSERT INTO admin (AdminName, password) VALUES (?, ?)";
        
        try (Connection con = DBconnect.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
             
          
            pstmt.setString(1, AdminName);  
            pstmt.setString(2, password);   

            // Execute the update
            int result = pstmt.executeUpdate();
            isSuccess = (result > 0); 

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }

    // Validate operation
    public static List<Admin> validate(String AdminName, String password) {
        List<Admin> adminList = new ArrayList<>();
        String sql = "SELECT * FROM admin WHERE AdminName = ? AND password = ?";

        try (Connection con = DBconnect.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
             
            
            pstmt.setString(1, AdminName);  
            pstmt.setString(2, password);   

           
            try (ResultSet result = pstmt.executeQuery()) {
                while (result.next()) { 
                    int adminID = result.getInt("AdminID");
                    String adminName = result.getString("AdminName");
                    String pass = result.getString("password");

                    Admin a = new Admin(adminID, adminName, pass);
                    adminList.add(a);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return adminList;  
    }

 // Update operation
    public static boolean updateAdmin(int id, String name, String password) {
        boolean isSuccess = false;
        String sql = "UPDATE admin SET AdminName = ?, password = ? WHERE AdminID = ?";

        try (Connection con = DBconnect.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
             
            pstmt.setString(1, name);  
            pstmt.setString(2, password); 
            pstmt.setInt(3, id);        

            // Execute the update
            int result = pstmt.executeUpdate();
            isSuccess = (result > 0); 

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }
    
 // Delete Process
    public static boolean deleteAdmin(int id) {  
        boolean isSuccess = false;

        
        String sql = "DELETE FROM admin WHERE AdminID = ?";

        try (Connection con = DBconnect.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
             
           
            pstmt.setInt(1, id);  
            
          
            int result = pstmt.executeUpdate();
            isSuccess = (result > 0); 
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return isSuccess;
    }


    
 // Data retrieving
    public static List<Admin> getAllAdmins() {
        List<Admin> allAdmins = new ArrayList<>();
        
        String sql = "SELECT * FROM admin";

        try (Connection con = DBconnect.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql);
             ResultSet result = pstmt.executeQuery()) { 

            while (result.next()) {
                int adminID = result.getInt("AdminID");
                String adminName = result.getString("AdminName");
                String pass = result.getString("password");

               
                Admin a = new Admin(adminID, adminName, pass);
                allAdmins.add(a);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return allAdmins; 
    }
    
    // Data retrieving
    public static List<Admin> getAllAdmins(int id) {
        List<Admin> allAdmins = new ArrayList<>();
        
        String sql = "SELECT * FROM admin WHERE AdminID = ?";

        try (Connection con = DBconnect.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql);
             ResultSet result = pstmt.executeQuery()) { 

            while (result.next()) {
                int adminID = result.getInt("AdminID");
                String adminName = result.getString("AdminName");
                String pass = result.getString("password");

               
                Admin a = new Admin(adminID, adminName, pass);
                allAdmins.add(a);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return allAdmins; 
    }
    public static boolean deleteCustomer(int id) {
        boolean isSuccess = false;
        String sql = "DELETE FROM customer WHERE id=?";

        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DBConnect.getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, id);
            int r = pstmt.executeUpdate();
            isSuccess = r > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
           
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return isSuccess;
    }


   
 }
