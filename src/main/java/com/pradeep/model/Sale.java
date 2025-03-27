package com.pradeep.model;

import java.sql.Date;

public class Sale {
	private int id;
	private int productId;
	private int quantity;
	private double sellingPrice;
	private Date saleDate;

	public Sale() {
	}

	public Sale(int id, int productId, int quantity, double sellingPrice, Date saleDate) {
		this.id = id;
		this.productId = productId;
		this.quantity = quantity;
		this.sellingPrice = sellingPrice;
		this.saleDate = saleDate;
	}

	// Getters and Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getSellingPrice() {
		return sellingPrice;
	}

	public void setSellingPrice(double sellingPrice) {
		this.sellingPrice = sellingPrice;
	}

	public Date getSaleDate() {
		return saleDate;
	}

	public void setSaleDate(Date saleDate) {
		this.saleDate = saleDate;
	}
}
