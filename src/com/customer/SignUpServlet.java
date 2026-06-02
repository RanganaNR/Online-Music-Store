package com.customer;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//signUp page value pass to DB
		
		String name =request.getParameter("name");
		String phone =request.getParameter("phone");
		String email =request.getParameter("email");
		String role =request.getParameter("role");
		String password =request.getParameter("password");
		
		boolean isTrue;
		
		isTrue = CustomerDBUtil.signup(name, phone, email, role, password);
		
		if(isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
			dis.forward(request, response);
			//System.out.println("success");
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
			dis2.forward(request, response);
			//System.out.println("unsuccess");
		}
	}

}
