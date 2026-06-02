package com.contact;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updatecontactServlet")
public class updatecontactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        // Retrieve form parameters
        int contactid = Integer.parseInt(request.getParameter("contactid"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        // Call the update method in the database utility
        boolean isUpdated = contactDBUtil.updateContact(contactid, name, email, message);

        if (isUpdated) {
            // Redirect to the listContacts servlet to refresh the updated contact list
            response.sendRedirect("listContacts");
        } else {
            // If update fails, redirect to an error page
            RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
            dispatcher.forward(request, response);
        }
    }
}
