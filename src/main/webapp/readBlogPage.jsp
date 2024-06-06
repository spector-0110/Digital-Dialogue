
<%@page import="java.text.DateFormat"%>
<%@page import="com.blog.DAO.UserDAO"%>
<%@page import="com.blog.entities.Blogs"%>
<%@page errorPage="errorJsp.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Read BLOG</title>
<!-- Bootstrap CSS -->
<head>
<link href="css/style.css" rel="stylesheet" type="text/css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
	<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setDateHeader("Expires", -1);

	if (session == null)
		response.sendRedirect("index.jsp");
	User user = (User) session.getAttribute("currentUser");
	%>

	<%
	int id = Integer.parseInt(request.getParameter("pid"));
	PostDAO postDAOR = new PostDAO(ConnectionProvider.getConnection());
	Blogs blog = postDAOR.getBlogById(id);

	UserDAO userDAOR = new UserDAO(ConnectionProvider.getConnection());
	User userPostedBlog = userDAOR.getUserByUserId(blog.getUid());
	%>
	<%@include file="navLogin.jsp"%>
	<header>
		<h3>Digital Dialogue</h3>
		<pre>Digital Dialogue is a dynamic online platform designed for
						passionate coders, eager learners, and algorithm.</pre>
	</header>

	<!-- Main Content -->
	<div class="container">
		<div class="blog-content">
			<h2 class="blog-title"></h2>
			<p class="blog-meta">
				Posted on <span id="blog-date"><%=DateFormat.getDateTimeInstance().format(blog.getDateTimestamp())%></span>
				by <span id="blog-author" style="text-transform: uppercase"><b><%=userPostedBlog.getName()%></b>
				</span>
			</p>
			<img src="blogs_pics/<%=blog.getPic()%>" alt="Blog Image">
			<p class="blog-body"><%=blog.getContent()%></p>
			<br>
			<pre><%=blog.getCode()%></pre>

			<%
			if (blog.getUid() == user.getId() || user.getEmail().equals("admin@gmail.com")) {
			%>
			<div class="text-center">
				<a href="DeleteBlogServlet?pid=<%=blog.getPid()%>" class="button">Delete
					BLOG</a>
			</div>
			<%
			}
			%>
		</div>
		<%@include file="models.jsp"%>
	</div>
	<!-- Bootstrap JS and jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script type="text/javascript" src="js/js.js"></script>
</body>
<footer>
	<%@include file="footer.jsp"%>
</footer>
</html>
