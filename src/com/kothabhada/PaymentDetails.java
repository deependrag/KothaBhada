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

/**
 * Servlet implementation class PaymentDetails
 */
@WebServlet("/PaymentDetails")
public class PaymentDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PrintWriter out;
	private String userId;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		out = response.getWriter();
		userId = request.getSession().getAttribute("userid").toString();
		try {

			String refNo = request.getParameter("RefNo");
			Connection con = null;

			con = ConnectionManager.getConnection();
			Statement st = con.createStatement();
			PreparedStatement pre1 = con.prepareStatement("select * from receipt where RefNo=?");

			pre1.setString(1, refNo);
			ResultSet rs1 = pre1.executeQuery();
			List<PaymentDetailsDto> paymentDetailsDtos = new ArrayList<PaymentDetailsDto>();
			while (rs1.next()) {
				PaymentDetailsDto paymentDetailsDto = new PaymentDetailsDto();
				paymentDetailsDto.setItem(rs1.getString("Item"));
				paymentDetailsDto.setMonth(rs1.getString("Month"));
				paymentDetailsDto.setRate(Integer.parseInt(rs1.getString("Rate")));
				paymentDetailsDto.setPrice(Integer.parseInt(rs1.getString("Price")));
				paymentDetailsDtos.add(paymentDetailsDto);
			}

			request.getSession().setAttribute("payment_details", paymentDetailsDtos);
			getOtherDetails(request);
			response.sendRedirect("./PaymentReceipt.jsp");

		} catch (Exception e) {
			out.println("Connection Failed: \n" + e.getMessage());
		}
	}
	
	public void getOtherDetails(HttpServletRequest request) {
		try {
			Connection con = null;


			con = ConnectionManager.getConnection();
			Statement st = con.createStatement();
			PreparedStatement pre1 = con.prepareStatement("select * from paymenthistory where ClientId=?");

			pre1.setString(1, userId);
			ResultSet rs1 = pre1.executeQuery();
			PayHistoryDto payhistoryDto = new PayHistoryDto();
			while (rs1.next()) {
				payhistoryDto.setRefno(rs1.getString("RefNo"));
				payhistoryDto.setDate(rs1.getString("Date"));
				payhistoryDto.setTopay(rs1.getString("Total"));
				payhistoryDto.setPaid(rs1.getString("Paid"));
				payhistoryDto.setDue(rs1.getString("Due"));
			}
			request.getSession().setAttribute("other_payment_details", payhistoryDto);
		}catch (Exception e) {
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
