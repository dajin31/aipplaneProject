package com.example.demo.vo;

public class MileageVO {
	private int order_amt;
	private String user_id;
	private String order_id;
	private String order_date;
	private String prod_id;
	private String startDate;
	private String endDate;


	public int getOrder_amt() {
		return order_amt;
	}

	public void setOrder_amt(int order_amt) {
		this.order_amt = order_amt;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getOrder_date() {
		return order_date;
	}

	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}

	public String getProd_id() {
		return prod_id;
	}

	public void setProd_id(String prod_id) {
		this.prod_id = prod_id;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	@Override
	public String toString() {
		return "MileageVO [order_amt=" + order_amt + ", user_id=" + user_id + ", order_id=" + order_id + ", order_date="
				+ order_date + ", prod_id=" + prod_id + ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}


}
