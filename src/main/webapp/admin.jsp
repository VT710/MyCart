<%@page import="com.vt.mycart.helper.EntityManagerProvider"%>
<%@page import="com.vt.mycart.dao.CategoryDao"%>
<%@page import="com.vt.mycart.entities.User"%>
<%@page import="com.vt.mycart.entities.Category"%>
<%
User user = (User) session.getAttribute("current-user");
if (user == null) {
	session.setAttribute("message", "You are not Logged in !! Login First");
	response.sendRedirect("login.jsp");
	return;
} else {
	if (user.getUserType().equals("normal")) {
		session.setAttribute("message", " You are not Admin ! Do not access this page");
		response.sendRedirect("login.jsp");
		return;
	}
}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="components/common_css_js.jsp"%>



</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container admin">
	
	<div container-fluid>
		<%@include file="components/message.jsp" %>
	
	</div>
	
		<div class="row mt-3">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img src="img/man.png" class="img-fluid rounded-circle"
								style="max-width: 200px;" alt="">
						</div>
						<h1>200</h1>
						<h1 class="text-uppercase text-muted">Users</h1>
					</div>
				</div>

			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img src="img/list.png" class="img-fluid rounded-circle"
								style="max-width: 200px;" alt="">
						</div>
						<h1>200</h1>
						<h1 class="text-uppercase text-muted">Categories</h1>
					</div>
				</div>

			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img src="img/product.png" class="img-fluid rounded-circle"
								style="max-width: 200px;" alt="">
						</div>
						<h1>200</h1>
						<h1 class="text-uppercase text-muted">Product</h1>
					</div>
				</div>

			</div>

		</div>
		<div class="row mt-3">
			<div class="col-md-6">
				<div class="card" data-bs-toggle="modal"
					data-bs-target="#category-add">
					<div class="card-body text-center">
						<div class="container">
							<img src="img/calculator.png" class="img-fluid rounded-circle"
								style="max-width: 200px;" alt="">
						</div>

						<h1>200</h1>
						<h1 class="text-uppercase text-muted">Add Categories</h1>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card" data-bs-toggle="modal"
					data-bs-target="#product-add">
					<div class="card-body text-center">
						<div class="container">
							<img src="img/plus.png" class="img-fluid rounded-circle"
								style="max-width: 200px;" alt="">
						</div>

						<h1>200</h1>
						<h1 class="text-uppercase text-muted">Add Products</h1>
					</div>
				</div>
			</div>
		</div>

	</div>



	<!--Model start-->
	<div class="modal" id="category-add" tabindex="-1">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header custom-bg">
					<h5 class="modal-title  text-white">Fill Category Details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="ProductOperationServlet" method="post">

						<input type="hidden" name="operation" value="addcategory">

						<div class="form-group">
							<input type="text" class="form-control" name="categoryTitile"
								placeholder="Enter catagory title" />
						</div>
						<div class="form-group">
							<textarea style="height: 200px" type="text"
								class="form-control mt-2" name="categoryDesc"
								placeholder="Enter category description"></textarea>
						</div>
						<div class="container text-center m-3">
							<button type="submit" class="btn btn-outline-primary col-md-4">Add
								Category</button>
							<button type="button" class="btn btn-outline-secondary col-md-4"
								data-bs-dismiss="modal">Close</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>

	<!--Model ends-->
	<!--Product Model start-->
	<div class="modal" id="product-add" tabindex="-1">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header custom-bg">
					<h5 class="modal-title  text-white">Fill Product Details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<form action="ProductOperationServlet" method="post">

						<input type="hidden" name="operation" value="addproduct" >


						<div class="form-group">
							<input type="text" class="form-control" name="pName"
								placeholder="Enter product name" required />
						</div>
						<div class="form-group">
							<input type="number" class="form-control" name="pPrice"
								placeholder="Enter product prize" required/>
						</div>
						<div class="form-group">
							<input type="number" class="form-control" name="pDiscount"
								placeholder="Enter product discount" />
						</div>
						<div class="form-group">
							<input type="number" class="form-control" name="pQuantity"
								placeholder="Enter product Quantity" required/>
						</div>
						
						
						<!-- product category -->
						
						
						
						<div class="form-group">
							<input class="form-control" type="number" class="form-control" name="pQuantity"
								placeholder="Enter product Quantity" />
						</div>
						
						
						
						
						<div class="form-group">
						<select name="catId" id="" class="form-control"  >
							<option value="laptop">Laptops</option>
							<option value="laptop">Laptops</option>
							<option value="laptop">Laptops</option>
						</select>
						</div>



						<!-- product file -->
						<div class="form-group">
							<label for="pPic">Select Picture of product</label>
							<br>
							<input type="file" id="pPic" name="pPic" required>
						</div>

						
						<div class="container text-center m-3">
							<button type="submit" class="btn btn-outline-primary col-md-4">Add
								Product</button>
							<button type="button" class="btn btn-outline-secondary col-md-4"
								data-bs-dismiss="modal">Close</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>

	<!--Model ends-->

</body>
</html>