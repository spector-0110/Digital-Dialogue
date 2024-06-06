package com.blog.helper;

import java.sql.*;

public class ConnectionProvider {

	private static Connection connection;

	public static Connection getConnection() {
		try {
			if (connection == null) {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://digitaldialoguemysql.mysql.database.azure.com:3306/digital_dialogue?useSSL=true&requireSSL=false";
				String password = "0987654321#@!Vatsa";
				String username = "digisql";

				connection = DriverManager.getConnection(url, username, password);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}

}
