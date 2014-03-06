function ini()
{
	addtoProductCart(1,"Product 1","Price 1");
	addtoProductCart(2,"Product 2","Price 2");
	addtoProductCart(3,"Product 3","Price 3");
};
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
		var products=cartProducts.split('|');
		products.pop();
		for (var i=0;i<products.length;i++)
		{
			var details=products[i].split(':');
			row=row+"<tr>" +
						"<td>" +details[1] +"</td>" +
						"<td>" +details[2] +"</td>" +
					"</tr>";
		}
	}
	document.getElementById("cart-body").innerHTML=row;
}
function addtoProductCart(Id,Name,Price)
{
	var cartProducts=getCookie("cartProduct");
	cartProducts=cartProducts + Id +":" + Name +":"  + Price+ "|";
	setCookie("cartProduct",cartProducts,10);
}
