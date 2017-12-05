package com.kothabhada;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Connection.ConnectionManager;
import com.kothabhada.DefaultPaymentDto;

/**
 * Servlet implementation class DefaultPaymentAmount
 */
@WebServlet("/DefaultPaymentAmount")
public class ViewDefaultPaymentAmount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ViewDefaultPaymentAmount() {
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
		try {
			Connection con = null;
			con = ConnectionManager.getConnection();
			Statement st = con.createStatement();
			PreparedStatement pre1 = con.prepareStatement("select * from defaultpayment where ClientId=?");

			pre1.setString(1, id);
			ResultSet rs1 = pre1.executeQuery();
			if(rs1.next()) {
				DefaultPaymentDto defaultpayment= new DefaultPaymentDto();
				defaultpayment.setRent(Integer.parseInt(rs1.getString("Rent")));
				defaultpayment.setWater(Integer.parseInt(rs1.getString("Water")));
				defaultpayment.setElectricity(Integer.parseInt(rs1.getString("Electricity")));
				defaultpayment.setWaste(Integer.parseInt(rs1.getString("Waste")));
				defaultpayment.setInternet(Integer.parseInt(rs1.getString("Internet")));
				request.getSession().setAttribute("view_default_payment", defaultpayment);
			}else {
				DefaultPaymentDto defaultpayment= new DefaultPaymentDto(0,0,0,0,0);
				request.getSession().setAttribute("view_default_payment", defaultpayment);
			}
			
			response.sendRedirect("./DefaultPaymentAmount.jsp");

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
