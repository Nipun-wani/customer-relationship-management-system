package com.nipun.databaseconnec;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AssignSman
 */
public class AssignSman extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AssignSman() {
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
			int sid=Integer.parseInt(request.getParameter("sid"));
			int cid=Integer.parseInt(request.getParameter("cid"));
			

			Connection con=ConnectDB.dbcon();
			
			PreparedStatement ps=con.prepareStatement("update complaints set smanid=? where id=?");
			ps.setInt(1, sid);
			ps.setInt(2, cid);
			
			int i=ps.executeUpdate();
			if(i>0)
			{
				response.sendRedirect("viewUnsolvedComplaints.jsp");
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
