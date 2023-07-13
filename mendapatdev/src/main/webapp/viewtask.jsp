<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View-Tasks</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<style><%@include file="css/viewtask.css"%></style>
</head>
<body>
	
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div style="display: flex; align-items: center;">
        <a href="main-menu" style="color: white; text-decoration: none; margin-right: 10px;">&#x2190;</a>
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
		<div class="container">
			<div class="d-flex justify-content-between align-items-center">
				<h1 class="pt-3 mt-3 title">My Tasks</h1>
				<form action="searchtask" method="post">
				<div class="input-group pt-3 mt-3 search">
					<span class="input-group-text" id="basic-addon1"><i
						class="fa-solid fa-magnifying-glass"></i></span> <input type="text"
						class="form-control" name="namesearch" placeholder="Search By Name">
				</div>
				</form>
			</div>
			<table class="table">
				<thead>
					<tr>
						<th scope="col"></th>
						<th scope="col">Name</th>
						<th scope="col">Status</th>

						<th scope="col">Due Date <i class="fa-solid fa-arrow-up-long"></i></th>
						<th scope="col">Category</th>
						<th scope="col">Action</th>
					</tr>
				</thead>
				<c:forEach var="task" items="${listTask}">
					<tbody>
						<tr>
							<td>
								<div class="w-100 h-100 middle">
									<p class="m-0">
										<i class="fa-solid fa-building"></i>
									</p>
								</div>
							</td>
							<td>
								<div>
									<p class="text1">
										<c:out value="${task.name}" />
									</p>
									<p class="text2">
										<c:out value="${task.description}" />
									</p>
								</div>
							</td>
							<td><c:out value="${task.status}" /></td>
							<td><c:out value="${task.duedate}" /></td>
							<td><c:out value="${task.category}" /></td>
							<td>
								<ul class="list-inline m-0">
									<li class="list-inline-item"><a
										href="taskeditform?taskid=<c:out value='${task.taskid}'/>">
											<button class="btn btn-success btn-sm rounded-0"
												type="button" data-toggle="tooltip" data-placement="top"
												title="Edit">
												<i class="fa fa-edit"></i>
											</button>
									</a></li>
									<li class="list-inline-item">
										<button class="btn btn-danger btn-sm rounded-0" type="button"
											data-bs-toggle="modal" data-bs-target="#DeleteModal"
											data-toggle="tooltip" data-placement="top" title="Delete">
											<i class="fa fa-trash"></i>
										</button> 
										<!-- Modal -->
										<div class="modal fade" id="DeleteModal" tabindex="-1"
											aria-labelledby="DeleteModalLabel" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h1 class="modal-title fs-5" id="DeleteModalLabel">Delete
															Confirmation</h1>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">Do you want to delete task?</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-bs-dismiss="modal">Close</button>
														<a type="button" class="btn btn-danger"
															href="taskdelete?taskid=<c:out value='${task.taskid}' />">
															Confirm </a>
													</div>
												</div>
											</div>
										</div> 
										<!-- end Modal -->
									</li>
								</ul>
							</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
	</section>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous">
</script>
</html>