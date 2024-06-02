
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>
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

.card-body {
	height: 100%;
	padding: 1rem; /* Adjust padding as needed */
}
</style>
</head>
<body>
	<!-- NavBar -->
	<%@include file="navbar1.jsp"%>
	<main class="primary-background p-5 banner-background">
		<div class="container">
			<div class="col-md-6 offset-md-3 ">
				<div class="card">
					<div class="card-header primary-background text-white text-center">
						<span class="fa fa-user-plus fa-3x"></span> <br>
						<p>Register here</p>
					</div>
					<div class="card-body ">
						<form id="reg-form" action="RegisterServlet" method="POST">

							<div class="form-group">
								<input required name="username" type="text" class="form-control"
									id="user_name" aria-describedby="emailHelp"
									placeholder="Enter name"> <br>
							</div>

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

							<div class="form-group">
								<input required type="radio" id="gender" name="gender"
									value="male">&nbsp Male &nbsp <input required type="radio"
									id="gender" name="gender" value="famale">&nbspFemale

							</div>
							<br>

							<div class="form-group">

								<textarea name="about" class="form-control" id="" rows="5"
									placeholder="Enter something about yourself"></textarea>

							</div>


							<div class="form-check">
								<input required name="check" type="checkbox"
									class="form-check-input" id="exampleCheck1"> <label
									class="form-check-label" for="exampleCheck1">agree
									terms and conditions</label>
							</div>

							<br>

							<div class="container text-center" id="loader"
								style="display: none;">
								<span class="fa fa-refresh fa-spin fa-4x"></span>
								<h4>Please wait..</h4>
							</div>

							<div class="text-center">
								<button id="submit-btn" type="submit" class="btn btn-primary">Register</button>
								&nbsp <a href="loginPage.jsp"> Already have an account?
									Login! </a>
							</div>
						</form>
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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
            $(document).ready(function () {
                console.log("loaded........")

                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();



                    let form = new FormData(this);

                    $("#submit-btn").hide();
                    $("#loader").show();
                    //send register servlet:
                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)

                            $("#submit-btn").show();
                            $("#loader").hide();
                            
                            if (data.trim() === 'success')
                            {

                                swal("Registered successfully.. redirecting to login page")
                                        .then((value) => {
                                            window.location = "loginPage.jsp"
                                        });
                            } else
                            {

                                swal(data);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#submit-btn").show();
                            $("#loader").hide();
                            swal("something went wrong..try again");

                        },
                        processData: false,
                        contentType: false
                    });
                });
            });



        </script>

</body>
</html>