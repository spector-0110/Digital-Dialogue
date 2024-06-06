<%@page import="com.blog.entities.Categories"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.blog.helper.ConnectionProvider"%>
<%@page import="com.blog.DAO.PostDAO"%>
<%@page import="com.blog.entities.Message"%>
<%@page import="com.blog.entities.User"%>
<%@page errorPage="errorJsp.jsp"%>



<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile Page</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<STYLE>
.float {
	position: fixed;
	width: 100px;
	height: 100px;
	bottom: 60px;
	right: 60px;
	background-color: #2c3e50 !important;
	color: #f5f5f5;
	border-radius: 60px;
	text-align: center;
	box-shadow: 5px 6px 6px #999;
}

.my-float {
	margin-top: 32px;
}
</STYLE>
</head>
<body>
	<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setDateHeader("Expires", -1);

	if (session == null) {
		response.sendRedirect("index.jsp");
	}

	User user = (User) session.getAttribute("currentUser");
	%>

	<!-- NavBar  -->
	<%
	if (user != null) {
	%>

	<%@include file="navLogin.jsp"%>

	<%
	}
	%>

	<!-- end of NavBar -->

	<header>
		<h3>Digital Dialogue</h3>
		<pre>Digital Dialogue is a dynamic online platform designed for
						passionate coders, eager learners, and algorithm.</pre>
	</header>
	<%
	Message message = (Message) session.getAttribute("message");
	if (message != null) {
	%>

	<div class="alert alert-primary <%=message.getCssClass()%>"
		role="alert">
		<%=message.getContent()%>
	</div>


	<%
	session.removeAttribute("message");
	}
	%>


	<!-- start of main body  -->
	<main>
		<div class="container">

			<!-- all BLOGS-->

			<div class="container text-center" id="loader">

				<i class="fa fa-refresh  fa-4x fa-spin"></i>
				<h2 class="mt-2">Loading...</h2>
			</div>

			<div class="container-fluid" id="blog-container"></div>
		</div>

		<a class="float" href="#" data-bs-toggle="modal"
			data-bs-target="#add-post-model"> <i
			class="fa fa-plus fa-2x my-float"></i>
		</a>

	</main>

	<!-- end of main body -->

	<!-- Start of  profile model -->
	<%@include file="models.jsp"%>

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

