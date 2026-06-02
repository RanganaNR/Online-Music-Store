package adminLogin;

import java.io.IOException;

import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class loginServelet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String AdminName = request.getParameter("AdminName");
        String password = request.getParameter("password");
        
        
        List<Admin> adminDetails = loginDBUtil.validate(AdminName, password);
        
        if (adminDetails.isEmpty()) {
            
            request.setAttribute("errorMessage", "Invalid username or password");
            RequestDispatcher dis = request.getRequestDispatcher("adminLogin.jsp");
            dis.forward(request, response);
        } else {

            request.setAttribute("adminDetails", adminDetails);
            RequestDispatcher dis = request.getRequestDispatcher("adminDash.jsp");
            dis.forward(request, response);
        }
    }
}
