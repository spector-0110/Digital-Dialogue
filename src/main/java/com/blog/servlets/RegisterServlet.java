package com.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.blog.DAO.UserDAO;
import com.blog.entities.User;
import com.blog.helper.ConnectionProvider;

@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter pw = response.getWriter();
		// String check = request.getParameter("check");
		String name = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String about = request.getParameter("about");

//			Create user object
		User user = new User(name, email, password, gender, about, null);

		// create DAO object
		UserDAO userDAO = new UserDAO(ConnectionProvider.getConnection());

		if (userDAO.saveUser(user)) {
			pw.println("success");

		} else {
			pw.println("faliure");

		}

	}

}
