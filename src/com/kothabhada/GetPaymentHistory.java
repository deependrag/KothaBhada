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
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ranjan
 */
@WebServlet(name = "GetPaymentHistory", urlPatterns = {"/GetPaymentHistory"})
public class GetPaymentHistory extends HttpServlet {

    private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetPaymentHistory() {
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
			
			String id = request.getParameter("Id");
			Connection con = null;

			con = ConnectionManager.getConnection();
			Statement st = con.createStatement();
			PreparedStatement pre1 = con.prepareStatement("select * from paymenthistory where ClientId=?");

			pre1.setString(1, id);
			ResultSet rs1 = pre1.executeQuery();
                        List<PayHistoryDto> payhistoryDtos = new ArrayList<PayHistoryDto>();
			while (rs1.next()) {
                                PayHistoryDto payhistoryDto = new PayHistoryDto();
				payhistoryDto.setRefno(rs1.getString("RefNo"));
                                payhistoryDto.setDate(rs1.getString("Date"));
				payhistoryDto.setMonth(rs1.getString("Month"));
				payhistoryDto.setTopay(rs1.getString("ToPay"));
				payhistoryDto.setPaid(rs1.getString("Paid"));
                                payhistoryDto.setDue(rs1.getString("Due"));
                                payhistoryDtos.add(payhistoryDto);
			}
		
			request.getSession().setAttribute("view_payment_history", payhistoryDtos);
			response.sendRedirect("./ViewInfo.jsp");
			
		} catch (Exception e) {
			out.println("Connection Failed: \n" + e.getMessage());
		}
	}




    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}