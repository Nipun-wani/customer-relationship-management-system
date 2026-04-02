package com.nipun.databaseconnec;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddComplaints
 */
public class AddComplaints extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddComplaints() {
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
			int cusid=Integer.parseInt(user.getId());
			int smanid=0;
			String title=request.getParameter("title");
			String detail=request.getParameter("detail");
			String contact=request.getParameter("contact");
			String address=request.getParameter("address");
			String date=request.getParameter("date");
			String time=request.getParameter("time");
			String status="Unsolved";
			int scode=(int)(Math.random()*9000)+1000;
			
			
			Connection con=ConnectDB.dbcon();
			
			PreparedStatement ps=con.prepareStatement("insert into complaints values(?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1,id);
			ps.setInt(2, cusid);
			ps.setInt(3,smanid);
			ps.setString(4,title);
			ps.setString(5,detail);
			ps.setString(6,contact);
			ps.setString(7,address);
			ps.setString(8,date);
			ps.setString(9,time);
			ps.setString(10,status);
			ps.setInt(11,scode);
			
			
			int i=ps.executeUpdate();
			
			if(i>0)
			{
				System.out.println("added");
				response.sendRedirect("customerFunction.html");
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
