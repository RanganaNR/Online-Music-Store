package adminLogin;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/adminListServlet")
public class adminListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch all admins from the database
        List<Admin> allAdmins = loginDBUtil.getAllAdmins();

        // Set the admin list as a request attribute
        request.setAttribute("allAdmins", allAdmins);

        // Forward the request to adminList.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("adminList.jsp");
        dispatcher.forward(request, response);
    }
}
