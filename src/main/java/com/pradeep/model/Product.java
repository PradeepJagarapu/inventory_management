package com.pradeep.model;

public class Product {
	private int id;
	private String name;
	private String category;
	private double purchasePrice;
	private double sellingPrice;
	private int stockQuantity;
	private String addedDate;

	public Product() {
	}

	public Product(int id, String name, String category, double purchasePrice, double sellingPrice, int stockQuantity,
			String addedDate) {
		this.id = id;
		this.name = name;
		this.category = category;
		this.purchasePrice = purchasePrice;
		this.sellingPrice = sellingPrice;
		this.stockQuantity = stockQuantity;
		this.addedDate = addedDate;
	}

	// Getters and Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public double getPurchasePrice() {
		return purchasePrice;
	}

	public void setPurchasePrice(double purchasePrice) {
		this.purchasePrice = purchasePrice;
	}

	public double getSellingPrice() {
		return sellingPrice;
	}

	public void setSellingPrice(double sellingPrice) {
		this.sellingPrice = sellingPrice;
	}

	public int getStockQuantity() {
		return stockQuantity;
	}

	public void setStockQuantity(int stockQuantity) {
		this.stockQuantity = stockQuantity;
	}

	public String getAddedDate() {
		return addedDate;
	}

	public void setAddedDate(String addedDate) {
		this.addedDate = addedDate;
	}
}
