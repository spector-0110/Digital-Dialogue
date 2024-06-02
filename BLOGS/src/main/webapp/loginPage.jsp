<%@page import="com.blog.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.banner-background {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 89%, 70% 100%, 33% 93%, 0 96%, 0 0);
}
</style>
</head>
<body>

	<!-- NavBar -->
	<%@include file="navbar1.jsp"%>
	<main
		class="d-flex align-items-center primary-background banner-background"
		style="height: 70vh">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-header primary-background text-white text-center">
							<span class="fa fa-user-circle fa-3x"></span> <br>
							<p>login here</p>
						</div>

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


						<div class="card-body ">
							<form action="LoginServlet" method="POST">
								<div class="form-group">
									<input required name="email" type="email" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										placeholder="Enter email"> <br>
								</div>

								<div class="form-group">
									<input required name="password" type="password"
										class="form-control" id="exampleInputPassword1"
										placeholder="Password"> <br>
								</div>

								<div class="text-center">
									<button type="submit" class="btn btn-primary">Login</button>
									&nbsp <a href="registerPage.jsp"> Don't have an account?
										Register! </a>
								</div>
							</form>
						</div>
						<div class="card"></div>
					</div>
				</div>
			</div>
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
	<!-- <script src="js/js.js" type="text/javascript"></script> -->
</body>
</html>