package com.nipun.databaseconnec;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginSman
 */
public class LoginSman extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginSman() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		try
		{
			String id=request.getParameter("id");
			String password=request.getParameter("password");
			
			Connection con=ConnectDB.dbcon();
			
			PreparedStatement ps=con.prepareStatement("select * from service_man where id=? and password=?");
			ps.setString(1, id);
			ps.setString(2, password);
			
			ResultSet rs=ps.executeQuery();
			
			if(rs.next())
			{
				user.setId(id);
				System.out.println("Login");
				response.sendRedirect("smanFunction.html");
			}
			else
			{
				response.sendRedirect("error.html");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
