package com.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blog.DAO.UserDAO;
import com.blog.entities.User;
import com.blog.helper.ConnectionProvider;
import com.blog.helper.EmailSender;
import com.mysql.cj.Session;

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

		// check if email is correct or not i.e. email verification

		String myMail = "spectorcodes@gmail.com";

		// generating a random text

		Random random = new Random();
		int min = 100000;
		int max = 999999;
		Integer otp = random.nextInt(max - min) + min;
		//System.out.println(otp);
		String text = otp.toString();
		//System.out.println(text);

		String subject = "Verification OTP for Digital Dialogue";

		UserDAO userDAO = new UserDAO(ConnectionProvider.getConnection());

		if (userDAO.getUserByEmail(email) == null) {

			boolean flag = EmailSender.getEmailSender(email, myMail, subject, text);

//				Create user object
			User user = new User(name, email, password, gender, about, null);

			HttpSession session = request.getSession();

			session.removeAttribute("user");
			session.removeAttribute("otp");

			session.setAttribute("user", user);
			session.setAttribute("otp", text);

			//System.out.println(session.getAttribute("user") + " " + session.getAttribute("otp"));

			pw.println("in otp servlet");

		} else {
			pw.println("Already Registered!");

		}
	}

}
