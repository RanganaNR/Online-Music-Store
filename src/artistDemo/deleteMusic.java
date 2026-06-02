package artistDemo;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteMusic")
public class deleteMusic extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the content_id from the request
        String idString = request.getParameter("id");

        int id = -1; // Default value for invalid id
        
        // Parse the ID to an integer
        try {
            id = Integer.parseInt(idString);
        } catch (NumberFormatException e) {
            e.printStackTrace(); // Handle the error (optional: log the error)
        }

        boolean isDeleted = false;

        // Call the delete method from artistDBUtil
        if (id != -1) {
            isDeleted = artistDBUtil.deleteMusic(id); // Delete music by ID
        }

        // Redirect based on the outcome of the delete operation
        if (isDeleted) {
            // If deletion was successful, redirect back to the artist dashboard
            RequestDispatcher dispatcher = request.getRequestDispatcher("artistDashboard.jsp");
            dispatcher.forward(request, response);
        } else {
            // If deletion failed, redirect to an error page or show an error message
            RequestDispatcher dispatcher = request.getRequestDispatcher("unsuccess.jsp");
            dispatcher.forward(request, response);
        }
    }
}
