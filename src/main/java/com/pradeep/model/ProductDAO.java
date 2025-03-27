package com.pradeep.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    // Insert a new product
    public boolean addProduct(Product product) {
        String sql = "INSERT INTO products (name, category, purchase_price, selling_price, stock_quantity, added_date) VALUES (?, ?, ?, ?, ?, NOW())";
        try (Connection conn =DBConnection.getCon();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, product.getName());
            stmt.setString(2, product.getCategory());
            stmt.setDouble(3, product.getPurchasePrice());
            stmt.setDouble(4, product.getSellingPrice());
            stmt.setInt(5, product.getStockQuantity());

            return stmt.executeUpdate() > 0; // Returns true if insertion is successful
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Fetch all products
    public List<Product> getAllProducts() {
        List<Product> productList = new ArrayList<>();
        String sql = "SELECT * FROM products";

        try (Connection conn =DBConnection.getCon();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("category"),
                        rs.getDouble("purchase_price"),
                        rs.getDouble("selling_price"),
                        rs.getInt("stock_quantity"),
                        rs.getString("added_date")
                );
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }

    // Fetch a product by ID
    public Product getProductById(int id) {
        String sql = "SELECT * FROM products WHERE id = ?";
        try (Connection conn = DBConnection.getCon();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Product(
                            rs.getInt("id"),
                            rs.getString("name"),
                            rs.getString("category"),
                            rs.getDouble("purchase_price"),
                            rs.getDouble("selling_price"),
                            rs.getInt("stock_quantity"),
                            rs.getString("added_date")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Update a product
    public boolean updateProduct(Product product) {
        String sql = "UPDATE products SET name = ?, category = ?, purchase_price = ?, selling_price = ?, stock_quantity = ? WHERE id = ?";
        try (Connection conn = DBConnection.getCon();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, product.getName());
            stmt.setString(2, product.getCategory());
            stmt.setDouble(3, product.getPurchasePrice());
            stmt.setDouble(4, product.getSellingPrice());
            stmt.setInt(5, product.getStockQuantity());
            stmt.setInt(6, product.getId());

            return stmt.executeUpdate() > 0; // Returns true if update is successful
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete a product
    public boolean deleteProduct(int id) {
        String sql = "DELETE FROM products WHERE id = ?";
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
