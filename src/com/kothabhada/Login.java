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
import javax.servlet.http.HttpSession;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		Connection cn = null;
		try {
			cn = ConnectionManager.getConnection();
			PreparedStatement usr = cn.prepareStatement("select Email,Password,ClientId from client where Email=? and Password=?");
			PreparedStatement adm = cn.prepareStatement("select Email,Password from admin where Email=? and Password=?");
				
			usr.setString(1, email);
			usr.setString(2, password);
			
			adm.setString(1, email);
			adm.setString(2, password);
			
			ResultSet rs1 = usr.executeQuery();
			ResultSet rs2 = adm.executeQuery();
			
			if (rs2.next()) {
				HttpSession session = request.getSession();
				session.setAttribute("user_role", "admin");
				response.sendRedirect("./DisplayClient");

			}else if(rs1.next()) {
				/*HttpSession session = request.getSession();
				session.setAttribute("userid", rs1.getString("ClientId"));*/
				HttpSession session = request.getSession();
				session.setAttribute("user_role", "user");
				response.sendRedirect("./GetPaymentHistory?Id=" + rs1.getString("ClientId"));
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("alertMsg", "Email or password incorrect");
				response.sendRedirect("./index.jsp");
			}

		} catch (Exception e) {

			out.println("Connection Failed: \n" + e.getMessage());
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
