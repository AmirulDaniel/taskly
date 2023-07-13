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
			<form action="usercreate" method="post">
				<h1 class="signinText">Sign-Up</h1>
				<div class="mb-3">
					<label for="inputUsername" class="form-label"><span
						class="indexFormtext">Username</span></label> <input type="text"
						name="username" class="form-control"/>
				</div>
				<div class="mb-3">
					<label for="exampleInputPassword1" class="form-label"><span
						class="indexFormtext">Password</span></label> <input type="text"
						name="password" class="form-control"/>
				</div>
				<div class="subButton">
					<button type="reset" class="btn btn-secondary btn-lg btn-block"
					onclick="location.href='index.jsp';">Cancle</button> &nbsp;
					<button type="submit" class="btn btn-primary btn-lg btn-block">Register</button>
				</div>
			</form>
		</div>
	</div>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous">
	
</script>
</html>