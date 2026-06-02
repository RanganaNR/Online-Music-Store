package artistDemo;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/artistServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10,    // 10MB
                 maxFileSize = 1024 * 1024 * 50,          // 50MB
                 maxRequestSize = 1024 * 1024 * 100)      // 100MB
public class artistServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Define the upload directory for both mp3 and image (you can change the path as per your environment)
    private static final String UPLOAD_DIRECTORY = "uploads";
    private static final String IMAGE_DIRECTORY = "images"; // Directory for images

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String title = request.getParameter("title");
        String description = request.getParameter("description");

        // Get the MP3 file part
        Part filePart = request.getPart("file");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        // Get the Image file part
        Part imagePart = request.getPart("image");
        String imageName = null;
        if (imagePart != null && imagePart.getSize() > 0) {
            imageName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();
        }

        // Get absolute path for the upload and image directories inside WebContent
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
        String imagePath = getServletContext().getRealPath("") + File.separator + IMAGE_DIRECTORY;

        // Create the uploads directory if it doesn't exist
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        // Create the images directory if it doesn't exist
        File imageDir = new File(imagePath);
        if (!imageDir.exists()) {
            imageDir.mkdir();
        }

        // Save the MP3 file on disk
        String filePath = uploadPath + File.separator + fileName;
        try (InputStream fileContent = filePart.getInputStream()) {
            Files.copy(fileContent, new File(filePath).toPath());
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error saving MP3 file.");
            return;
        }

        // Save the image file on disk (if provided)
        String imageFilePath = null;
        if (imageName != null) {
            imageFilePath = imagePath + File.separator + imageName;
            try (InputStream imageContent = imagePart.getInputStream()) {
                Files.copy(imageContent, new File(imageFilePath).toPath());
            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().write("Error saving image file.");
                return;
            }
        }

    
        boolean isInserted = artistDBUtil.addMusic(title, description, "uploads/" + fileName, (imageName != null) ? "images/" + imageName : null); // Store relative paths

        response.setContentType("text/html"); // Set the response content type to HTML
        response.getWriter().write("<html><body>");
        if (isInserted) {
            response.getWriter().write("<script type='text/javascript'>");
            response.getWriter().write("alert('Music and image uploaded and saved in the database successfully!');");
            response.getWriter().write("window.location.href = 'artistDashboard.jsp';");
            response.getWriter().write("</script>");
        } else {
            response.getWriter().write("<script type='text/javascript'>");
            response.getWriter().write("alert('File uploaded but failed to save in the database.');");
            response.getWriter().write("window.location.href = 'unsuccess.jsp';");
            response.getWriter().write("</script>");
        }
        response.getWriter().write("</body></html>");

    }
}
