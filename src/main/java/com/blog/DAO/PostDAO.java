package com.blog.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.blog.entities.Blogs;
import com.blog.entities.Categories;

public class PostDAO {

	private Connection connection;

	public PostDAO(Connection connection) {
		this.connection = connection;
	}

	public ArrayList<Categories> getAllCategories() {
		ArrayList<Categories> allCategories = new ArrayList<Categories>();
		try {
			String query = "select * from categories";
			Statement statement = this.connection.createStatement();
			ResultSet rs = statement.executeQuery(query);

			while (rs.next()) {
				int cid = rs.getInt("cid");
				String name = rs.getString("name");
				String description = rs.getString("description");

				Categories categorie = new Categories(cid, name, description);
				allCategories.add(categorie);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return allCategories;

	}

	public boolean saveBlog(Blogs blog) {

		boolean flag = false;
		try {
			String query = "Insert into blogs(title,content,code,pic,cid,uid) values(?,?,?,?,?,?)";

			PreparedStatement ps = connection.prepareStatement(query);

			ps.setString(1, blog.getTitle());
			ps.setString(2, blog.getContent());
			ps.setString(3, blog.getCode());
			ps.setString(4, blog.getPic());
			ps.setInt(5, blog.getCid());
			ps.setInt(6, blog.getUid());

			ps.executeUpdate();
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;

	}

	public List<Blogs> getAllBlogs() {
		List<Blogs> allBlogs = new ArrayList<Blogs>();
		try {

			String query = "select * from blogs order by id desc";
			Statement statement = this.connection.createStatement();
			ResultSet rs = statement.executeQuery(query);

			while (rs.next()) {

				int id = rs.getInt("id");
				int uid = rs.getInt("uid");
				int cid = rs.getInt("cid");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String code = rs.getString("code");
				String pic = rs.getString("pic");
				Timestamp timestamp = rs.getTimestamp("date");

				Blogs blogs = new Blogs(id, title, content, code, pic, timestamp, cid, uid);
				allBlogs.add(blogs);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return allBlogs;
	}

	public List<Blogs> getBlogsByCategory(int cid) {
		List<Blogs> allCategoryBlogs = new ArrayList<Blogs>();
		try {

			String query = "select * from blogs where cid=?";
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setInt(1, cid);
			ResultSet rs = statement.executeQuery();

			while (rs.next()) {

				int id = rs.getInt("id");
				int uid = rs.getInt("uid");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String code = rs.getString("code");
				String pic = rs.getString("pic");
				Timestamp timestamp = rs.getTimestamp("date");

				Blogs blogs = new Blogs(id, title, content, code, pic, timestamp, cid, uid);
				allCategoryBlogs.add(blogs);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return allCategoryBlogs;
	}

	public List<Blogs> getBlogsByUser(int uid) {
		List<Blogs> allUsersBlogs = new ArrayList<Blogs>();
		try {

			String query = "select * from blogs where uid=?";
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setInt(1, uid);
			ResultSet rs = statement.executeQuery();

			while (rs.next()) {

				int id = rs.getInt("id");
				int cid = rs.getInt("cid");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String code = rs.getString("code");
				String pic = rs.getString("pic");
				Timestamp timestamp = rs.getTimestamp("date");

				Blogs blogs = new Blogs(id, title, content, code, pic, timestamp, cid, uid);
				allUsersBlogs.add(blogs);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return allUsersBlogs;
	}

	public Blogs getBlogById(int id) {
		Blogs blog = null;
		try {

			String query = "select * from blogs where id=?";
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setInt(1, id);
			ResultSet rs = statement.executeQuery();

			while (rs.next()) {

				int uid = rs.getInt("uid");
				int cid = rs.getInt("cid");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String code = rs.getString("code");
				String pic = rs.getString("pic");
				Timestamp timestamp = rs.getTimestamp("date");

				blog = new Blogs(id, title, content, code, pic, timestamp, cid, uid);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return blog;
	}

	public boolean deleteBlogById(int id) {
		boolean flag = false;
		try {

			String query = "delete from blogs where id=?";
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setInt(1, id);
			statement.execute();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

}
