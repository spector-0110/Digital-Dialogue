package com.blog.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.blog.entities.Categories;

public class AddCategoriesDAO {
	private Connection connection;

	public AddCategoriesDAO(Connection connection) {
		this.connection = connection;
	}

	public boolean addCategory(Categories categories) {

		boolean flag = false;
		try {
			String query = "insert into categories (name, description) values(?,?)";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, categories.getName());
			preparedStatement.setString(2, categories.getDescription());

			preparedStatement.executeUpdate();
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
}
