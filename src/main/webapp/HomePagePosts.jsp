<%@page import="java.lang.invoke.CallSite"%>
<%@page import="com.tech.utility.ConnectionProvider"%>
<%@ page import="com.tech.dao.*"%>
<%@ page import="com.tech.entities.*"%>
<%@ page import="java.util.*"%>


<div class="row">
	<% 
	User user = (User)request.getSession().getAttribute("currentUser"); 
    Thread.sleep(1000);
    PostDao dao = new PostDao(ConnectionProvider.getConnection());


     int cId = Integer.parseInt(request.getParameter("cId"));
      ArrayList<Post>list;
      if(cId==0)
     {
	    list =  dao.getAllPosts();
      }
else{
	list =  dao.getAPostsByCategoryId(cId);
}

if(list.size()==0)
{ %>

	<div class="container text-center">
		<h3 class="">No post in this category!</h3>
		<h4>Start writting post</h4>
		<a class="btn btn-outline-primary " href="#" data-bs-toggle="modal"
			data-bs-target="#add-post-modal"> <span class="fa fa-edit"></span>Do
			post
		</a>
	</div>
	<%}

for(Post p : list)
{
	String title =  p.getPostTitleString();
	String content = p.getPostContentString();
	%>
	<div class="col-md-3">
		<div class="card p-2" >
			<div class="container text-center"
				style=" height: 30vh; overflow: hidden;">
				<img src="post-pic?filename=<%= p.getPostPicString() %>" alt="..."
					style="width: 100%; height: 100%; object-fit: fill; border-radius: 5px;">
			</div>
			<div class="card-body">
			
			<h5 class="no-wrap"><%=title %></h5>
				<% if(content.length()>100)
	    	  {
	    	   String compressedContent = content.substring(0,100)+"....";
	    	  %>

				<%= compressedContent %>
				<%  } else{ %>
				<%= content %>
				<%  }  %>
				<br>
				<!--   <div class="container text-center" style=" width: 40vw; height: 50vh; overflow: hidden;">
            <img src="post-pic?filename=<%= p.getPostPicString() %>" alt="..." style="width: 100%; height: 100%; object-fit: contain;">
         </div>
             <br> 
	      <pre class="text-white" style="background: black;"p.getPostCode()e() %></pre>
	      -->
			</div>
               <% LikeDao likeDao = new LikeDao(ConnectionProvider.getConnection()); 
		     	int likeCount = likeDao.countLikeOnPost(p.getPostId());
			  %>
			<div class="card-footer text-center" style="background: black; border-radius: 5px;">
				<a href="readPostPage.jsp?postId=<%=p.getPostId() %>" class="btn btn-outline-primary btn-sm"> Read
					More... </a> 
			</div>
		</div>

	</div>
	<%
	}
	%>
</div>