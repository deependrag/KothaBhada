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
 * Servlet implementation class InsertDefaultPaymentAmount
 */
@WebServlet("/InsertDefaultPaymentAmount")
public class InsertDefaultPaymentAmount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertDefaultPaymentAmount() {
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
		String id = request.getSession().getAttribute("userid").toString();
		PrintWriter out = response.getWriter();
		int rent = (Integer.parseInt(request.getParameter("rent")));
		int water = (Integer.parseInt(request.getParameter("water")));
		int electricity = (Integer.parseInt(request.getParameter("electricity")));
		int waste = (Integer.parseInt(request.getParameter("waste")));
		int internet = (Integer.parseInt(request.getParameter("internet")));

		try {
			Connection con = null;
			con = ConnectionManager.getConnection();
			Statement st = con.createStatement();
			PreparedStatement pre1 = con.prepareStatement("select * from defaultpayment where ClientId=?");

			pre1.setString(1, id);
			ResultSet rs1 = pre1.executeQuery();
			if (rs1.next()) {
				
				//If user already exist then its value will update with new value inserted on box.
				Connection cn = null;
				try {

					cn = ConnectionManager.getConnection();
					try {

						String query = "update defaultpayment set Rent='" + rent + "', Water='" + water
								+ "',Electricity='" + electricity + "', Waste='" + waste + "', Internet='" + internet
								+ "'  where ClientId='" + id + "'";
						Statement stat = cn.createStatement();
						stat.executeUpdate(query);
						response.sendRedirect("./ViewInfo.jsp");
					} catch (Exception e) {
						out.println("Error: Submission Failed!!\n" + e.getMessage());
					}

				} catch (Exception e) {
					out.println("Connection Failed: \n" + e.getMessage());
				}

			} else {
				//If user doesnot exist then its new value will be inserted into database.
				String query = "insert into defaultpayment(Rent,Water,Electricity,Waste,Internet,ClientId) values('" + rent
						+ "','" + water + "','" + electricity + "','" + waste + "','" + internet + "','" + id + "')";
				Connection cn = null;
				try {

					cn = ConnectionManager.getConnection();
					try {
						Statement stat = cn.createStatement();
						stat.executeUpdate(query);
						response.sendRedirect("./ViewInfo.jsp");
					} catch (Exception e) {
						out.println("Error: Submission Failed!!\n" + e.getMessage());
					}

				} catch (Exception e) {
					out.println("Connection Failed: \n" + e.getMessage());
				}
				
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
