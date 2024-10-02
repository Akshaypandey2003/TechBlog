<%@page import="com.tech.utility.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page import="com.tech.dao.*"%>
<%@page import="com.tech.entities.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% // Fetching all the available categories...........>
	PostDao p = new PostDao(ConnectionProvider.getConnection());
	ArrayList<Category> list = p.getAllCategories(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-
awesome.min.css">
<style>
body {
	background: linear-gradient(to right, #000000, #11998e, #000000);
	background: linear-gradient(to right, #c38adcc2, #a1dfc5, #e5c67b 100%);
}

.banner-background {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 99%, 66% 90%, 31% 100%, 0 91%, 0 0);
}

a {
	text-decoration: none;
	color: white;
}

span {
	margin: 6px;
}

.btn a:hover {
	color: black;
}

.card {
	background: #0000001c;
}

.no-wrap {
	white-space: nowrap; /* Prevents text from wrapping to the next line */
	overflow: hidden; /* Ensures any overflow is hidden */
	text-overflow: ellipsis;
	/* Adds an ellipsis (...) if the text is too long */
	width: 100%; /* Set a width for the container (adjust as needed) */
}
</style>



</head>
<body>
	<!-- NAvBAr -->
	<%@include file="NavBar.jsp"%>


	<!-- Banner -->
	<div class="container-fluid p-0  m-0 ">
		<div class="jumbotron   primary-background banner-background">

			<div class="container  p-5 text-white ">
				<h3 class="display-3">Welcome, To</h3>
				<h3>TechTalk</h3>
				<p>programming or coding is the composition of sequences of
					instructions, called programs, that computers can follow to perform
					tasks. It involves designing and implementing algorithms,
					step-by-step specifications of procedures, by writing code in one
					or more programming languages.</p>
				<p>Programmers typically use high-level programming languages
					that are more easily intelligible to humans than machine code,
					which is directly executed by the central processing unit.</p>

             <%if(user==null){
            	 %>
            	 <button class="btn btn-outline-light">
					<span class="fa fa-pencil-square-o"></span><a
						href="registerPage.jsp" class="start-buttons"> Start ! its
						free</a>
				</button>
				<button class="btn btn-outline-light">
					<span class="fa fa-key fa-spin"></span><a href="login.jsp"
						class="start-buttons">Login</a>
				</button>
            <%} %> 
				

			</div>
		</div>
	</div>
	<div class="col-md-12 overflow-auto scrollable-div mt-4"
		style="max-height: 100vh;">
		<!-- Actual posts -->
		<div class="container text-center" id="loader">
			<%@include file="ShimmerCardsHomePage.jsp"%>
			<!--  	<i class="fa fa-refresh fa-spin fa-4x"></i>
						<h3 class=mt-3>Loading....</h3>  -->
		</div>

		<div class="container" id="post-container"></div>
	</div>
	
	<%if(user!=null){
		%>
		<!-- Profile modal -->

	<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header text-white " style="background: #232320fa">
					<h1 class="modal-title fs-5" id="exampleModalLabel">TechTalk</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				
				<div class="modal-body">
					<div class="container text-center">
                        
					 	<div class="container"
								style="height: 6rem; width: 6rem; border-radius: 4rem; 
                                background-image: url('profile-pic?filename=<%=user.getImage()%>');
                                 background-size: cover; background-position: center; 
                                 background-repeat: no-repeat;">
							</div>  

						<h5 class="modal-title fs-5" id="exampleModalLabel"><%=user.getName()%></h5>

						<div id="profile-details">

							<table class="table">

								<tr>
									<th scope="row">User Id:</th>
									<td><%=user.getId()%></td>
								</tr>
								<tr>
									<th scope="row">Email:</th>
									<td><%=user.getEmailString()%></td>
								</tr>
								<tr>
									<th scope="row">Registered on:</th>
									<td><%=user.getDateTime()%></td>
								</tr>
							</table>
						</div>
						<div id="profile-edit" style="display: none;">
							<h4 class="mt-2">Update Details</h4>
							<form action="EditServlet" method="post"
								enctype="multipart/form-data">
								<table class="table">
									<tr>
										<td>ID:</td>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<td>Email:</td>
										<td><input type="email" class="form-control"
											name="edit-email" value="<%=user.getEmailString()%>"></td>
									</tr>
									<tr>
										<td>Password:</td>
										<td><input type="password" class="form-control"
											name="edit-password" value="<%=user.getPasswordString()%>"></td>
									</tr>
									</tr>
									<tr>
										<td>New Image:</td>
										<td><input type="file" class="form-control"
											name="edit-image"></td>
									</tr>

								</table>
								<div class="container">
									<button class="btn btn-outline-primary" type="submit">Save</button>
								</div>
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
	<!--  End of profile modal -->
		<!-- Post modal -->


	<!-- Modal -->
	<div class="modal fade" id="add-post-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header text-white" style="background: #232320fa">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Post</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="post-form" action="PostServlet" method="post">

						<div class="form-group">
							<select class="form-control m-2" name="post-category">
								<option selected disabled>----Select Category---</option>

								<%
								for (Category cat : list) {
								%>
								<option value="<%=cat.getCatId()%>"><%=cat.getCatNameString()%></option>
								<%
								}
								%>

							</select>
						</div>

						<div class="form-group m-2">
							<input class="form-control" type="text" placeholder="Enter Title"
								name="post-title" required>
						</div>
						<div class="form-group m-2">
							<textarea class="form-control" placeholder="Enter your content"
								name="post-content" required></textarea>
						</div>
						<div class="form-group m-2">
							<textarea class="form-control" name="post-code"
								placeholder="Enter your program code (if any)"></textarea>
						</div>
						<div class="form-group m-2">
							<label>Choose your file:</label> <br> <input type="file"
								name="post-pic" style="margin-top: 2px;">
						</div>
						

					</form>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-outline-primary"
								data-bs-dismiss="modal">Post</button>
					</div>
				</div>

			</div>
		</div>
	</div>
	<%}  %>






	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
		integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
		crossorigin="anonymous"></script>

	<script>
		function makeActive(element) {
			$(".nav-link").removeClass("active");
			$(element).addClass("active");
		}
	</script>
	
	<script>
$(document).ready(function(){
	
	let editStatus = false;
	$("#edit-profile-btn").click(function(){
		
		if(!editStatus)
		{
			$("#profile-details").hide();
			$("#profile-edit").show();
			$(this).text("Back");
			editStatus = true;
		}
		else{
			$("#profile-details").show();
			$("#profile-edit").hide();
			editStatus = false;
		}
		
		
	})
	setInterval(() => {
		$('#edit-status').hide();
	}, 1000);
	
});
</script>
	<!--  Add post Js -->
	<script>
      $(document).ready(function(){
	
	 $("#post-form").on("submit",function(event){
		 
		 event.preventDefault();
		 let form = new FormData(this);
		 
		 //Requesting to servlet-->
		 $.ajax({
			 url:"PostServlet",
			 type:"POST",
			 data:form,
			 success: function(data,textStatus,jqXHR){
				//succcess...
				if(data.trim()=="done")
				{
					swal("Good Job!","Posted Successfully","success");
				}
				else{
					swal("Error!","Something went wrong try again...","error");
				}
				
			 },
		     error:function(jqXHR,textStatus,errorThrown){
		    	 swal("Error!","Something went wrong try again...","error");
			 //error..
		     },
			processData:false,
			contentType:false
		 })
		 
	 })
 })
</script>
	<!-- Load all the posts -->

	<script>
		function getPosts(id) {
			$("#loader").show();
			 $('#post-container').hide(); 
			$.ajax({
				url : "HomePagePosts.jsp",
				data : {
					cId : id
				},
				success : function(data, textStatus, jqXHR) {
					$('#post-container').show(); 
					console.log(data);
					     $("#loader").hide(); 
						 $('#post-container').html(data);
						
				},

			})
		}
		$(document).ready(function() {
			getPosts(0);

		})
	</script>

</body>
</html>