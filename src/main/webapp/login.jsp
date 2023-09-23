<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
<%@include file="components/navbar.jsp"%>

	<div class="container">


		<div class="row">
			<div class="col-md-6 offset-md-3">

				<div class="card mt-3">
					<div class="card-header custom-bg text-light ">
						<h1>Login here</h1>
					</div>
					<div class="card-body">


						<div class="card-body">
						<%@include file="components/message.jsp" %>
							<form action="user_login" method="post">
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Email
										address</label> <input  name="email" type="email" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp">
									<div id="emailHelp" class="form-text">We'll never share
										your email with anyone else.</div>
								</div>
								<div class="mb-3">
									<label for="exampleInputPassword1" class="form-label">Password</label>
									<input name="password" type="password" class="form-control"
										id="exampleInputPassword1">
								</div>
								<div class="text-center">
									<a href="register.jsp" class="text-decoration-none">if not registered <strong>Click
											here!</strong>
									</a>
								</div>
								<div class="mt-2 text-center">
									<button type="submit" class="btn custom-bg text-light col-md-4" >Submit</button>
									<button type="reset" class="btn custom-bg text-light col-md-4" >Reset</button>
								</div>
							</form>

						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

</body>
</html>