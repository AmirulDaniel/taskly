<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<style><%@include file="css/dashboard.css"%></style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div style="display: flex; align-items: center;">
        <h5 class="navbar-brand mb-0">TASKLY</h5>
    </div>
    
    <ul class="navbar-nav ms-auto">
        <li class="nav-item dropdown"><a
            class="nav-link dropdown-toggle" href="#"
            id="navbarDropdownMenuLink" data-bs-toggle="dropdown"
            aria-expanded="false"><i class="bi bi-person-circle"></i> <c:out
                    value='${userCurrent}' /></a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                <a class="dropdown-item" href="logout"><i
                    class="bi bi-box-arrow-left"></i> Log Out</a>
            </div>
        </li>
    </ul>
</nav>

	<section>
		<div class="container mt-3">
			<div class="row mt-5">
				<div class="col-sm-4">
            		<div class="status-frame shadow p-3 mb-5 bg-white rounded" style="height: 300px;">
						<div class="status-title">Ongoing Tasks</div>
                		<div class="status-content d-flex flex-column justify-content-center align-items-center">
                    <span class="circle" style="background-color: #dfedf5;">
                        <span class="number" style="color: #64aacf;"><c:out value='${ongoing.countOngoing}'/></span>
                    </span>
                </div>
            </div>
				</div>
				<div class="col-sm-4">
					<div class="status-frame overdue shadow p-3 mb-5 bg-white rounded" style="height: 300px;">
						<div class="status-title">Overdue Tasks</div>
						<div
							class="status-content d-flex flex-column justify-content-center align-items-center">
							<span class="circle" style="background-color: #f4a9a4;"> <span
								class="number" style="color: #ed6e69;"><c:out value='${overdue.countOverdue}'/></span>
							</span>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="status-frame overdue shadow p-3 mb-5 bg-white rounded"
						style="height: 300px;">
						<div class="status-title">Completed Tasks</div>
						<div
							class="status-content d-flex flex-column justify-content-center align-items-center">
							<span class="circle" style="background-color: #dfedf5;"> <span
								class="number" style="color: #64aacf;"><c:out value='${completed.countCompleted}'/></span>
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="container">
		<div class="row mt-3">
			<div class="col-12 text-center">
				<div class="d-flex justify-content-center">
					<a href="taskview" class="btn btn-primary custom-btn btn-lg mx-2">View</a>
					<a href="taskcreateform"
						class="btn btn-secondary custom-btn btn-lg mx-2">Create</a>
				</div>
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