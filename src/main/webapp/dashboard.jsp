<%@page import="com.pradeep.model.DashBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Inventory Dashboard</title>
<!-- Bootstrap 5 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- FontAwesome Icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="css/style.css">
<style type="text/css">
body {
	padding-top: 60px;
}

#sidebar {
	width: 250px;
	height: 100vh;
	position: fixed;
	left: -250px;
	transition: all 0.3s;
	z-index: 1000;
	background-color: #343a40;
	color: white;
}

#sidebar.active {
	left: 0;
}

#sidebar .sidebar-header {
	padding: 20px;
	background-color: #212529;
}

#sidebar ul.components {
	padding: 20px 0;
}

#sidebar ul li a {
	padding: 10px 20px;
	color: rgba(255, 255, 255, 0.8);
	display: block;
	text-decoration: none;
}

#sidebar ul li a:hover {
	color: #fff;
	background-color: rgba(255, 255, 255, 0.1);
}

#sidebar ul li.active>a {
	color: #fff;
	background-color: #007bff;
}

#content {
	width: 100%;
	min-height: 100vh;
	transition: all 0.3s;
	padding: 20px;
}

.navbar-dark {
	background-color: #343a40 !important;
}

.card {
	margin-bottom: 20px;
	border: none;
	box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
}

.card-header {
	font-weight: 500;
}

/* Table styling */
.table {
	margin-bottom: 0;
}

.table-hover tbody tr:hover {
	background-color: rgba(0, 0, 0, 0.075);
}

@media ( max-width : 768px) {
	#sidebar {
		left: -250px;
	}
	#sidebar.active {
		left: 0;
	}
	body {
		padding-top: 56px;
	}
}
</style>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container-fluid">


			<button class="btn btn-dark me-2" id="sidebarCollapse">
				<i class="fas fa-bars"></i>
			</button>

			<!-- Brand/Title -->
			<a class="navbar-brand" href="#"> <i class="fas fa-boxes me-2"></i>Inventory
				System
			</a>


			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarMenu">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarMenu">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						href="dashboard.jsp"> <i class="fas fa-home me-1"></i>
							Dashboard
					</a></li>
					<li class="nav-item"><a class="nav-link" href="addProduct.jsp">
							<i class="fas fa-plus-circle me-1"></i> Add Product
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="viewProducts.jsp"> <i class="fas fa-boxes me-1"></i>
							View Products
					</a></li>
					<li class="nav-item"><a class="nav-link" href="recordSale.jsp">
							<i class="fas fa-shopping-cart me-1"></i> Record Sale
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="salesReport.jsp"> <i class="fas fa-chart-line me-1"></i>
							Sales Report
					</a></li>
				</ul>
			</div>
		</div>
	</nav>



	<nav id="sidebar" class="bg-dark text-white">
		<div class="sidebar-header p-3">
			<h3>Inventory System</h3>
		</div>
		<ul class="list-unstyled components">
			<li class="active"><a href="dashboard.jsp"><i
					class="fas fa-home me-2"></i>Dashboard</a></li>
			<li><a href="addProduct.jsp"><i
					class="fas fa-plus-circle me-2"></i>Add Product</a></li>
			<li><a href="viewProducts.jsp"><i class="fas fa-boxes me-2"></i>View
					Products</a></li>
			<li><a href="recordSale.jsp"><i
					class="fas fa-shopping-cart me-2"></i>Record Sale</a></li>
			<li><a href="salesReport.jsp"><i
					class="fas fa-chart-line me-2"></i>Sales Report</a></li>
		</ul>
	</nav>


	<div id="content" class="p-4">
		<!-- Summary Cards -->
		<div class="row mt-4">
			<div class="col-md-3 mb-4">
				<div class="card bg-primary text-white">
					<div class="card-body">
						<h5 class="card-title">Total Products</h5>
						<h2 class="card-text">
							<%=DashBoardDAO.getTotalProducts() %>
						</h2>
					</div>
				</div>
			</div>
			<div class="col-md-3 mb-4">
				<div class="card bg-warning text-white">
					<div class="card-body">
						<h5 class="card-title">Low Stock</h5>
						<h2 class="card-text">12</h2>
					</div>
				</div>
			</div>
			<div class="col-md-3 mb-4">
				<div class="card bg-success text-white">
					<div class="card-body">
						<h5 class="card-title">Sales</h5>
						<h2 class="card-text">₹<%=DashBoardDAO.getTotalSales() %></h2>
					</div>
				</div>
			</div>
			<div class="col-md-3 mb-4">
				<div class="card bg-info text-white">
					<div class="card-body">
						<h5 class="card-title">Total Profit</h5>
						<h2 class="card-text">₹<%=DashBoardDAO.getTotalProfit()%></h2>
					</div>
				</div>
			</div>
		</div>



		<div class="card mb-4">
			<div class="card-header bg-danger text-white">
				<i class="fas fa-exclamation-triangle me-2"></i> Low-Stock Alerts
			</div>
			<div class="card-body">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>Product</th>
							<th>Current Stock</th>
							<th>Min Required</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Whey protien</td>
							<td>3</td>
							<td>10</td>
							<td><button class="btn btn-sm btn-warning">Restock</button></td>
						</tr>
						<!-- More rows from DB -->
					</tbody>
				</table>
			</div>
		</div>


		<div class="card">
			<div class="card-header bg-primary text-white">
				<i class="fas fa-history me-2"></i> Recent Sales
			</div>
			<div class="card-body">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>Sale ID</th>
							<th>Product</th>
							<th>Qty Sold</th>
							<th>Date</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1001</td>
							<td>Pre-Workout</td>
							<td>5</td>
							<td>2023-10-05</td>
						</tr>
						<!-- More rows from DB -->
					</tbody>
				</table>
			</div>
		</div>
	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


	<script>
		// Toggle sidebar
		document.getElementById('sidebarCollapse').addEventListener(
				'click',
				function() {
					document.getElementById('sidebar').classList
							.toggle('active');
				});
	</script>
</body>
</html>