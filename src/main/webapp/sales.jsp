<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@page import="com.pradeep.model.Sale"%>
<%@page import="com.pradeep.model.SaleDAO"%>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Sales</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Sales History</h1>
    <table border="1">
        <tr>
            <th>ID</th><th>Product ID</th><th>Quantity</th><th>Selling Price</th><th>Sale Date</th>
        </tr>
        <%
            SaleDAO salesDAO = new SaleDAO();
            List<Sale> sales = salesDAO.getAllSales();
            for (Sale s : sales) {
        %>
        <tr>
            <td><%= s.getId() %></td>
            <td><%= s.getProductId() %></td>
            <td><%= s.getQuantity() %></td>
            <td><%= s.getSellingPrice() %></td>
            <td><%= s.getSaleDate() %></td>
        </tr>
        <% } %>
    </table>
</body>
</html>
