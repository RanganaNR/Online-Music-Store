package com.contact;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deletecontactServlet")
public class deletecontactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handle POST request from the form submission
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the contactid from the request
        String contactid = request.getParameter("contactid");

        // Check if the contact ID is null or empty
        if (contactid == null || contactid.isEmpty()) {
            request.setAttribute("errorMessage", "Contact ID is missing.");
            RequestDispatcher dis = request.getRequestDispatcher("error.jsp");
            dis.forward(request, response);
            return;
        }

        // Call the delete contact method
        boolean isDeleted = contactDBUtil.deletecontact(contactid);

        if (isDeleted) {
            // If deletion is successful, redirect to the page that displays the contact list
            response.sendRedirect("listContacts");  // Assuming 'read.jsp' lists contacts
        } else {
            // If deletion fails, forward to error page with an error message
            request.setAttribute("errorMessage", "Failed to delete contact with ID: " + contactid);
            RequestDispatcher dis = request.getRequestDispatcher("error.jsp");
            dis.forward(request, response);
        }
    }
}
