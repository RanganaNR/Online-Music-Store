package payment;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/updateCardServlet")
public class updateCardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters from the request
        int Card_payment_id = Integer.parseInt(request.getParameter("Card_payment_id")); // Assume this is passed in the form
        String Name = request.getParameter("Name");
        String Address = request.getParameter("Address");
        String Postal_code = request.getParameter("Postal_code");
        String Pay_amount = request.getParameter("Pay_amount");
        String Payment_date = request.getParameter("Payment_date");
        String Card_no = request.getParameter("Card_no");
        String CVC = request.getParameter("CVC");
        String Expire_date = request.getParameter("Expire_date");

        // Call the method to update payment details
        boolean isSuccess = CardDBUtil.updatePaymentDetails(Card_payment_id, Name, Address, Postal_code, Pay_amount,
        		Payment_date, Card_no, CVC, Expire_date);

        // Set the success or failure message as a request attribute
        if (isSuccess) {
            request.setAttribute("message", "Payment details updated successfully!");
        } else {
            request.setAttribute("message", "Failed to update payment details. Please try again.");
        }

        // Forward the request to a JSP page to display the message (update this path as needed)
        request.getRequestDispatcher("paymentDashboard.jsp").forward(request, response);
    }
}
