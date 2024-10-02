

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "com.tech.entities.*" %>
 <%Message msg = (Message)request.getSession().getAttribute("message");%>
 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login page</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
rel="stylesheet" 
integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-
awesome.min.css">

<style>
.banner-background{
 clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 99%, 66% 90%, 31% 100%, 0 91%, 0 0);
}
span{
margin: 6px;
}

</style>
</head>
<body>
 <!-- NAvbar -->
 <%@include file="NavBar.jsp" %> 
 
 <!--  Login form -->
 <main class="d-flex align-items-center primary-background " style="height:91.4vh;">
 <div class="container">
     <div class="row">
        <div class="col-md-4 offset-md-4">
         <div class="card  ">
             <div class="card-header primary-background text-center text-white">
                 <span class="fa fa-key fa-spin "></span>
                <h5 >Login Here</h5>
             </div>
             <% 
             if(msg!=null){
            	 %>
            	 <div class="alert <%=msg.getcssType() %>" role="alert">
                    <%=msg.getContent() %>
                 </div>
             <% request.getSession().removeAttribute("message"); }%>
             
             <div class="card-body" style="background: #5d5454a8;">
               <form action="LoginServlet" method="post">
                 <div class="mb-3">
                   <label for="exampleInputEmail1" class="form-label">Email address</label>
                   <input type="email" name="email-input" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"required>
                 <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                  </div>
                <div class="mb-3">
                  <label for="exampleInputPassword1" class="form-label">Password</label>
                  <input type="password" name="password-input" class="form-control" id="exampleInputPassword1" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$" required>
                </div>
               
               <div class="container text-center">
                <button type="submit" class="btn btn-primary">Submit</button>
               </div>
              
              </form>
            </div>
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
<script >
function makeActive(element){
	$(".nav-link").removeClass("active");
	$(element).addClass("active");
}
</script>
</body>
</html>