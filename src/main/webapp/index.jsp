<%@page import="com.blog.helper.ConnectionProvider"%>
<%@page errorPage="errorJsp.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page errorPage="errorJsp.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index page</title>
<script>
	history.forward();
</script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
	<!-- NavBar  -->
	<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setDateHeader("Expires", -1);
	%>
	<%@include file="navbar1.jsp"%>


	<div class="container-fluid p-0 m-0 " style="background-color: #f5f5f5">
		<HEADER>
			<div>
				<div class="container">
					<h3 class="display-3">Welcome to Digital Dialogue.</h3>
					<br>
					<p>Digital Dialogue is a dynamic online platform designed for
						passionate coders, eager learners, and algorithm.</p>
					<p>Whether you're diving into the intricacies of programming
						languages or unraveling the mysteries of data structures and
						algorithms, Digital Dialogue offers a space for exploration,
						collaboration, and knowledge-sharing.</p>
					<p>Engage in vibrant discussions, exchange ideas, and seek
						advice from fellow tech enthusiasts in interactive forums and
						comment sections.</p>
					<br> <a href="registerPage.jsp" class="button"> <SPAN
						class="fa fa-user-plus"></SPAN> Register ! It's free
					</a>&nbsp <a href="loginPage.jsp" class="button"> <SPAN
						class="fa fa-user-circle fa-spin"></SPAN> Login
					</a> <br> <br> <br>

				</div>
			</div>
		</HEADER>

	</div>
	<br>
	<main>
		<div class="container">

			<!-- all BLOGS-->

			<div class="container text-center" id="loader">

				<i class="fa fa-refresh  fa-4x fa-spin"></i>
				<h2 class="mt-2">Loading...</h2>
			</div>

			<div class="container-fluid" id="blog-container"></div>
		</div>
	</main>



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
	<script src="js/js.js" type="text/javascript"></script>
</body>
<footer class="footer">
	<%@include file="footer.jsp"%>
</footer>

</html>

<!-- 
 -->