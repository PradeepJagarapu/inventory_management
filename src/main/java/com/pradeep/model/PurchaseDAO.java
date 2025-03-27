package com.pradeep.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PurchaseDAO {
    // Insert a new purchase
    public boolean addPurchase(Purchase purchase) {
        String sql = "INSERT INTO purchases (product_id, quantity, purchase_price, purchase_date) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getCon();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, purchase.getProductId());
            stmt.setInt(2, purchase.getQuantity());
            stmt.setDouble(3, purchase.getPurchasePrice());
            stmt.setDate(4, purchase.getPurchaseDate()); // Convert LocalDate to SQL Date

            return stmt.executeUpdate() > 0; // Returns true if insertion is successful
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Fetch all purchases
    public List<Purchase> getAllPurchases() {
        List<Purchase> purchaseList = new ArrayList<>();
        String sql = "SELECT * FROM purchases";

        try (Connection conn =  DBConnection.getCon();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Purchase purchase = new Purchase(
                        rs.getInt("id"),
                        rs.getInt("product_id"),
                        rs.getInt("quantity"),
                        rs.getDouble("purchase_price"),
                        rs.getDate("purchase_date") // Convert SQL Date to LocalDate
                );
                purchaseList.add(purchase);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return purchaseList;
    }

    // Fetch purchases by product ID
    public List<Purchase> getPurchasesByProductId(int productId) {
        List<Purchase> purchaseList = new ArrayList<>();
        String sql = "SELECT * FROM purchases WHERE product_id = ?";

        try (Connection conn =  DBConnection.getCon();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, productId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Purchase purchase = new Purchase(
                            rs.getInt("id"),
                            rs.getInt("product_id"),
                            rs.getInt("quantity"),
                            rs.getDouble("purchase_price"),
                            rs.getDate("purchase_date")
                    );
                    purchaseList.add(purchase);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return purchaseList;
    }

    // Delete a purchase by ID
    public boolean deletePurchase(int id) {
        String sql = "DELETE FROM purchases WHERE id = ?";
        try (Connection conn =  DBConnection.getCon();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0; // Returns true if deletion is successful
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}

