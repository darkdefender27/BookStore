package com.bookstore;

import java.sql.*;

public class SQLConnection {
	private static Connection conn=null;
	private SQLConnection()
	{
		
	}
	public static Connection getConnection()
	{
		if(conn==null)
		{
			try {
				Class.forName("com.mysql.jdbc.Driver");
				//DriverManager.registerDriver(new com.mysql.jdbc.Driver());
				conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/BookStore","root", "conboot");
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return conn;
		}
		
		return conn;
	}
}
