package com.bookstore;

import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Cart {
	private static Cart cart=null;
	private Cart()
	{
		
	}
	public static Cart getCart()
	{
		if(cart==null)
		{
			cart=new Cart();
		}
		return cart;
	}
	public void addToCart(HttpServletRequest request,HttpServletResponse response,Integer Id,String Name,Float Price)
	{
		String cartProducts="";
		Cookie cookie = null;
		Cookie[] cookies = null;
		cookies=request.getCookies();
		if( cookies != null ){
		      for (int i = 0; i < cookies.length; i++){
		         cookie = cookies[i];
		         if(cookie.getName().equals("cartProduct"))
		         {
		        	cartProducts=cookie.getValue();
		        	break;
		         }
		        	 
		      }
		  }
		System.out.println("Products"+cartProducts);
		cartProducts =cartProducts+ Id +":" + Name +":"  + Price+ "|";
		Cookie cartProductCookie = new Cookie("cartProduct",cartProducts);
		cartProductCookie.setMaxAge(10*24*60*60*1000); 
		response.addCookie(cartProductCookie);
	}
	public ArrayList<Integer> getProductList(HttpServletRequest request)
	{
		ArrayList<Integer> productList=new ArrayList<Integer>();
		String products[]=null;
		String cartProducts="";
		Cookie cookie = null;
		Cookie[] cookies = null;
		cookies=request.getCookies();
		if( cookies != null ){
		      for (int i = 0; i < cookies.length; i++){
		         cookie = cookies[i];
		         if(cookie.getName().equals("cartProduct"))
		         {
		        	cartProducts=cookie.getValue();
		        	break;
		         }
		        	 
		      }
		  }

		System.out.println(cartProducts);
		if(!cartProducts.equals(""))
		{
			products=cartProducts.split("[|]");
			for(int i=0;i<products.length;i++)
			{
				String[] details=products[i].split(":");
				productList.add(Integer.parseInt(details[0]));
			}
		}
		return productList;
	}
}
