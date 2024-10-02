<%@page import="java.lang.classfile.instruction.ArrayLoadInstruction"%>
<%@page import="com.tech.utility.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.tech.entities.*"%>
<%@ page import="com.tech.dao.*"%>

<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>


<%
User user = (User) request.getSession().getAttribute("currentUser");
if (user==null) {
	System.out.println(user);
	response.sendRedirect("login.jsp");
	return;
}


//Real path to render image--->
ServletContext context = getServletContext();
String path = context.getRealPath("/") + "ProfilePics" + File.separator;

String img = path + user.getImage();

//Fetching the message attribute.........
Message msg = (Message) request.getSession().getAttribute("message");

// Fetching all the available categories...........>
PostDao p = new PostDao(ConnectionProvider.getConnection());
ArrayList<Category> list = p.getAllCategories();

%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>

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

.banner-background {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 99%, 66% 90%, 31% 100%, 0 91%, 0 0);
}

span {
	margin: 6px;
}

.scrollable-div::-webkit-scrollbar {
	display: none;
}

.card {
	background: #0000001c;
}

.category-list {
	background: #0000001c;
}

.category-list.active {
	background-color: black !important;
	/* Change the background color to black */
	color: white !important; /* Change the text color to white */
	border-color: black !important; /* Change the border color to black */
}

.category-list:hover {
	background-color: #0000008c !important;
	color: white;
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
/* Blinking effect on shimmer cards */
/* Keyframes for blinking animation */
@keyframes blink {
    0% {
        opacity: 1;
    }
    50% {
        opacity: 0.5;
    }
    100% {
        opacity: 1;
    }
}

/* Apply blinking animation to shimmer UI elements */
.card #shimmer-img, 
.card  #shimmer-heading, 
.card  #shimmer-para, 
.card-footer  #shimmer-btn{
    animation: blink 1.5s infinite;
}

</style>
</head>
<body>
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
					<li class="nav-item"><a class="nav-link " aria-current="page"
						href="index.jsp" onclick="makeActive(this)"> <span
							class="fa fa-home"></span>Home
					</a></li>
					<li class="nav-item dropdown">
				 <a class="nav-link active" aria-current="page"
						href="profile.jsp" onclick="makeActive(this)"> <span
							class="fa fa-code-fork"></span>All posts
					</a>
					</li>
					<li class="nav-item"><a class="nav-link " aria-current="page"
						href="contact.jsp" onclick="makeActive(this)"> <span
							class="fa fa-comments-o"></span>Contact
					</a></li>
					<li class="nav-item"><a class="nav-link " href="#"
						data-bs-toggle="modal" data-bs-target="#add-post-modal"
						onclick="makeActive(this)"> <span class="fa fa-edit"></span>Do
							post
					</a></li>
				</ul>
				<% String userName = user.getName();
				   int indx = userName.indexOf(" ");
				   
				   char chr = userName.charAt(0);
				   chr = Character.toUpperCase(chr);
				   if(indx>0)
				   userName = chr+userName.substring(1,indx);
				   else
					   userName = chr+userName.trim().substring(1,userName.length());
				%>
				<ul class="navbar-nav mr-right">
					<li class="nav-item">
						<div class="container d-flex">
					
							<div class="container"
								style="height: 3rem; width: 3rem; border-radius: 4rem; 
								background:white;
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
							class="fa fa-power-off"></span>Logout
					</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- NAv BAr end -->


	  <%
	if (msg != null) {
	%>
	<div id="edit-status" class="alert <%=msg.getcssType()%>" role="alert" style="position: absolute; z-index: 1;">
		<%=msg.getContent()%>
	</div>
	<%
	request.getSession().removeAttribute("message");
	}
	%>  

	<!-- Main body of the page -->
	<main>
		<div class="container-fluid">
			<div class="row mt-4">
				<!-- first column -->
				<div class="col-md-4 mt-2">
					<!-- categories -->
					<div class="list-group" style="background: #ebe4e45c;">
						<a href="#" onclick="getPosts(<%=0%>,this)"
							class="category-link list-group-item list-group-item-action active category-list"
							aria-current="true"> All Posts </a>
						<%
						for (Category cat : list) {
						%>
						<a href="#" onclick="getPosts(<%=cat.getCatId()%>,this)"
							class="category-link list-group-item list-group-item-action category-list"><%=cat.getCatNameString()%></a>
						<%
						}
						%>
					</div>
				</div>
				<!-- second column -->
				<div class="col-md-8 overflow-auto scrollable-div"
					style="max-height: 100vh;">
					<!-- Actual posts -->
					<div class="container text-center" id="loader">
						<%@include file="ShimmerCardsReadPostPage.jsp" %>
				<!--  	<i class="fa fa-refresh fa-spin fa-4x"></i>
						<h3 class=mt-3>Loading....</h3>  -->	
					</div>

					<div class="container-fluid" id="post-container">
						
					</div>
				</div>
			</div>
		</div>
	</main>
	<!--  End of main body of the page -->












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
	<!-- Load post js -->
	<script>

function getPosts(catId,temp){
	
	 $(".category-link").removeClass("active");
	
     $("#loader").show();
	 $('#post-container').hide(); 
	
	$.ajax({
		 url:"Posts.jsp",
		 data:{cId:catId},
		 success: function(data,textStatus,jqXHR){
			 
			
			 $('#post-container').show(); 
		     $("#loader").hide(); 
			 $('#post-container').html(data);
			 $(temp).addClass("active");
			 
		 },
         
	 })
}
 $(document).ready(function(){
	 
	 let categoryRef = $(".category-link")[0];
	 getPosts(0,categoryRef);
	
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