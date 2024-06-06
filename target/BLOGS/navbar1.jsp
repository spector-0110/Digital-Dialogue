<%@page import="com.blog.helper.ConnectionProvider"%>
<%@page import="com.blog.entities.Categories"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.blog.DAO.PostDAO"%>
<nav class="navbar navbar-expand-lg navbar-light primary-background">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"><span class="fa fa-edit"></span>
			Digital Dialogue</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">


				<li class="nav-item dropdown"><a
					class="nav-link active dropdown-toggle" href="#" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"> Categories </a>
					<ul class="dropdown-menu">
						<li><a href="#" onClick="getPost(0,this)"
							class="c-link list-group-item list-group-item-action"
							aria-current="true" style="background-color: #2c3e50;"> All
								BLOGS.. </a></li>

						<%
						PostDAO postDAO = new PostDAO(ConnectionProvider.getConnection());

						ArrayList<Categories> allCategories = postDAO.getAllCategories();
						for (Categories category : allCategories) {
						%>
						<li><a href="#"
							onClick="getPost(<%=category.getCid()%>,this)"
							class="c-link list-group-item list-group-item-action dropdown-item"
							style="background-color: #2c3e50;"><%=category.getName()%></a></li>

						<%
						}
						%>

					</ul></li>
			</ul>
		</div>
	</div>
</nav>