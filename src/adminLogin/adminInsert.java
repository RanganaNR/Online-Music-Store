package adminLogin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class adminInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String AdminName=request.getParameter("AdminName");
		String password=request.getParameter("password");
		
		boolean IsTrue;
		
		IsTrue = loginDBUtil.InsertAdmin(AdminName, password);
		
		if(IsTrue == true) {
			RequestDispatcher dis= request.getRequestDispatcher("adminLogin.jsp");
			dis.forward(request, response);
		}
		else {
			RequestDispatcher dis1= request.getRequestDispatcher("unsuccess.jsp");
			dis1.forward(request, response);
		}
		
	}

}
