package com.contact;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/viewContacts")
public class ViewContactsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Call the method to retrieve all contacts
        List<contact> allContacts = contactDBUtil.getAllContacts(); // Replace with your utility class name

        // Set the list as a request attribute
        request.setAttribute("allContacts", allContacts);

        // Forward the request to the JSP page
        request.getRequestDispatcher("contacts.jsp").forward(request, response);
    }
}
