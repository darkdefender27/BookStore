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
	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
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
				<ul class="navbar-right nav nav-tabs">
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
				<form class="navbar-form navbar-right" role="form" method="post" action="index.jsp">
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
				<%} %>
		 	</div><!-- /.navbar-collapse -->
		</div>
	
	</div><!--NAV-->
	<br/><br/><br/>
	<div class="container">
		<div class="row col-md-2"></div>
		<div class="row col-md-8">
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
			  		<!-- Indicators -->
				  	<ol class="carousel-indicators">
				    	<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
				    	<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				    	<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				  	</ol>
			
				  	<!-- Wrapper for slides -->
				  	<div class="carousel-inner" align="center">
				    	<div class="item active">
				      	<img src="./images/OnlyTimeWillTell.jpg" alt="Hello">
				      	<div class="carousel-caption">
				        
				     	</div>
				  	</div>
				  	
				  	<div class="item" align="center">
				      	<img src="./images/OnlyTimeWillTell.jpg" alt="Hello">
				      	<div class="carousel-caption">
				        	Helalksfhni hahskjdh haks hajskdh
				      	</div>
				  	</div>
				  	<div class="item " align="center">
				     	<img src="./images/OnlyTimeWillTell.jpg" alt="Hello">
				      	<div class="carousel-caption">
				        
				      	</div>
		    		</div>
	  		</div>
	  	</div>
	
	  <!-- Controls -->
	  <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
	    <span class="glyphicon glyphicon-chevron-left"></span>
	  </a>
	  <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
	    <span class="glyphicon glyphicon-chevron-right"></span>
	  </a>
	</div>
	<div class="row col-md-2"></div>
</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</html>
