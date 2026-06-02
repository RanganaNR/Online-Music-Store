//package com.customer;
//
//import java.io.IOException;
//import java.util.List;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//@WebServlet("/LoginServlet")
//public class LoginServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		//data coming from login.jsp
//		String email = request.getParameter("email");
//		String password = request.getParameter("password");
//		
//		
//		try {
//            List<Customer> cusDetails = CustomerDBUtil.validate(email, password);
//
//            if (cusDetails != null && !cusDetails.isEmpty()) {
//                // Assuming the Customer object contains a role field (either 'user' or 'artist')
//                Customer customer = cusDetails.get(0);
//                String role = customer.getRole(); // Assuming 'getRole()' method exists
//                
//                // Store the customer details and role in request
//                request.setAttribute("cusDetails", cusDetails);
//
//                // Redirect to different pages based on the role
//                
//                if ("artist".equalsIgnoreCase(role)) {
//                    // Redirect to the artist account page
//                    RequestDispatcher dis = request.getRequestDispatcher("artistAccount.jsp");
//                    dis.forward(request, response);
//               }
//                else if ("user".equalsIgnoreCase(role)) {
//                    // Redirect to the user account page
//                    RequestDispatcher dis = request.getRequestDispatcher("userAccount.jsp");
//                    dis.forward(request, response);
//                }  
//                   else {
//                   // Handle case where role is unknown
//                    request.setAttribute("error", "Invalid role");
//                    RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
//                    dis.forward(request, response);
//                }
//            } 
//                else {
//                // If the user is not found or invalid credentials
//                request.setAttribute("error", "Invalid email or password");
//                RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
//                dis.forward(request, response);
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            // Handle database errors
//            request.setAttribute("error", "An error occurred while processing your request.");
//            RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
//            dis.forward(request, response);
//        }
//		
//		
//		
//	}
//
//}

package com.customer;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Data coming from login.jsp
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            List<Customer> cusDetails = CustomerDBUtil.validate(email, password);

            if (cusDetails != null && !cusDetails.isEmpty()) {
                // Assuming the Customer object contains a role field (either 'user' or 'artist')
                Customer customer = cusDetails.get(0);
                customer.getRole();
                
                // Store the customer details in the session
                HttpSession session = request.getSession();
                session.setAttribute("cusDetails", cusDetails);

                // Redirect to dashboard.jsp for user access
                response.sendRedirect("dashboard.jsp");
            } else {
                // If the user is not found or invalid credentials
                request.setAttribute("error", "Invalid email or password");
                RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
                dis.forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            // Handle database errors
            request.setAttribute("error", "An error occurred while processing your request.");
            RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
            dis.forward(request, response);
        }
    }
}



