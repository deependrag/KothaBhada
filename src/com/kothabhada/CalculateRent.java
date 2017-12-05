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
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ranjan
 */
@WebServlet(name = "CalculateRent", urlPatterns = {"/CalculateRent"})
public class CalculateRent extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String id = request.getSession().getAttribute("userid").toString();
             out.print("helo");

            String rfrommonth = request.getParameter("rmonthfrom");      //for house rent
            String rtomonth = request.getParameter("rmonthto");
            int rrate = Integer.parseInt(request.getParameter("rrate"));
            
            int rfmonth = DefineMonth.getMonth(rfrommonth);
            int rtmonth = DefineMonth.getMonth(rtomonth);
              
            String wfrommonth = request.getParameter("wmonthfrom");      //for water
            String wtomonth = request.getParameter("wmonthto");
            int wrate = Integer.parseInt(request.getParameter("wrate")); 
            
            int wfmonth = DefineMonth.getMonth(wfrommonth);
            int wtmonth = DefineMonth.getMonth(wtomonth);
          
            String efrommonth = request.getParameter("emonthfrom");     //for electricity
            String etomonth = request.getParameter("emonthto");
            int erate = Integer.parseInt(request.getParameter("erate"));
            int unit = Integer.parseInt(request.getParameter("unit"));
            
       
            
            String wafrommonth = request.getParameter("wamonthfrom");   //for wastage
            String watomonth = request.getParameter("wamonthto");
            int warate = Integer.parseInt(request.getParameter("warate"));
           
            int wafmonth = DefineMonth.getMonth(wafrommonth);
          
            int watmonth = DefineMonth.getMonth(watomonth);
            
            String ifrommonth = request.getParameter("imonthfrom");       //for internet
            String itomonth = request.getParameter("imonthto");
            int irate = Integer.parseInt(request.getParameter("irate"));
            
            int ifmonth = DefineMonth.getMonth(ifrommonth);
            int itmonth = DefineMonth.getMonth(itomonth);
       
            int previousdue=Integer.parseInt(request.getParameter("prev"));
            int total=Integer.parseInt(request.getParameter("total"));
            
             out.print("helo");
            int rmonth = rtmonth-rfmonth;
            
            int wmonth = wtmonth-wfmonth;
            int wamonth = watmonth-wafmonth;
            int imonth = itmonth-ifmonth;
            
           
            int rtotal;
            int etotal;
            int wtotal;
            int watotal;
            int itotal;
           
            //total of house rent
            if((rmonth >= 0)){
                 rtotal =rmonth*rrate;
            } else {
                 rmonth +=12 ;
                 rtotal =rmonth*rrate;
            }
            

            //total of electricity
            
                etotal =unit*erate;
            
            
            //total of water
            if((rmonth >= 0)){
                wtotal =wmonth*wrate;
            } else {
                 wmonth +=12 ;
                wtotal =wmonth*wrate;
            }
                       //total of wastage
            if((rmonth >= 0)){
                watotal =wamonth*warate;
            } else {
                 wamonth +=12 ;
                watotal =wamonth*warate;
            }
            
            //total of internet
            if((rmonth >= 0)){
                itotal =imonth*irate;
            } else {
                 imonth +=12 ;
                itotal =imonth*irate;
            }
            
           out.print("helo");
            int grandtotal = rtotal + etotal + wtotal + watotal + itotal + previousdue; //totl amount to be paid
           
            
            String month=rfrommonth + "-" + rtomonth;
            Calendar c = Calendar.getInstance();
            SimpleDateFormat df = new SimpleDateFormat("dd-MMM-yyyy");
            String formattedDate = df.format(c.getTime());
            out.print("helo");
            if(total== 0){
                request.getSession().setAttribute("total", grandtotal);
                 request.getSession().setAttribute("rfrom", rfrommonth);
			response.sendRedirect("./Calculation.jsp");
            
            }
            
           else{
                int paid=Integer.parseInt(request.getParameter("paid"));
                int remaining= paid - grandtotal;                                //remaning due after payment
                String query = "insert into paymenthistory(ClientId,Date,Month,Topay,Paid,Due) values('" + id + "','" + formattedDate + "','"
					+ month + "','" + grandtotal + "','" + paid + "','" + remaining + "')";
			Connection cn = null;
			

				cn = ConnectionManager.getConnection();
				try {
					Statement stat = cn.createStatement();
					stat.executeUpdate(query);
					response.sendRedirect("./ViewInfo.jsp");
				} catch (Exception e) {
					out.println("Error: Submission Failed!!\n" + e.getMessage());
				}
            }
             
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
