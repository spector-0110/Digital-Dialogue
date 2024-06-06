<%@page import="com.blog.entities.User"%>
<%@page import="com.blog.entities.Categories"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.blog.helper.ConnectionProvider"%>
<%@page import="com.blog.DAO.PostDAO"%>
<%@page errorPage="errorJsp.jsp"%>

<%
response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setDateHeader("Expires", -1);

if (session == null)
	response.sendRedirect("index.jsp");
User userN = (User) session.getAttribute("currentUser");
if (userN == null)
	response.sendRedirect("index.jsp");
%>
<nav class="navbar navbar-expand-lg navbar-light primary-background">
	<div class="container-fluid">
		<a class="navbar-brand" href="profilePage.jsp"><span
			class="fa fa-edit"></span> Digital Dialogue</a>
		<ul class="navbar-nav me-auto mb-lg-0">

			<li class="nav-item dropdown "><a
				class="nav-link active dropdown-toggle" href="#" role="button"
				data-bs-toggle="dropdown" aria-expanded="false"> Categories </a>
				<ul class="dropdown-menu">
					<li><a href="#" onClick="getPost(-1,this)"
						class="c-link list-group-item list-group-item-action"
						style="background-color: #2c3e50;" aria-current="true"> <%=userN.getName()%>'
							BLOG
					</a></li>

					<%
					PostDAO postDAON = new PostDAO(ConnectionProvider.getConnection());

					ArrayList<Categories> allCategoriesN = postDAON.getAllCategories();
					for (Categories category : allCategoriesN) {
					%>
					<li><a href="#" onClick="getPost(<%=category.getCid()%>,this)"
						class="c-link list-group-item list-group-item-action dropdown-item"
						style="background-color: #2c3e50;"><%=category.getName()%></a></li>

					<%
					}
					%>
				</ul></li>
		</ul>
		&nbsp;&nbsp;

		<ul class="navbar-nav me-auto mb-lg-0"
			style="background-color: #2c3e50;">
			<li class="nav-item dropdown "><a class="nav-link active"
				href="#" role="button" data-bs-toggle="dropdown"
				aria-expanded="false"><span class="fa fa-user-circle fa-2x"></span>
			</a>
				<ul class="dropdown-menu">
					<li><a class="nav-link" href="#" data-bs-toggle="modal"
						data-bs-target="#exampleModal" style="background-color: #2c3e50;">
							<span class="fa fa-user-circle fa-2x"></span>&nbsp;&nbsp;<%=userN.getName()%>
					</a>
						<div style="background-color: #2c3e50;">
							<a class="button" type="button" href="LogoutServlet"
								style="background-color: #2c3e50;"> <img
								src="img/logout.gif" alt="HTML tutorial"
								style="background-color: #2c3e50; width: 42px; height: 42px; padding-top: 5px; padding-left: 5px; padding-right: 5px">
								<span>logout</span>
							</a>
						</div></li>

				</ul></li>

		</ul>



		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<%
			if (userN.getEmail().equals("admin@gmail.com")) {
			%>
			<ul class="navbar-nav ml-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link" href="#"
					data-bs-toggle="modal" data-bs-target="#add-category-model"><span
						class="fa fa-address-card-o"></span>Add Category</a></li>
			</ul>
			<%
			}
			%>
		</div>
	</div>
</nav>
