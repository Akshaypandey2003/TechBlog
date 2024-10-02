<%@page import="java.lang.invoke.CallSite"%>
<%@page import="com.tech.utility.ConnectionProvider"%>
<%@ page import="com.tech.dao.*"%>
<%@ page import="com.tech.entities.*"%>
<%@ page import="java.util.*"%>


<div class="row">
 
   <% for(int i = 0; i<4; i++){
	   %>
	    <div class="col-md-6 mt-2">
		 <div class="card p-2" >
			<div class="container text-center"
				style=" height: 30vh; overflow: hidden;">
				<img  id="shimmer-img"
					style="width: 100%; height: 100%; object-fit: fill; border-radius: 5px; background: #8080808a; border-radius: 10px;">
			</div>
			<div class="card-body">
				<h4 id="shimmer-heading" class="no-wrap" style="background:#8080808a; height: 1rem; border-radius: 5px;"></h4>
				<br>
				<p id="shimmer-para" style="background: #8080808a; height: 1rem;width:50%; border-radius: 5px;"></p>
			</div>
			<div id="shimmer-footer" class="card-footer text-center" style="background: black; border-radius: 5px; background: #8080808a;">
				<a id="shimmer-btn" href="" class="btn" style="background: #8080808a; width: 20%;"></a> 
			</div>
		</div>

	  </div>
	   
  <%  } %>
	
	
</div>
