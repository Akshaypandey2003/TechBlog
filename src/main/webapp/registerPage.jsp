<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Here</title>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
rel="stylesheet" 
integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-
awesome.min.css">

<style>
.banner-background{
 clip-path: polygon(20% 0%, 80% 0%, 100% 0, 100% 92%, 65% 99%, 24% 94%, 0 100%, 0 0);
}
.success{
color: green;
}
.error{
color: red;
}
span{
margin: 6px;
}
</style>
</head>
<body>
<!-- NAvBar -->
 <%@include file="NavBar.jsp" %> 
  <% %>
<!-- Registration form -->
<main class = "d-flex align-items-center primary-background " style="height:91.4vh; padding-bottom: 60px;">
  <div class="container">
     <div class="col-md-4 offset-md-4 ">

        <div class="card ">
           <div class="card-header primary-background text-center text-white">
              
              <span class="fa fa-user-plus fa-2x"></span>
              <h5>Register Here</h5>
           </div>
           <div class="card-body" style="background: #5d5454a8;">
           
             <form id = "reg-form" action="RegisterServlet" method="post">
                 <div class="mb-3">
                   <label for="user_name" class="form-label">User Name</label>
                   <input type="text" name="name-input" class="form-control" id="input-user-name" aria-describedby="emailHelp" placeholder="Enter Name" pattern="^[A-Za-z\s]{2,30}$" required>
                  </div>
                 <div class="mb-3">
                   <label for="exampleInputEmail1" class="form-label">Email address</label>
                   <input type="email" name="email-input" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Email" required>
                 <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                  </div>
                  
                  
                <div class="mb-3">
                  <label for="exampleInputGender" class="form-label">Select Gender</label>
                  <br>
                  <input type="radio"   value="Male"  name="gender-input">Male
                  <input type="radio"  value="Female" name="gender-input">Female
                  
                </div>
                
                
                <div class="mb-3">
                  <label for="exampleInputPassword1" class="form-label">Password</label>
                  <input type="password" name="password-input" class="form-control" id="exampleInputPassword1" placeholder="Enter Password" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$" required>
                </div>
                
               <div class="mb-3 form-check">
                 <input type ="checkbox" name="checkBox-input" class="form-check-input" id="exampleCheck1" required>
                 <label class="form-check-label" for="exampleCheck1">Agree Terms and Conditions</label>
                 <p id="checkbox-staus"></p>
               </div>
               <div class="container text-center" id="loader" style="display: none;">
                <span class="	fa fa-refresh fa-spin fa-2x"></span>
                <h5>Please wait...</h5>
               </div>
              
               <button type="submit" id = "submit-btn" class="btn btn-primary">Submit</button>
                <p id="form-staus" style="display: none; font-size: smaller;" ></p>
             </form>
             
             
           </div>
        </div>
     </div>
   </div>
</main>



 
 <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" 
 crossorigin="anonymous"></script>
 <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" 
 crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" 
crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>

$(document).ready(function(){
	
	$('#reg-form').on('submit',function(event){
		
		event.preventDefault();
		let form = new FormData(this);
		
		
		$('#submit-btn').hide();
		
		$('#form-staus').show();
		$('#loader').show();
		
		// send form data to register servlet
		$.ajax({
			url:"RegisterServlet",
			type:'POST',
			data:form,
			success:function(data,textStatus,jqXHR){
				 if(data=="done")
				{
					$('#submit-btn').toggle();
					$('#loader').toggle();
					swal("Registered Successfully ", "you are just one step away please login and enjoy...")
					.then((value)=>{
						window.location="login.jsp";
					})
				}
				 else{
					 $('#submit-btn').toggle();
						$('#loader').toggle();
						swal("User already exists!! ", "you are just one step away please login and enjoy...")
						.then((value)=>{
							window.location="login.jsp";
						})
				 }
			},
			error: function(jqXHR,textStatus,errorThrown){
				$('#submit-btn').toggle();
				$('#loader').toggle();
				$('#form-staus').addClass('error');
				$('#form-staus').text("Something went wrong!");
				setInterval(() => {
				
					$('#form-staus').hide();
				}, 2000);
			},
			processData:false,
			contentType:false,
		});
		
		
	});
});
</script>

<script >
function makeActive(element){
	$(".nav-link").removeClass("active");
	$(element).addClass("active");
}
</script>
</body>
</html>