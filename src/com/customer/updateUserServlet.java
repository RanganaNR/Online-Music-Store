package com.customer;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updateUserServlet")
public class updateUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


	
    // Handles GET request for displaying the update form with customer data
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get customer ID from request (e.g., from a query parameter)
        String id = request.getParameter("id");

        // Retrieve customer data from the database
        Customer customer = CustomerDBUtil.getCustomerById(id);

        // Set the customer details as request attributes
        request.setAttribute("id", customer.getId());
        request.setAttribute("name", customer.getName());
        request.setAttribute("phone", customer.getPhone());
        request.setAttribute("email", customer.getEmail());
        request.setAttribute("password", customer.getPassword());
        request.setAttribute("role", customer.getRole());  // "Role" with uppercase R

        // Forward to the updateProfile.jsp to display the form with data
        RequestDispatcher dispatcher = request.getRequestDispatcher("updateProfile.jsp");
        dispatcher.forward(request, response);
    }
    
    
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String role = request.getParameter("role");  
        String password = request.getParameter("password");

        // Debug statements to check form parameters
        System.out.println("ID: " + id);
        System.out.println("Name: " + name);
        System.out.println("Phone: " + phone);
        System.out.println("Email: " + email);
        System.out.println("role: " + role);
        System.out.println("Password: " + password);

        // Update customer
        boolean isTrue = CustomerDBUtil.updateCustomer(id, name, phone, email, role, password);

        // Redirect to success or failure page
        RequestDispatcher dis;
        if (isTrue==true) {
        	List<Customer> cusDetails = CustomerDBUtil.getCustomerDetails(id);
        	request.setAttribute("cusDetails", cusDetails);
        	
            dis = request.getRequestDispatcher("userAccount.jsp");
            
            dis.forward(request, response);
        } else {
        	List<Customer> cusDetails = CustomerDBUtil.getCustomerDetails(id);
        	request.setAttribute("cusDetails", cusDetails);
        	
            dis = request.getRequestDispatcher("userAccount.jsp");
            dis.forward(request, response);
        }
    }

}


