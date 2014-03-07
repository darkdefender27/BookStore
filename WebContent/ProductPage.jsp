<%@page import="com.bookstore.Cart,java.util.ArrayList"%>
<jsp:include page="header.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row container-fluid col-md-10 col-md-offset-1">
			<div class="container-fluid col-md-4 bg-info" style="height:400px;border:thick solid #FFFFFF;" align = "center">
				<div class="row"  style="padding:10px"><img alt="Product Image" src="..." height="300px" ></div>
				<div class="row">
					<jsp:include page="cart.jsp"></jsp:include>
					<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#cartModal" onclick="addProductToCart(3,'Pr_3',12.9)">Add to Cart</button>
				</div>
				<p class="text-success">Delivery will be provided in 3-5  working days*</p>
			</div>
			<div class="col-md-8 bg-info" style="height:400px;border:thick solid #FFFFFF;">
				<h2> Product name</h2>
				<hr color="#0D0D0D">
				<h3> Description:</h3>
				<pre>	This is where we will display the description of the product......</pre>
				
			</div>
		</div>
	</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</html>
