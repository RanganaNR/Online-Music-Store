package payment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Servlet to handle card payment deletion
@WebServlet("/deleteCardServlet")
public class deleteCardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the card_payment_id from the request
        String cardPaymentIdStr = request.getParameter("Card_payment_id");

        if (cardPaymentIdStr != null && !cardPaymentIdStr.isEmpty()) {
            try {
                int Card_payment_id = Integer.parseInt(cardPaymentIdStr);

                // Call the deletePaymentDetails method to delete the payment record
                boolean isDeleted = CardDBUtil.deletePaymentDetails(Card_payment_id);

                if (isDeleted) {
                    // If the deletion was successful, redirect or display a success message
                    request.setAttribute("message", "Payment deleted successfully!");
                    request.getRequestDispatcher("paymentDashboard.jsp").forward(request, response); // Redirect to your payment dashboard or another page
                } else {
                    // If deletion failed, display an error message
                    request.setAttribute("errorMessage", "Failed to delete payment!");
                    request.getRequestDispatcher("error.jsp").forward(request, response); // Forward to an error page
                }
            } catch (NumberFormatException e) {
                // Handle invalid payment ID format
                request.setAttribute("errorMessage", "Invalid payment ID!");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } else {
            // Handle missing payment ID parameter
            request.setAttribute("errorMessage", "Payment ID is required!");
            request.getRequestDispatcher("erro.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redirect to doPost method for any GET requests
        doPost(request, response);
    }
}
