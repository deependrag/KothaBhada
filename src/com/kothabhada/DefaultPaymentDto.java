package com.kothabhada;

public class DefaultPaymentDto {
	int rent;
	int water;
	int electricity;
	int waste;
	int internet;
	
	public DefaultPaymentDto() {}
	public DefaultPaymentDto(int rent, int water, int electricity, int waste, int internet) {
		super();
		this.rent = rent;
		this.water = water;
		this.electricity = electricity;
		this.waste = waste;
		this.internet = internet;
	}
	public int getRent() {
		return rent;
	}
	public void setRent(int rent) {
		this.rent = rent;
	}
	public int getWater() {
		return water;
	}
	public void setWater(int water) {
		this.water = water;
	}
	public int getElectricity() {
		return electricity;
	}
	public void setElectricity(int electricity) {
		this.electricity = electricity;
	}
	public int getWaste() {
		return waste;
	}
	public void setWaste(int waste) {
		this.waste = waste;
	}
	public int getInternet() {
		return internet;
	}
	public void setInternet(int internet) {
		this.internet = internet;
	}
	
	

}
