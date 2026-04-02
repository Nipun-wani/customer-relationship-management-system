package com.nipun.databaseconnec;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddSman
 */
public class AddSman extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSman() {
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
			int id=0;
			String name=request.getParameter("name");
			String design=request.getParameter("design");
			String depart=request.getParameter("depart");
			String pincode=request.getParameter("pincode");
			String contact=request.getParameter("contact");
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			
			Connection con=ConnectDB.dbcon();
			
			PreparedStatement ps=con.prepareStatement("insert into service_man values(?,?,?,?,?,?,?,?)");
			ps.setInt(1,id);
			ps.setString(2,name);
			ps.setString(3,design);
			ps.setString(4,depart);
			ps.setString(5,pincode);
			ps.setString(6,contact);
			ps.setString(7,email);
			ps.setString(8,password);
			
			int i=ps.executeUpdate();
			
			if(i>0)
			{
				System.out.println("added");
				response.sendRedirect("adminFunction.html");
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
