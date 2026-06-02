package payment;

import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;


@WebServlet("/CardPayServlet")
public class CardPayServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Initialize ArrayList to hold card payment details
        ArrayList<Payment_card> paymentList = new ArrayList<>();

        try {
            // Call the method to retrieve card payment details
            paymentList = CardDBUtil.getCardPaymentsAsArrayList(); // Assuming this method exists
        } catch (Exception e) {
            System.err.println("Error fetching card payment details: " + e.getMessage());
            request.setAttribute("errorMessage", "Could not retrieve card payment details.");
        }

        // Set the card payment list as a request attribute
        request.setAttribute("paymentList", paymentList); 

        // Forward the request to the payment dashboard JSP
        request.getRequestDispatcher("paymentDashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Extract payment details from the form submission
        String Name = request.getParameter("Name");
        String Address = request.getParameter("Address");
        String Postal_code = request.getParameter("Postal_code");
        String Pay_amount = request.getParameter("Pay_amount");
        String Payment_date = request.getParameter("Payment_date");
        String Card_type = request.getParameter("Card_type");
        String Card_no = request.getParameter("Card_no");
        String CVC = request.getParameter("CVC");
        String Expire_date = request.getParameter("Expire_date");

        // Insert payment details into the database
        boolean isSuccess = CardDBUtil.insertPaymentDetails(Name, Address, Postal_code, Pay_amount, Payment_date, Card_type, Card_no, CVC, Expire_date);

        // Determine the message
        String message;
        if (isSuccess) {
            message = "Payment details inserted successfully.";
        } else {
            message = "Failed to insert payment details.";
        }

        // Redirect to doGet with the message as a query parameter
        response.sendRedirect("CardPayServlet?message=" + java.net.URLEncoder.encode(message, "UTF-8"));
    }
}
