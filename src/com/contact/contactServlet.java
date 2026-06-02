package com.contact;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/contactServlet")
public class contactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // doPost method to handle message submission
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        response.setContentType("text/html");

        // Get the form parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        // Insert the message into the database
        boolean isSuccess = contactDBUtil.insertMessage(name, email, message);

        // Get the PrintWriter to write HTML content to the response
        PrintWriter out = response.getWriter();
        
        // Display success or failure message
        out.println("<html><body>");
        if (isSuccess) {
            out.println("<h2>Your Message Has Been Sent to Admins Successfully!</h2>");
        } else {
            out.println("<h2>Failed to send your message. Please try again later.</h2>");
        }
        out.println("<br><a href='contact.jsp'>Go Back to Contact Form</a>");
        out.println("</body></html>");
        
        out.println("<br><a href='read2.jsp'>View My Messages</a>");
        out.println("</body></html>");
        
        out.close();
    }

 
}
