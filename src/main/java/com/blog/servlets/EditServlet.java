package com.blog.servlets;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.blog.DAO.UserDAO;
import com.blog.entities.Message;
import com.blog.entities.User;
import com.blog.helper.ConnectionProvider;
import com.blog.helper.PicHelper;
import com.mysql.cj.x.protobuf.MysqlxCrud.Delete;

@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String about = request.getParameter("about");
		String name = request.getParameter("username");
		String password = request.getParameter("password");

		// to update profile picture
		Part imagePart = request.getPart("image");
		String imageName = imagePart.getSubmittedFileName();

		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("currentUser");

		// Saving old file name to delete it later
		String oldImageFile = user.getProfile();

		user.setAbout(about);
		user.setName(name);
		user.setPassword(password);
		user.setProfile(imageName);

		UserDAO updateDao = new UserDAO(ConnectionProvider.getConnection());
		boolean flag = updateDao.updateUser(user);
		if (flag) {

//			Delete old image form pics we need old path
			String oldImagePath = request.getRealPath("/") + "pics" + File.separator + oldImageFile;
			if (oldImagePath != "default.jpg") {
				PicHelper.deleteFile(oldImagePath);
				// System.out.println("default picture not deleted");
			}

			String path = request.getRealPath("/") + "pics" + File.separator + user.getProfile();

			// deleting image if already exists to save memeory
			PicHelper.deleteFile(path);

			if (PicHelper.saveFile(imagePart.getInputStream(), path)) {
				// System.out.println("saved");
				Message message = new Message("Profile Updated", "success", "alert-success");
				session.setAttribute("message", message);
			} else {
				// System.out.println("Not in saved");
				Message message = new Message("Something went wrong in saving", "error", "alert-danger");
				session.setAttribute("message", message);
			}

		} else {
			// System.out.println("Not saved");
			Message message = new Message("Something went wrong", "error", "alert-danger");
			session.setAttribute("message", message);
		}

		response.sendRedirect("profilePage.jsp");
	}

}
