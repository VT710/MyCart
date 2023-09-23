<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New User</title>
<%@include file="components/common_css_js.jsp"%>

</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="container-fluid">
		<div class="card">
		
			<div class="card-body px-5">
			
				<div class="row mt-2">
					<div class="col-md-4 offset-md-4  border border-2  rounded">
					<div class="text-center"><%@include file="components/message.jsp" %></div>
						<div class="text-center">
							<i class="fa-solid fa-user fs-1"></i>
						</div>
						<h3 class="text-center">Sign Up here</h3>
						<form action="registerUser" method="post">

							<div class="mb-3">
								<label for="name" class="form-label">User Name</label> <input
									type="text" class="form-control" id="name"
									placeholder="Enter here" name="user_name" required>

							</div>
							<div class="mb-3">
								<label for="email" class="form-label">User Email</label> <input
									type="email" class="form-control" id="email"
									placeholder="Enter here" name="user_email" required>

							</div>
							<div class="mb-3">
								<label for="password" class="form-label">User Password</label> <input
									type="password" class="form-control" id="password"
									placeholder="Enter here" name="user_password" required>

							</div>
							<div class="mb-3">
								<label for="phone" class="form-label">User phone</label> <input
									type="number" class="form-control" id="phone"
									placeholder="Enter here" name="user_phone" required>

							</div>
							<div class="mb-3">
								<label for="address" class="form-label">User Address</label>
								<textarea style="height: 100px" type="text" class="form-control"
									id="address" placeholder="Enter your Address"
									name="user_address" required></textarea>

							</div>

							<div class="container text-center">
								<button type="submit" class="btn btn-outline-success col-md-4">Register</button>
								<button class="btn btn-outline-warning col-md-4">Reset</button>
							</div>
						</form>

					</div>

				</div>


			</div>

		</div>
	</div>
</body>
</html>