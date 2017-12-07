package com.kothabhada;

public class PaymentDetailsDto {
	String item;
	String month;
	int rate;
	int price;
	
	public PaymentDetailsDto() {}
	
	public PaymentDetailsDto(String item, String month, int rate, int price) {
		super();
		this.item = item;
		this.month = month;
		this.rate = rate;
		this.price = price;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
}
