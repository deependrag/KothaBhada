package com.kothabhada;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Connection.ConnectionManager;

public class DisplayClient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayClient() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html");
		Connection cn = null;
		try {

			cn = ConnectionManager.getConnection();
			String sql = "select * from client";
			Statement stat = cn.createStatement();
			ResultSet rs = stat.executeQuery(sql);
			List<ClientDto> clients = new ArrayList<ClientDto>();
			while (rs.next()) {
				ClientDto client = new ClientDto();
				client.setCid(rs.getString("ClientId"));
				client.setFname(rs.getString("FirstName"));
				client.setMname(rs.getString("MiddleName"));
				client.setLname(rs.getString("LastName"));
				client.setEmail(rs.getString("Email"));
				client.setPass(rs.getString("Password"));
				clients.add(client);
			}

			request.setAttribute("cu", clients);
			request.getRequestDispatcher("./Dashboard.jsp").forward(request, response);
			

		} catch (Exception e) {
			System.out.println("Exception!!!" + e);
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
