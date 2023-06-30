<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Form-Task</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<style><%@include file="css/taskform.css"%></style>
</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-dark bg-dark justify-content-between">
		<h5 class="navbar-brand">TASKLY</h5>

		<ul class="navbar-nav">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#"
				id="navbarDropdownMenuLink" data-bs-toggle="dropdown"
				aria-expanded="false"><i class="bi bi-person-circle"></i> <c:out
						value='${userCurrent}' /></a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="logout"><i
						class="bi bi-box-arrow-left"></i> Log Out</a>
				</div></li>
		</ul>
	</nav>
	<div class="container">
		<h2>
			<c:if test="${task != null}">Edit My Task</c:if>
			<c:if test="${task == null}">Add New Task</c:if>
		</h2>
		<c:if test="${task != null}">
			<form action="taskedit" method="post">
		</c:if>

		<c:if test="${task == null}">
			<form action="taskcreate" method="post">
		</c:if>

		<c:if test="${task != null}">
			<input type="hidden" name="taskid"
				value="<c:out value='${task.taskid}'/>"/>
			<input type="hidden" name="userid"
				value="<c:out value='${task.userid}'/>"/>
		</c:if>

		<fieldset class="form-group">
			<label>Task Name:</label> <input type="text"
				value="<c:out value='${task.name}'/>"
				class="form-control" name="name" style="text-transform: capitalize;" required="required">
		</fieldset>
		<fieldset class="form-group">
			<label>Task Status:</label>
				<select class="form-select" name="statusid" required="required">
					<c:if test="${task.statusid == 3001}"><option style="display:none" value="<c:out value='${task.categoryid}'/>">Done</c:if>
					<c:if test="${task.statusid == 3002}"><option style="display:none" value="<c:out value='${task.categoryid}'/>">Ongoing</c:if>
					<c:if test="${task == null}"><option disabled selected value>-- select an option --</option></c:if>
					<option value="3001">Done</option>
					<option value="3002">Ongoing</option>
				</select>
		</fieldset>
		<fieldset class="form-group">
			<label>Due Date:</label> <input type="date"
				value="<c:out value='${task.duedate}'/>" class="form-control"
				name="duedate" required="required">
		</fieldset>
		<fieldset class="form-group">
			<label>Task Category:</label>
				<select class="form-select" name="categoryid" required="required">
					<c:if test="${task.categoryid == 4001}"><option style="display:none" value="<c:out value='${task.categoryid}'/>">Entertainment</c:if>
					<c:if test="${task.categoryid == 4002}"><option style="display:none" value="<c:out value='${task.categoryid}'/>">Work</c:if>
					<c:if test="${task == null}"><option disabled selected value>-- select an option --</option></c:if>
					<option value="4001">Entertainment</option>
					<option value="4002">Work</option>
				</select>
		</fieldset>
		<fieldset class="form-group">
			<label>Task Description:</label> <input type="text"
				value="<c:out value='${task.description}'/>" class="form-control"
				name="description">
		</fieldset>

		<div class="button-class">
		<button type="submit" class="btn btn-dark">
			<i class="bi bi-save"></i> Save
		</button>
		</div>
		</form>
	</div>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous">
	
</script>
</html>