
function setCookie(cname,cvalue,exdays)
{
	var d = new Date();
	d.setTime(d.getTime()+(exdays*24*60*60*1000));
	var expires = "expires="+d.toGMTString();
	document.cookie = cname + "=" + cvalue + "; " + expires;
}

function getCookie(cname)
{
	var name = cname + "=";
	var ca = document.cookie.split(';');
	for(var i=0; i<ca.length; i++)
	{
		var c = ca[i].trim();
		if (c.indexOf(name)==0) return c.substring(name.length,c.length);
	}
	return "";
}
function getCartProducts()
{
	var row="";
	var cartProducts=getCookie("cartProduct");
	if(cartProducts!="")
	{
		cartProducts=cartProducts.substring(1,cartProducts.length-1);
		//document.getElementById("tmp").innerHTML=cartProducts;
		var products=cartProducts.split('|');
		products.pop();
		for (var i=0;i<products.length;i++)
		{
			var details=products[i].split(':');
			row=row+"<tr>" +
						"<td>" +details[1] +"</td>" +
						"<td>" +details[2] +"</td>" +
						"<td>" +details[3] +"</td>" +
						"<td><button class='close' type='button' onclick=\"removeCart(" + details[0]
						+")\">x</button></td> " +
					"</tr>";
		}
	}
	document.getElementById("cart-body").innerHTML=row;
}
//DONT USE addToProductCart
function addtoProductCart(Id,Name,Price)
{
	var cartProducts=getCookie("cartProduct");
	cartProducts=cartProducts + Id +":" + Name +":"  + Price+ "|";
	setCookie("cartProduct",cartProducts,10);
}

function removeCart(Id)
{
	var newList="";
	var cartProducts=getCookie("cartProduct");
	if(cartProducts!="")
	{
		cartProducts=cartProducts.substring(1,cartProducts.length-1);
		var products=cartProducts.split('|');
		products.pop();
		for (var i=0;i<products.length;i++)
		{
			var details=products[i].split(':');
			if(details[0]!=Id)
			{
				newList=newList+products[i]+"|";
			}
		}
	}
	//document.getElementById("tmp").innerHTML=newList;
	
	if(newList!="")
	{
		newList="\""+newList+"\"";
		setCookie("cartProduct",newList,10);
	}
	else setCookie("cartProduct",newList,0);
	getCartProducts();
}
