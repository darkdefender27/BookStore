<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
	<!-- Button trigger modal -->
	<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" onclick="getCartProducts()">View Cart</button>
		
		<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
		  	<div class="modal-content">
		      	<div class="modal-header">
		        	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        	<h4 class="modal-title" id="myModalLabel">Shopping Cart</h4>
		      	</div>
		   	<div class="modal-body">
		   		<table class="table table-hover">
		   			<thead>
		   				<tr>
		   				<th>Product 1</th>
  						<th>Price</th>
		   			</tr>
		   			</thead>
		   			<tbody id="cart-body">
		   				
		   			</tbody>
  					
				</table>
		   		
		   	</div>
		      	<div class="modal-footer">
		        	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        	<button type="button" class="btn btn-primary">Checkout</button>
		      	</div>
		  	</div>
		</div>
	</div>
	<div id="tmp"></div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/cart.js"></script>
</html>