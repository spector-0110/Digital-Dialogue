package com.blog.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blog.DAO.UserDAO;
import com.blog.entities.Message;
import com.blog.entities.User;
import com.blog.helper.ConnectionProvider;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
//		System.out.println(email +" " + password);

		UserDAO userDAO = new UserDAO(ConnectionProvider.getConnection());

		User user = userDAO.getUserByEmailandPassword(email, password);

		if (user == null) {
			// login Error
			Message message = new Message("Wrong credentials", "error", "alert-danger");
			HttpSession session = request.getSession();
			session.setAttribute("message", message);
			response.sendRedirect("loginPage.jsp");

		} else {
			// login Success
			HttpSession session = request.getSession();
			session.setAttribute("currentUser", user);
			response.sendRedirect("profilePage.jsp");

		}
	}

}
