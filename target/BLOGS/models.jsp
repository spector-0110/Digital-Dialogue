<%@page import="java.util.ArrayList"%>
<%@page import="com.blog.helper.ConnectionProvider"%>
<%@page import="com.blog.DAO.PostDAO"%>
<%@page import="com.blog.entities.User"%>
<%@page errorPage="errorJsp.jsp"%>
<!-- Modal -->
<%@page import="com.blog.entities.Categories"%>
<%
if (session == null)
	response.sendRedirect("index.jsp");
User userM = (User) session.getAttribute("currentUser");
if (userM == null)
	response.sendRedirect("loginPage.jsp");
%>
<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header primary-background text-center">
				<h5 class="modal-title" id="exampleModalLabel">Digital Dialogue</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="container text-center">
					<img src="pics/<%=userM.getProfile()%>" class="img-fluid"
						style="border-radius: 50%; max-width: 150px;"> <br>
					<h5 class="modal-title mt-3" id="exampleModalLabel"><%=userM.getName()%></h5>
					<div id="profile-details">
						<table class="table">
							<tbody>
								<tr>
									<th scope="row">id</th>
									<td><%=userM.getId()%></td>

								</tr>
								<tr>
									<th scope="row">Email</th>
									<td><%=userM.getEmail()%></td>

								</tr>
								<tr>
									<th scope="row">Gender</th>
									<td colspan="2"><%=userM.getGender()%></td>

								</tr>
								<tr>
									<th scope="row">About</th>
									<td colspan="2"><%=userM.getAbout()%></td>
								</tr>
								<tr>
									<th scope="row">Registered on:</th>
									<td colspan="2"><%=userM.getDatetime().toString()%></td>

								</tr>
							</tbody>
						</table>
					</div>


					<!-- edit profile -->


					<div id="profile-edit" style="display: none">
						<h2 class="h-3">Edit Details</h2>
						<form action="EditServlet" method="post"
							enctype="multipart/form-data">
							<table class="table">
								<tr>
									<td>ID:</td>
									<td><%=userM.getId()%></td>
								</tr>
								<tr>
									<td>Email:</td>
									<td><%=userM.getEmail()%></td>
								</tr>
								<tr>
									<td>Name:</td>
									<td><INPUT type="text" class="form-control"
										name="username" value=<%=userM.getName()%>></td>
								</tr>
								<tr>
									<td>Edit Profile:</td>
									<td><INPUT type="file" class="form-control" name="image"></td>
								</tr>
								<tr>
									<td>About:</td>
									<td><textarea rows="6" class="form-control" name="about"><%=userM.getAbout()%></textarea>
									</td>
								</tr>
								<tr>
									<td>Password:</td>
									<td><INPUT type="password" class="form-control"
										name="password" value=<%=userM.getPassword()%>></td>
								</tr>
							</table>
							<diV class="continer">
								<BUTTON type="submit" class="btn btn-outline-success">Save
								</BUTTON>
							</diV>

						</form>

					</div>


				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
				<button id="edit-profile-btn" type="button" class="btn btn-primary">Edit</button>
			</div>
		</div>
	</div>
</div>
<!-- end of user profile  model -->



<!-- start of add post model -->


<!-- Modal -->
<div class="modal fade" id="add-post-model" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Feature Your
					Blog with Us</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">

				<form id="add-post-form" action="AddPostServlet" method="post">
					<div class=form-group>
						<select class="form-control" name="cid">
							<option selected disabled>---Select category---</option>
							<%
							PostDAO postDAOm = new PostDAO(ConnectionProvider.getConnection());
							ArrayList<Categories> allCategoriesM = postDAOm.getAllCategories();
							for (Categories category : allCategoriesM) {
							%>
							<option value=<%=category.getCid()%>><%=category.getName()%></option>
							<%
							}
							%>
						</select>
					</div>
					<br>
					<div class="form-group">
						<input name="pTitle" type="text"
							placeholder="Add title to your post" class="form-control"
							style="height: 60px">
					</div>
					<br>
					<div class="form-group">
						<textarea name="pContent" class="form-control"
							placeholder="Enter your content" style="height: 150px"></textarea>

					</div>
					<br>
					<div class="form-group">
						<textarea name="pCode" class="form-control"
							placeholder="Enter your code" style="height: 150px"></textarea>

					</div>
					<br>
					<div class="form-group">
						<label>Select your photo</label> <input name="pPic" type="file"
							class="form-control">
					</div>
					<br>
					<div class="container text-center">
						<button type="submit" class="btn btn-outline-primary"
							data-bs-dismiss="modal">Post</button>
					</div>
				</form>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>


<!-- end of add post model -->


<!-- add category model -->
<div class="modal fade" id="add-category-model" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Add a new
					category</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">

				<form id="add-category-form" action="AddCategoriesServlet"
					method="post">
					<br>
					<div class="form-group">
						<input name="cName" type="text" placeholder="Category title"
							class="form-control" style="height: 60px">
					</div>
					<br>
					<div class="form-group">
						<textarea name="cDescription" class="form-control"
							placeholder="Enter category decsription" style="height: 150px"></textarea>

					</div>
					<br>
					<div class="container text-center">
						<button type="submit" class="btn btn-outline-primary"
							data-bs-dismiss="modal">ADD</button>
					</div>
				</form>

			</div>
		</div>
	</div>
</div>

<!-- end of add category model -->
