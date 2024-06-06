package com.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.blog.DAO.PostDAO;
import com.blog.entities.Blogs;
import com.blog.entities.User;
import com.blog.helper.ConnectionProvider;
import com.blog.helper.PicHelper;

@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter pw = response.getWriter();

		int cid = Integer.parseInt(request.getParameter("cid"));
		String title = request.getParameter("pTitle");
		String content = request.getParameter("pContent");
		String code = request.getParameter("pCode");
		Part part = request.getPart("pPic");

		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("currentUser");
		if (user == null) {
			response.sendRedirect("index.jsp");
		}

		Blogs blog = new Blogs(title, content, code, part.getSubmittedFileName(), null, cid, user.getId());

		PostDAO postDAO = new PostDAO(ConnectionProvider.getConnection());
		if (postDAO.saveBlog(blog)) {
			String path = request.getRealPath("/") + "blogs_pics" + File.separator + part.getSubmittedFileName();
			PicHelper.saveFile(part.getInputStream(), path);
			pw.println("done");

		} else {
			pw.println("error");
		}
	}

}
