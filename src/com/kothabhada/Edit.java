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
@WebServlet(name = "Edit", urlPatterns = {"/Edit"})
public class Edit extends HttpServlet {

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
            String id=request.getParameter("id");
            String name=request.getParameter("name");
            String email=request.getParameter("email");
            String password=request.getParameter("password");
            
            
		Connection cn=null;
		try{
                    
			cn=ConnectionManager.getConnection();
			try{
                                
                                
                                if(!name.equals(null)){
                                String query="update client set Name='"+name+"' where ClientId='"+id+"'";
				Statement stat = cn.createStatement();
				stat.executeUpdate(query);
                                }
                                if(!email.equals(null)){
                                String query="update client set Email='"+email+"' where ClientId='"+id+"'";
				Statement stat = cn.createStatement();
				stat.executeUpdate(query);
                                }
                                
                                if(!password.equals(null)){
                                String query="update client set Password='"+password+"' where ClientId='"+id+"'";
				Statement stat = cn.createStatement();
				stat.executeUpdate(query);
                                }
                                else{
                                    request.setAttribute("alertMsg", "All the fields are Empty");
				request.getRequestDispatcher("./Edit.jsp").forward(request, response);
                                }
                                out.println(" Sucessfully Updated\n" );
			}catch(Exception e){
				out.println("Error: Submission Failed!!\n" + e.getMessage());
			}
               

		}catch(Exception e){
			out.println("Connection Failed: \n" + e.getMessage());
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
