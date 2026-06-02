package adminLogin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updateServlet")
public class updateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idString = request.getParameter("id");
        String name = request.getParameter("name");
        String password = request.getParameter("password");

        int id = -1; // Default value for invalid id

        // Parse ID to int
        try {
            id = Integer.parseInt(idString);
        } catch (NumberFormatException e) {
            e.printStackTrace(); // Handle the error (optional: set an error message in request)
        }

        boolean isTrue = false;

        // Call updateAdmin only if ID is valid
        if (id != -1) {
            isTrue = loginDBUtil.updateAdmin(id, name, password);

            if (isTrue) {
                // Retrieve updated admin details
                List<Admin> adminDetails = loginDBUtil.validate(name, password); // Assuming the same name and password for the login

                // Set the admin details as request attributes
                request.setAttribute("adminDetails", adminDetails);
            }
        }

        // Forward to the appropriate page based on the update result
        if (isTrue) {
            RequestDispatcher dis = request.getRequestDispatcher("adminDash.jsp");
            dis.forward(request, response);
        } else {
            RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
            dis.forward(request, response);
        }
    }
}
