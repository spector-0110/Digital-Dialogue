package com.blog.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.blog.entities.User;

public class UserDAO {
	private Connection connection;

	public UserDAO(Connection conn) {
		this.connection = conn;
	}

	public boolean saveUser(User user) {
		boolean flag = false;
		try {
			String query = "insert into user(name,email,password,gender,about) value(?,?,?,?,?)";
			PreparedStatement ps = this.connection.prepareStatement(query);

			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getGender());
			ps.setString(5, user.getAbout());
			ps.executeUpdate();
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;

	}

	public User getUserByEmailandPassword(String email, String password) {

		User user = null;

		try {
			String query = "select * from user where email=? and password=?";
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setAbout(rs.getString("about"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setGender(rs.getString("gender"));
				user.setDatetime(rs.getTimestamp("rDate"));
				user.setPassword(rs.getString("password"));
				user.setProfile(rs.getString("profile"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;

	}

}
