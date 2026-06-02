package com.contact;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/feedbackServlet")
public class feedbackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // doGet method to handle displaying the contact details for the admin dashboard
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Retrieve the list of contact messages from the database
        List<contact> allContacts = contactDBUtil.getAllFeedbacks();

        // Debug: Print out the contacts in the console to ensure data is retrieved
        if (allContacts != null) {
            for (contact c : allContacts) {
                System.out.println("Name: " + c.getName() + ", Email: " + c.getEmail() + ", Message: " + c.getMessage());
            }
        }

        // Forward the contact list to the JSP
        request.setAttribute("contactList", allContacts);
        RequestDispatcher dispatcher = request.getRequestDispatcher("feedback.jsp");
        dispatcher.forward(request, response);
    }

}
