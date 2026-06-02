package com.customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

// Import the Customer class and the DB utility class where getAllCustomers method is located
// import yourpackage.Customer;
// import yourpackage.CustomerDBUtil;

@WebServlet("/RegUserListServlet")
public class RegUserListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RegUserListServlet() {
        super();
    }

    // Handles the HTTP GET request
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Call the method to retrieve the list of customers
            ArrayList<Customer> customers = CustomerDBUtil.getAllCustomers();
            
            // Set the list of customers as a request attribute
            request.setAttribute("customerList", customers);
            
            // Forward the request to the JSP page (e.g., regUserList.jsp)
            request.getRequestDispatcher("registeredUsers.jsp").forward(request, response);
        } catch (SQLException e) {
            // Handle SQL exceptions
            e.printStackTrace();
            // Redirect to an error page or display an error message
            response.sendRedirect("unsuccess.jsp");
        }
    }

    // Handles the HTTP POST request
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response); // Typically, you call doGet for POST requests unless you need custom logic.
    }
}
