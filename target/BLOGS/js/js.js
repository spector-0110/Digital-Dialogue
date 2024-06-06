
//Loading post using Ajax

function getPost(catId, reference) {

	$(".c-link").removeClass('primary-background');

	$("#loader").show();
	$("#blog-container").hide();

	$.ajax({
		url: "loadBlog.jsp",
		data: {
			cid: catId
		},
		success: function(data, textstatus, jqXHR) {
			console.log(data);
			$("#loader").hide();
			$("#blog-container").show();
			$("#blog-container").html(data);
			$(reference).addClass('primary-background ');
		}

	})

}


$(document).ready(function(e) {
	let initialActive = $('.c-link')[0];
	getPost(0, initialActive)
})


//	post java script

$(document)
	.ready(
		function(e) {
			//
			$("#add-post-form")
				.on(
					"submit",
					function(event) {
						//this code gets called when form is submitted....
						event.preventDefault();
						console
							.log("clicked on submit..")
						let form = new FormData(this);

						//now requesting to server
						$
							.ajax({
								url: "AddPostServlet",
								type: 'POST',
								data: form,
								success: function(
									data,
									textStatus,
									jqXHR) {
									//success ..
									console
										.log(data);
									if (data.trim() == 'done') {
										swal(
											"Good job!",
											"saved successfully",
											"success");
									}

									else {
										swal(
											"Error!!",
											"Something went wrong try again...",
											"error");
									}
								},
								error: function(
									jqXHR,
									textStatus,
									errorThrown) {
									//error..
									swal(
										"Error!!",
										"Something went wrong try again...",
										"error");
								},
								processData: false,
								contentType: false
							})
					})
		})
		
		
		// edit profile js
		
		
$(document).ready(function() {
	let edit = true;
	$('#edit-profile-btn').click(function() {
		//	alert("hi")
		if (edit) {
			$("#profile-details").hide()
			$("#profile-edit").show();
			$(this).text("Back")
			edit = false;
		} else {
			$("#profile-details").show()
			$("#profile-edit").hide();
			$(this).text("Edit")
			edit = true;
		}
	})
});

// add category model


$(document)
	.ready(
		function(e) {
			//
			$("#add-category-form")
				.on(
					"submit",
					function(event) {
						//this code gets called when form is submitted....
						event.preventDefault();
						console
							.log("clicked on submit..")
						let form = new FormData(this);

						//now requesting to server
						$
							.ajax({
								url: "AddCategoriesServlet",
								type: 'POST',
								data: form,
								success: function(
									data,
									textStatus,
									jqXHR) {
									//success ..
									console
										.log(data);
									if (data.trim() == 'done') {
										swal(
											"Good job!",
											"Successfully added a category",
											"success");
									}

									else {
										swal(
											"Error!!",
											"Something went wrong try again...",
											"error");
									}
								},
								error: function(
									jqXHR,
									textStatus,
									errorThrown) {
									//error..
									swal(
										"Error!!",
										"Something went wrong try again...",
										"error");
								},
								processData: false,
								contentType: false
							})
					})
		})

