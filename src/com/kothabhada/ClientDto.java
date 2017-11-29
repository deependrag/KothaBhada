/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kothabhada;

/**
 *
 * @author Ranjan
 */
public class ClientDto {
        private String cid;
	private String fname;
	private String mname;
	private String lname;
        private String email;
        private String uname;
        private String pass;
        
        
	public String getCid() {
        return cid;
    }
    public String getFname() {
        return fname;
    }
    
    public String getMname() {
        return mname;
    }
    
    public String getlname() {
        return lname;
    }
    

    public String getEmail() {
        return email;
    }
    public String getUname() {
        return uname;
    }
    
    public String getPass() {
        return pass;
    }
	 
    public void setCid(String cid) {
        this.cid = cid;
    }    

    public void setFname(String fname) {
        this.fname = fname;
    }
    
    public void setMname(String mname) {
        this.mname = mname;
    }
    
    public void setLname(String lname) {
        this.lname = lname;
    }


    public void setEmail(String email) {
        this.email = email;
    }

     public void setUname(String uname) {
        this.uname = uname;
    }
     
     public void setPass(String pass) {
        this.pass = pass;
    }
     
     
   
}


