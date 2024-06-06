package com.blog.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.DAO.PostDAO;
import com.blog.helper.ConnectionProvider;

public class DeleteBlogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("pid"));

		PostDAO postDAO = new PostDAO(ConnectionProvider.getConnection());

		if (postDAO.deleteBlogById(id)) {
			response.sendRedirect("profilePage.jsp");
		} else {
			response.sendRedirect("profilePage.jsp");
		}

	}

}