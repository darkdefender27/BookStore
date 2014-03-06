<html lang="en">
<%@page import="com.bookstore.Login" errorPage="Error.jsp"%>
<%
			String password=request.getParameter("password");
			String emailId=request.getParameter("emailId");
			Boolean status=false;
			Cookie cookie = null;
			Cookie[] cookies = null;
			cookies=request.getCookies();
			if( cookies != null ){
			      for (int i = 0; i < cookies.length; i++){
			         cookie = cookies[i];
			         if(cookie.getName().equals("emailId"))
			         {
			        	emailId=cookie.getValue();
			        	status=true;
			        	String signOutQuery=request.getParameter("q");
			 			if(signOutQuery!=null && signOutQuery.equals("signOut"))
			 			{
			 				Cookie emailId_cookie = new Cookie("emailId",emailId);
			 				emailId_cookie.setMaxAge(0); 
			 				response.addCookie(emailId_cookie);
			 				status=false;
			 			}
			        	break;
			         }
			        	 
			      }
			  }
%>
<head>
    <!-- Meta, title, CSS, favicons, etc. -->
	<meta charset="utf-8">
	<title>
	    Book Store
	</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/bootstrap.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-default navbar-inverse" role="navigation">
	  <div class="container-fluid">
	    <!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="#">Agewal Book Store</a>
	    </div>
	
	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      		<%
				if(!status)
				{
					Login login=new Login();
					status=login.authenticate(emailId, password);
					if(status)
					{
						Cookie emailId_cookie = new Cookie("emailId",emailId);
						emailId_cookie.setMaxAge(60*60*24); 
						response.addCookie(emailId_cookie);
					}
				}
				if(status)
				{
					
				%>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
	          			<a href="#" class="dropdown-toggle" data-toggle="dropdown"><%out.print(emailId); %><b class="caret"></b></a>
			          	<ul class="dropdown-menu">
			           	<li><a href="#">Update Profile</a></li>
			            <li class="divider"></li>
			            <li><a href="index.jsp?q=signOut">Sign Out</a></li>
			          </ul>
			        </li>
		        </ul>
				<% 
				}
				else
				{%>
				<ul class="nav navbar-nav navbar-right">
					<li><a data-toggle="modal" data-target="#myModal" onclick="getCartProducts()">Login</a></li>
					<li><a href="#">SignUp</a></li>
				</ul>
				<%} %>
				<form class="navbar-form navbar-right" role="search">
    					<div class="input-group">
      						<input type="text" class="form-control">
      						<div class="input-group-btn">
	        					<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">Search <span class="caret"></span></button>
						        <ul class="dropdown-menu pull-right">
						          <li><a href="#">Action</a></li>
						          <li><a href="#">Another action</a></li>
						          <li><a href="#">Something else here</a></li>
						          <li class="divider"></li>
						          <li><a href="#">Separated link</a></li>
						        </ul>
					      </div><!-- /btn-group -->
					    </div><!-- /input-group -->
			    </form>
	      		
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	
<%
	if(!status)
  {%>
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
		  	<div class="modal-content">
		      	<div class="modal-header">
		        	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        	<h4 class="modal-title" id="myModalLabel">Login</h4>
		      	</div>
		   	<div class="modal-body">
		   			
					<form role="form" method="post" action="index.jsp">
						<div class="form-group">
							<label class="sr-only" for="emailID">Email address</label>
							<input type="email" class="form-control" name="emailId" id="emailId" placeholder="Enter email">
						</div>
						<div class="form-group">
							<label class="sr-only" for="password">Password</label>
							<input type="password" class="form-control" name="password" id="password" placeholder="Password">
						</div>
						<button type="submit" class="btn btn-default">Sign in</button>
					</form>
		   		
		   	</div>
		      	<div class="modal-footer">
		        	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        </div>
		  	</div>
		</div>
	</div>
<% }%>
	