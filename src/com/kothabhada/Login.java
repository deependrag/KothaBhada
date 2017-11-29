package com.kothabhada;

import Connection.ConnectionManager;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;


/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		Connection cn=null;
		PreparedStatement stment = null;
		try{
			cn=ConnectionManager.getConnection();
                        String sql1="select Email,Password from client where Email='"+email+"' and Password='"+password+"'";
			//String sql2="select Username,Password from admin where Username='"+username+"' and Password='"+password+"'";
			Statement stat1=cn.createStatement();
			//Statement stat2=cn.createStatement();
			ResultSet rs1=stat1.executeQuery(sql1);
		
			//ResultSet rs1=stment.executeQuery(sql1);
			if(rs1.next()) {
				request.getSession().setAttribute("loggedInUser", email);
				RequestDispatcher rd=request.getRequestDispatcher("./DisplayClient");
				rd.include(request,response);
				
			}else {
				out.println("Login failed");
			}
			
			
			//ResultSet rs2=stat2.executeQuery(sql2);
			
			/*if(rs1.next()){
					request.getSession().setAttribute("loggedInUser", username);
					RequestDispatcher rd=request.getRequestDispatcher("/test.jsp");
					rd.include(request,response);
				}
			else if(rs2.next()){
					request.getSession().setAttribute("loggedInUser", username);
					RequestDispatcher rd=request.getRequestDispatcher("/display.jsp");
					rd.include(request,response);
				}
			else if(!rs1.next()&&!rs2.next()){
					request.setAttribute("alertMsg", "Username or password incorrect");
					RequestDispatcher rd=request.getRequestDispatcher("/Failure.jsp");
					rd.include(request,response);
			}*/
				}catch(Exception e){
					
					out.println("Connection Failed: \n" + e.getMessage());
				}

		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
