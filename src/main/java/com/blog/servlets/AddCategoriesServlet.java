package com.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blog.DAO.AddCategoriesDAO;
import com.blog.entities.Categories;
import com.blog.entities.User;
import com.blog.helper.ConnectionProvider;

@MultipartConfig
public class AddCategoriesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		PrintWriter pw = response.getWriter();

		String name = request.getParameter("cName");
		String description = request.getParameter("cDescription");

		Categories categories = new Categories(name, description);
		User user = (User) session.getAttribute("currentUser");
		if(user==null) {
			response.sendRedirect("index.jsp");
		}
		AddCategoriesDAO addCategoriesDAO = new AddCategoriesDAO(ConnectionProvider.getConnection());
		if (addCategoriesDAO.addCategory(categories)) {
			pw.println("done");

		} else {
			pw.println("error");

		}

	}

}
