package com.blog.helper;

import java.sql.*;

public class ConnectionProvider {

	private static Connection connection;

	public static Connection getConnection() {
		try {
			if (connection == null) {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/digital_dialogue";
				String password = "0987654321";
				String username = "root";

				connection = DriverManager.getConnection(url, username, password);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}

}
