<%@page import="com.pradeep.model.DashBoardDAO"%>
<%@page import="com.pradeep.model.SaleDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Reports</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Reports</h1>
    <%
        DashBoardDAO dashboardDAO = new DashBoardDAO();
        double totalSales = dashboardDAO.getTotalSales();
        double totalProfit = dashboardDAO.getTotalProfit();
    %>
    <p>Total Sales: <b><%= totalSales %></b></p>
    <p>Total Profit: <b><%= totalProfit %></b></p>
</body>
</html>
l>