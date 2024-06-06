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
<script>
	history.forward();
</script>

</head>
<body>
	<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setDateHeader("Expires", -1);
	%>

	<!-- NavBar -->
	<%@include file="navbar1.jsp"%>
	<main class="d-flex align-items-center" style="height: 70vh">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div>
						<div class="text-center m-2">
							<span class="fa fa-user-circle fa-3x"></span> <br>
							<p>login here</p>
						</div>
						<!-- message for success or failure -->
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
									<button type="submit">Login</button>
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
<footer class="text-center">
	<%@include file="footer.jsp"%>
</footer>
</html>