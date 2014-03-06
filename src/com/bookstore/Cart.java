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
		//System.out.println("called");
		String cartProducts="";
		String products[]=null;
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
		//System.out.println("Products"+cartProducts);
		//cartProducts =cartProducts+ Id +":" + Name +":"  + Price+ "|";
		String newList="";
		System.out.println("called="+cartProducts);
		if(!cartProducts.equals(""))
		{
			boolean added=false;
			products=cartProducts.split("[|]");
			for(int i=0;i<products.length;i++)
			{
				System.out.println("Products"+cartProducts);
				String[] details=products[i].split(":");
				if(Integer.parseInt(details[0])==Id)
				{
					newList=newList+details[0]+":" + details[1] +":"  + details[2]+ ":"+ 
							(Integer.parseInt(details[3])+1)+"|";
					added=true;
				}
				else
				{
					newList=newList+products[i]+"|";
				}
			}
			if(!added)
			{
				newList=newList+Id+ ":" +Name +":" + Price +":1|";
			}
		}
		else
		{
			newList=newList+Id+ ":" +Name +":" + Price +":1|";
			//System.out.println("First Added");
		}
		Cookie cartProductCookie = new Cookie("cartProduct",newList);
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

		//System.out.println(cartProducts);
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
