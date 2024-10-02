<%@ page import="com.tech.entities.*"%>
<%User user = (User)request.getSession().getAttribute("currentUser");  %>


<nav class="navbar navbar-expand-lg navbar-dark bg-body-tertiary primary-background text-color">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp"><span class="fa fa-code"></span>TechTalk</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a onclick="makeActive(this)" class="nav-link active" aria-current="page" href="index.jsp">
          <span class="fa fa-home"></span>Home</a>
        </li>
        <li class="nav-item">
          <a onclick="makeActive(this)" class="nav-link " aria-current="page" href="profile.jsp">
          <span class="fa fa-code-fork"></span>All posts</a>
        </li>
        <li class="nav-item">
          <a onclick="makeActive(this)" class="nav-link " aria-current="page" href="contact.jsp">
          <span class="fa fa-comments-o"></span>Contact</a>
        </li>
        <%if(user!=null){
        	%>
        	<li class="nav-item"><a class="nav-link " href="#"
						data-bs-toggle="modal" data-bs-target="#add-post-modal"
						onclick="makeActive(this)"> <span class="fa fa-edit"></span>Do
							post
					</a></li>
       <% } %>
      </ul>
       <% if(user!=null){
    	   
    	   
    	     String userName = user.getName();
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
      <% } else{
      %>
               <a onclick="makeActive(this)" class="nav-link text-white mx-2" aria-current="page" href="login.jsp">
         <span class="fa fa-key  "></span>Login</a>
       <a onclick="makeActive(this)" class="nav-link text-white mx-2" aria-current="page" href="registerPage.jsp">
          <span class="	fa fa-user-plus"></span>SignUp</a>
     <% }%>
      
     
    </div>
  </div>
</nav>