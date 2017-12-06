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

/**
 *
 * @author Ranjan
 */
@WebServlet(name = "GetDefaultPaymentAmount", urlPatterns = {"/GetDefaultPaymentAmount"})
public class GetDefaultPaymentAmount extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetDefaultPaymentAmount() {
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
			DefaultPaymentDto defaultpaymentDto = new DefaultPaymentDto();
			String id = request.getSession().getAttribute("userid").toString();
			Connection con = null;

			con = ConnectionManager.getConnection();
			Statement st = con.createStatement();
			PreparedStatement pre1 = con.prepareStatement("select * from defaultpayment where ClientId=?");

			pre1.setString(1, id);
			ResultSet rs1 = pre1.executeQuery();
			while (rs1.next()) {
				defaultpaymentDto.setRent(rs1.getInt("Rent"));
				defaultpaymentDto.setWater(rs1.getInt("Water"));
				defaultpaymentDto.setElectricity(rs1.getInt("Electricity"));
				defaultpaymentDto.setWaste(rs1.getInt("Waste"));
                                defaultpaymentDto.setInternet(rs1.getInt("Internet"));
			}
		
			request.getSession().setAttribute("default_values", defaultpaymentDto);
			response.sendRedirect("./Calculation.jsp");
			
		} catch (Exception e) {
			out.println("Connection Failed: \n" + e.getMessage());
		}
	}
protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
