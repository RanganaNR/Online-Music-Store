package adminLogin;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteServlet")
public class deleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // Get the ID from the form as a string
        String idString = request.getParameter("id");
        
        boolean isTrue = false;
        
        try {
            // Convert the ID to an int (since it's stored as int in the DB)
            int id = Integer.parseInt(idString);
            
            // Call the deleteAdmin method and pass the int ID
            isTrue = loginDBUtil.deleteAdmin(id);
            
        } catch (NumberFormatException e) {
            // Handle the exception if the ID is not a valid integer
            e.printStackTrace();
        }
        
        // Redirect based on the result of the deletion process
        if (isTrue) {
            RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
            dis.forward(request, response);
        } else {
            RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
            dis.forward(request, response);
        }
    }
}
