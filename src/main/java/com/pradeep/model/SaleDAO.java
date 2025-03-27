package com.pradeep.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SaleDAO {

    // Insert a new sale
    public boolean addSale(Sale sale) {
        String sql = "INSERT INTO sales (product_id, quantity, selling_price, sale_date) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getCon();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, sale.getProductId());
            stmt.setInt(2, sale.getQuantity());
            stmt.setDouble(3, sale.getSellingPrice());
            stmt.setDate(4, sale.getSaleDate()); // Use java.sql.Date

            return stmt.executeUpdate() > 0; // Returns true if insertion is successful
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Fetch all sales records
    public List<Sale> getAllSales() {
        List<Sale> salesList = new ArrayList<>();
        String sql = "SELECT * FROM sales";

        try (Connection conn = DBConnection.getCon();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Sale sale = new Sale(
                        rs.getInt("id"),
                        rs.getInt("product_id"),
                        rs.getInt("quantity"),
                        rs.getDouble("selling_price"),
                        rs.getDate("sale_date") // Use java.sql.Date
                );
                salesList.add(sale);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return salesList;
    }

    // Fetch sales records by product ID
    public List<Sale> getSalesByProductId(int productId) {
        List<Sale> salesList = new ArrayList<>();
        String sql = "SELECT * FROM sales WHERE product_id = ?";

        try (Connection conn = DBConnection.getCon();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, productId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Sale sale = new Sale(
                            rs.getInt("id"),
                            rs.getInt("product_id"),
                            rs.getInt("quantity"),
                            rs.getDouble("selling_price"),
                            rs.getDate("sale_date")
                    );
                    salesList.add(sale);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return salesList;
    }

    // Delete a sale by ID
    public boolean deleteSale(int id) {
        String sql = "DELETE FROM sales WHERE id = ?";
        try (Connection conn = DBConnection.getCon();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0; // Returns true if deletion is successful
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
