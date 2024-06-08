package com.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blog.DAO.UserDAO;
import com.blog.entities.User;
import com.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class OtpVerificationServlet
 */
@MultipartConfig
public class OtpVerificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter pw = response.getWriter();

		String userOtp = request.getParameter("otp");
		HttpSession session = request.getSession();

		User user = (User) session.getAttribute("user");
		String otp = (String) session.getAttribute("otp");
		
		//System.out.println(user +" " + otp  + " "+ userOtp);

		UserDAO userDAO = new UserDAO(ConnectionProvider.getConnection());

		if (otp.equals(userOtp)) {
			if (userDAO.saveUser(user)) {
				pw.println("success");

			} else {
				pw.println("faliure");
			}
		} else {
			pw.println("incorrectOtp");
		}

	}

}
