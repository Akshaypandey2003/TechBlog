<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.tech.entities.*"%>
<%@ page import="com.tech.utility.*"%>
<%@ page import="com.tech.dao.*"%>

<%@ page import="java.util.*"%>
<%
User user = (User) request.getSession().getAttribute("currentUser");

//Fetching all the available categories...........>
PostDao p = new PostDao(ConnectionProvider.getConnection());
ArrayList<Category> list = p.getAllCategories();
%>

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
	background: linear-gradient(to right, #000000, #11998e 50%, #000000 100%);
	background: linear-gradient(to right, #c38adcc2, #a1dfc5, #e5c67b 100%);
}

span {
	margin: 6px;
}

.modal {
	background: #0000001c;
}

.no-wrap {
	white-space: nowrap; /* Prevents text from wrapping to the next line */
	overflow: hidden; /* Ensures any overflow is hidden */
	text-overflow: ellipsis;
	/* Adds an ellipsis (...) if the text is too long */
	width: 100%; /* Set a width for the container (adjust as needed) */
}


.input-design{
	border:none;
    box-shadow: none !important;
	border-radius:0px;
	border-bottom:1px solid black;
	background:transparent !important;
	&:focus{
	 outline: none;
        box-shadow: none !important;
        border-bottom:1px solid black;
	}
}
.btn-outline-black
{
border: 1px solid black;
&:hover{
color:white;
background: black;
}
}
</style>
</head>
<body>
	<!-- NAvigation bar -->
	<nav
		class="navbar navbar-expand-lg navbar-dark bg-body-tertiary primary-background text-color">
		<div class="container-fluid">
			<a class="navbar-brand" href="index.jsp"><span class="fa fa-code"></span>TechTalk</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="index.jsp" onclick="makeActive(this)"> <span
							class="fa fa-home"></span>Home
					</a></li>
					<li class="nav-item">
					<a class="nav-link"
						aria-current="page" href="profile.jsp" onclick="makeActive(this)">
							<span class="fa fa-code-fork"></span>All posts
					</a></li>
					<li class="nav-item">
					<a class="nav-link " aria-current="page"
						href="contact.jsp" onclick="makeActive(this)"> <span
							class="fa fa-comments-o"></span>Contact
					</a></li>
					<%if(user!=null){
						%>
						<li class="nav-item"><a class="nav-link " href="#"
						data-bs-toggle="modal" data-bs-target="#add-post-modal"
						onclick="makeActive(this)"> <span class="fa fa-edit"></span>Do
							post
					</a></li>

					<%} %>
					
				</ul>
				<%
				if (user == null) {
				%>
				<a onclick="makeActive(this)" class="nav-link text-white mx-2"
					aria-current="page" href="login.jsp"> <span class="fa fa-key  "></span>Login
				</a> <a onclick="makeActive(this)" class="nav-link text-white mx-2"
					aria-current="page" href="registerPage.jsp"> <span
					class="	fa fa-user-plus"></span>SignUp
				</a>
				<%
				} else {
				%>
				<%
				String userName = user.getName();
				int indx = userName.indexOf(" ");

				char chr = userName.charAt(0);
				chr = Character.toUpperCase(chr);
				if (indx > 0)
					userName = chr + userName.substring(1, indx);
				else
					userName = chr + userName.trim().substring(1, userName.length());
				%>


				<ul class="navbar-nav mr-right">
					<li class="nav-item">
						<div class="container d-flex">
							<div class="container"
								style="height: 3rem; width: 3rem; border-radius: 4rem; 
                                background-image: url('profile-pic?filename=<%=user.getImage()%>');
                                 background-size: cover; background-position: center; 
                                 background-repeat: no-repeat;">
							</div>

							<a class="nav-link" data-bs-toggle="modal"
								data-bs-target="#profile-modal" aria-current="page" href="#!"
								onclick="makeActive(this)"> Welcome back, <%=userName%></a>
						</div>
					</li>
					<li class="nav-item"><a class="nav-link " aria-current="page"
						href="LogoutServlet" onclick="makeActive(this)"> <span
							class="fa fa-power-off"></span> Logout
					</a></li>
				</ul>
				<%
				}
				%>
			</div>
		</div>
	</nav>
	<!-- Navigation bar ends here  -->
	<div class="container" style="">
	<div class="container text-center mt-4">
	<h4 >Post your query here</h4>
	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla.</p>
	</div>
		<div class="row" style="">
			<div class="container mt-4" >
				<div class="container mx-auto p-5"
					style="width: 40%; background: #0000001c; border-radius: 10px;">
					<form>
						<div class="mb-3">
							<label for="exampleInputName1" class="form-label">Name
								</label> 
								<input  type="text" class="form-control input-design"
								id="exampleInputName1" aria-describedby="emailHelp" >

						</div>
						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Email
								address</label> 
								<input type="email" class="form-control input-design"
								id="exampleInputEmail1" aria-describedby="emailHelp">
							<div id="emailHelp" class="form-text">We'll never share
								your email with anyone else.</div>
						</div>
						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label ">Query</label>
							<textarea class="form-control input-design" rows="" cols=""></textarea>
						</div>
						<div class="container text-center">
							<button type="submit" class="btn btn-outline-black">Submit</button>
						</div>

					</form>
				</div>
			</div>
		</div>
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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript" src="js/index.js"></script>


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

	<script>
function makeActive(element){
	$(".nav-link").removeClass("active");
	$(element).addClass("active");
}
</script>
</body>
</html>