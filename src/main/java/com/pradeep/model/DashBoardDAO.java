package com.pradeep.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DashBoardDAO{

    public static int getTotalProducts() {
        String query = "SELECT COUNT(*) FROM products";
        return getIntValue(query);
    }

    public static double getTotalSales() {
        String query = "SELECT SUM(quantity * selling_price) FROM sales";
        return getDoubleValue(query);
    }

    public static double getTotalProfit() {
        String query = "SELECT SUM(s.quantity * (s.selling_price - p.purchase_price)) FROM sales s JOIN products p ON s.product_id = p.id";
        return getDoubleValue(query);
    }

    private static int getIntValue(String query) {
        try (Connection conn = DBConnection.getCon();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    private static double getDoubleValue(String query) {
        try (Connection conn = DBConnection.getCon();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0.0;
    }
}
