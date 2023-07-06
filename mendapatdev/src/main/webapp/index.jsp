<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign-In</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<style><%@include file="css/signin-signout.css"%></style>
</head>
<body>
	<div class="container-form">
		<div class="formBox" style="width: 50%;">
			<form action="login" method="post">
				<h1 class="signinText">Sign-In</h1>
				<div class="mb-3">
					<label class="form-label"><span class="indexFormtext">Username</span></label>
					<input type="text" name="username" class="form-control" />
				</div>
				<div class="mb-3">
					<label class="form-label"><span class="indexFormtext">Password</span></label>
					<input type="password" name="password" class="form-control" />
				</div>
				<div class="subButton">
					<button type="submit" class="btn btn-primary btn-lg btn-block">Login</button>
				</div>
			</form>
			<div class="signupText">
				<p>
					Haven't register yet? <a href="registerServletForm">Sign-Up</a> Here.
				</p>
			</div>
		</div>
	</div>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous">
	
</script>
</html>