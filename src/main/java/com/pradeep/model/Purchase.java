package com.pradeep.model;

import java.sql.Date;

public class Purchase {
	private int id;
	private int productId;
	private int quantity;
	private double purchasePrice;
	private Date purchaseDate;

	public Purchase() {
	}

	public Purchase(int id, int productId, int quantity, double purchasePrice, Date purchaseDate) {
		this.id = id;
		this.productId = productId;
		this.quantity = quantity;
		this.purchasePrice = purchasePrice;
		this.purchaseDate = purchaseDate;
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

	public double getPurchasePrice() {
		return purchasePrice;
	}

	public void setPurchasePrice(double purchasePrice) {
		this.purchasePrice = purchasePrice;
	}

	public Date getPurchaseDate() {
		return purchaseDate;
	}

	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}
}
