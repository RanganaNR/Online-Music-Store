package artistDemo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import adminLogin.DBconnect;

public class artistDBUtil {

    // Method to insert music details into the database
    public static boolean addMusic(String title, String description, String filePath, String imagePath) {
        boolean isSuccess = false;
        String sql = "INSERT INTO music (title, description, upload_file, image_path) VALUES (?, ?, ?, ?)";

        try (Connection con = DBconnect.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setString(1, title);           // Set song title
            pstmt.setString(2, description);     // Set song description
            pstmt.setString(3, filePath);        // Set MP3 file path
            pstmt.setString(4, imagePath);       // Set image file path

            // Execute the update and check if the insertion was successful
            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                isSuccess = true;
            }

        } catch (SQLException e) {
            // Consider using a logging framework for better error handling
            e.printStackTrace(); // Replace with logger
        }

        return isSuccess;
    }
    
    // Method to retrieve all music records from the database
    public static List<Music> getAllMusic() {
        List<Music> musicList = new ArrayList<>();
        String sql = "SELECT * FROM music";

        try (Connection con = DBconnect.getConnection();
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
    
    // Method to retrieve a single music record by its ID
    public static Music getMusicById(int id) {
        Music music = null;
        String sql = "SELECT * FROM music WHERE content_id = ?";

        try (Connection con = DBconnect.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setInt(1, id); // Set the music ID parameter

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    music = new Music();
                    music.setId(rs.getInt("content_id"));
                    music.setTitle(rs.getString("title"));
                    music.setDescription(rs.getString("description"));
                    music.setFilePath(rs.getString("file"));
                    music.setImagePath(rs.getString("image"));
                    music.setUploadDate(rs.getTimestamp("upload_date"));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Replace with logger
        }

        return music;
    }
    
    public static boolean updateMusic(int id, String title, String description) {
        boolean isSuccess = false;
        
        // Basic validation for title, description, and imagePath
        if (title == null || title.trim().isEmpty() || 
            description == null || description.trim().isEmpty()) {
            return false; 
        }
        
        // Single SQL query without optional statements
        String sql = "UPDATE music SET title = ?, description = ? WHERE content_id = ?";

        try (Connection con = DBconnect.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
             
            pstmt.setString(1, title);          // Set new title
            pstmt.setString(2, description);    // Set new description
            pstmt.setInt(3, id);                // Set content_id

            int result = pstmt.executeUpdate();
            isSuccess = (result > 0); // Update was successful if result is greater than 0

        } catch (SQLException e) {
            e.printStackTrace(); // Replace with logger
        }

        return isSuccess;
    }


    
 // Delete music by ID
    public static boolean deleteMusic(int id) {
        boolean isSuccess = false;
        
        String sql = "DELETE FROM music WHERE content_id = ?";

        try (Connection con = DBconnect.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setInt(1, id); // Set the content_id

            int result = pstmt.executeUpdate();
            isSuccess = (result > 0); // Check if the deletion was successful

        } catch (SQLException e) {
            e.printStackTrace(); // Replace with logger
        }

        return isSuccess;
    }
    
    public static List<Music> searchMusic(String query) {
        List<Music> results = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBconnect.getConnection(); // Adjust based on your DB connection method
            String sql = "SELECT * FROM music WHERE title LIKE ?"; // Change 'music' to your actual table name
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, "%" + query + "%");
            rs = stmt.executeQuery();

            while (rs.next()) {
                Music music = new Music();
                music.setId(rs.getInt("content_id")); // Adjust based on your columns
                music.setTitle(rs.getString("title"));
                music.setDescription(rs.getString("description"));
                music.setFilePath(rs.getString("upload_file"));
                music.setImagePath(rs.getString("image_path"));
                results.add(music);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        }

        return results;
    }

}
