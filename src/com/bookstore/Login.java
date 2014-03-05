package com.bookstore;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class Login {
	
	public boolean authenticate(String emailId,String password)
	{
		Boolean status=false;
		Connection conn=SQLConnection.getConnection();
		if(conn !=null)
		{
			try {
				Statement stmt=conn.createStatement();
				System.out.println("Statement");
				
				ResultSet resultSet = stmt.executeQuery("select password from Login where email_id='"+emailId+"'");
				while(resultSet.next())
				{
					if(resultSet.getString(1).equals(password))
					{
						status=true;
						System.out.println("Logged in");
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return status;
	}
}
