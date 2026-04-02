package com.nipun.databaseconnec;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectDB {
	public static Connection con=null;
	public static Connection dbcon()
	{
		try
		{
			if(con==null)
			{
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/crm_for_isp","root","");
				System.out.println("Connection Estabilish"+con);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return con;
	}

}
