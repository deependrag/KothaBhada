package com.kothabhada;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Connection.ConnectionManager;

/**
 * Servlet implementation class GetUserData
 */
@WebServlet("/GetUserData")
public class GetUserData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetUserData() {
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
		try {
			ClientDto clientDto = new ClientDto();
			String id = request.getParameter("Id");
			Connection con = null;

			con = ConnectionManager.getConnection();
			Statement st = con.createStatement();
			PreparedStatement pre1 = con.prepareStatement("select * from client where ClientId=?");

			pre1.setString(1, id);
			ResultSet rs1 = pre1.executeQuery();
			while (rs1.next()) {
				clientDto.setCid(rs1.getString("ClientId"));
				clientDto.setName(rs1.getString("Name"));
				clientDto.setEmail(rs1.getString("Email"));
				clientDto.setPass(rs1.getString("Password"));
			}
		
			request.getSession().setAttribute("edit_user_details", clientDto);
			response.sendRedirect("./Edit.jsp");
			
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
