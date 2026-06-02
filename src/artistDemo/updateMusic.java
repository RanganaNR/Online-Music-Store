package artistDemo;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updateMusic")
public class updateMusic extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idString = request.getParameter("id");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        
        int id = -1; // Default value for invalid id

        // Parse ID to int
        try {
            id = Integer.parseInt(idString);
        } catch (NumberFormatException e) {
            System.err.println("Error parsing ID: " + idString); // Debugging line
            e.printStackTrace(); // For debugging
        }


       boolean isTrue;
       
       isTrue = artistDBUtil.updateMusic(id,title,description);
       
       if(isTrue == true) {
    	   RequestDispatcher dis = request.getRequestDispatcher("artistDashboard.jsp");
           dis.forward(request, response);
       }
       else {
    	   RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
           dis.forward(request, response);
       }
    }
    
}
