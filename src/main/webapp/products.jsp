<%@page import="com.pradeep.model.Product"%>
<%@page import="com.pradeep.model.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Manage Products</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Product Inventory</h1>
    <table border="1">
        <tr>
            <th>ID</th><th>Name</th><th>Category</th><th>Purchase Price</th><th>Selling Price</th><th>Stock</th>
        </tr>
        <%
            ProductDAO productDAO = new ProductDAO();
            List<Product> products = productDAO.getAllProducts();
            for (Product p : products) {
        %>
        <tr>
            <td><%= p.getId() %></td>
            <td><%= p.getName() %></td>
            <td><%= p.getCategory() %></td>
            <td><%= p.getPurchasePrice() %></td>
            <td><%= p.getSellingPrice() %></td>
            <td><%= p.getStockQuantity() %></td>
        </tr>
        <% } %>
    </table>
    <br>
    <a href="addProduct.jsp">Add New Product</a>
</body>
</html>
