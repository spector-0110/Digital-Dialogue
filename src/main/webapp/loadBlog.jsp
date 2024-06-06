
<%@page import="com.blog.entities.User"%>
<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="com.blog.entities.Blogs"%>
<%@page import="com.blog.helper.ConnectionProvider"%>
<%@page import="com.blog.DAO.PostDAO"%>
<%@page errorPage="errorJsp.jsp"%>

<%
response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setDateHeader("Expires", -1);

if (session == null)
	response.sendRedirect("index.jsp");
User user = (User) session.getAttribute("currentUser");
%>
<style>
.card {
	height: 100%; /* Ensure all cards have the same height */
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.card-img-container {
	height: 50%; /* Set the height of the image container to 60% */
	display: flex;
	align-items: center;
	justify-content: center;
}

.card-img-top {
	max-width: 80%;
	max-height: 100%;
	height: auto; /* Maintain aspect ratio */
}

.card-body {
	flex-grow: 1; /* Ensure card body takes remaining space */
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.button {
	margin-top: auto; /* Push the button to the bottom */
}
</style>
<div class="row">
	<%
	PostDAO postDAO = new PostDAO(ConnectionProvider.getConnection());

	int cid = Integer.parseInt(request.getParameter("cid"));
	List<Blogs> allBlogs = null;

	if (cid == 0) {
		allBlogs = postDAO.getAllBlogs();
	} else if (cid == -1) {
		allBlogs = postDAO.getBlogsByUser(user.getId());
	} else {
		allBlogs = postDAO.getBlogsByCategory(cid);

	}
	if (allBlogs.size() == 0) {
		out.println("<h3 class='text-center display-3 '>Be the first to add a BLOG! </h3>");
		return;
	}

	for (Blogs blog : allBlogs) {

		String s = blog.getPic();
	%>

	<div class="col-md-4 mt-4">
		<div class="card">
			<div class="card-img-container">
				<img src="blogs_pics/<%=s%>" class="card-img-top" alt="Blog Image">
			</div>
			<div class="card-body">
				<h5 class="card-title"><%=blog.getTitle()%></h5>
				<%
				if (user != null) {
				%>
				<a href="readBlogPage.jsp?pid=<%=blog.getPid()%>" class="button">Read
					more...</a>
				<%
				}
				%>

			</div>
		</div>
	</div>
	<%
	}
	%>
</div>