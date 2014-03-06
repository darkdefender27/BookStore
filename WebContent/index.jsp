<%@page import="com.bookstore.Cart,java.util.ArrayList"%>
<jsp:include page="header.jsp"></jsp:include>
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
	<div class="row col-md-2">
	</div>
</div>




<!-- Button for View Cart -->	
<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#cartModal" onclick="getCartProducts()">View Cart</button>
<jsp:include page="cart.jsp"></jsp:include>





</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</html>
