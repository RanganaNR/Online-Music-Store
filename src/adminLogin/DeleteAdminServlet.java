package adminLogin;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteAdminServlet")
public class DeleteAdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
       
        String idString = request.getParameter("adminID");
        
        boolean isTrue = false;
        
        try {
        
            int id = Integer.parseInt(idString);
            
          
            isTrue = loginDBUtil.deleteAdmin(id);
            
        } catch (NumberFormatException e) {
            
            e.printStackTrace();
        }
        
      
        if (isTrue) {
            RequestDispatcher dis = request.getRequestDispatcher("adminList.jsp");
            dis.forward(request, response);
        } else {
            RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
            dis.forward(request, response);
        }
    }
}
