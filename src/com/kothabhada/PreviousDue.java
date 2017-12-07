/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kothabhada;

import Connection.ConnectionManager;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ranjan
 */
@WebServlet(name = "PreviousDue", urlPatterns = {"/PreviousDue"})
public class PreviousDue extends HttpServlet {

   private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PreviousDue() {
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
		
		Connection cn = null;
		try {
			cn = ConnectionManager.getConnection();
			PreparedStatement usr = cn.prepareStatement("SELECT * FROM paymenthistory WHERE ClientId = '1' AND RefNo = (SELECT MAX(RefNo) FROM paymenthistory WHERE ClientId = '1')");
			ResultSet rs1 = usr.executeQuery();
			if (rs1.next()) {                           		
                            
                            request.getSession().setAttribute("prev_due", rs1.getString("Due"));
			response.sendRedirect("./Calculation.jsp");
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
