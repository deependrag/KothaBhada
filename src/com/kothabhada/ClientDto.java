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
	private String name;
	private String email;
	private String pass;
        private String gender;

	public String getCid() {
		return cid;
	}

	public String getName() {
		return name;
	}

	public String getEmail() {
		return email;
	}

	public String getPass() {
		return pass;
	}
        
        public String getGender() {
		return gender;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

        public void setGender(String gender) {
		this.gender = gender;
	}
}
