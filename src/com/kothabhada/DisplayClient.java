/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kothabhada;


import Connection.ConnectionManager;
import java.util.*;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class DisplayClient extends HttpServlet {
public void doGet(HttpServletRequest request,
HttpServletResponse response)
throws IOException, ServletException
{
response.setContentType("text/html");
Connection cn=null;
try{
	
	cn=ConnectionManager.getConnection();
    String sql="select * from client";
	Statement stat=cn.createStatement();
	ResultSet rs=stat.executeQuery(sql);
	List<ClientDto> clients=new ArrayList<ClientDto>();
	while(rs.next()){
		ClientDto client =new ClientDto();
		client.setCid(rs.getString("ClientId"));
		client.setFname(rs.getString("FirstName"));
		client.setMname(rs.getString("MiddleName"));
                client.setLname(rs.getString("LastName"));
                client.setEmail(rs.getString("Email"));
		client.setUname(rs.getString("Username"));
		client.setPass(rs.getString("Password"));
		
		clients.add(client);
	}

	request.setAttribute("cu",clients);
	RequestDispatcher rd=request.getRequestDispatcher("/Dashboard.jsp");
	rd.include(request,response);
		
	
	}catch(Exception e){
		System.out.println("Exception!!!"+e);
	}
}
}