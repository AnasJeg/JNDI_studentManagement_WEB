<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Management</title>
<link rel="stylesheet" type="text/css"
	href="bootstrap/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
	<div class="container">
		<h4>Student Form:</h4>
		<div class="card">
			<div class="card-body">
				<form action="<%=request.getContextPath()%>/StudentServlet"
					method="post">
					<div class="form-group row">
						<label for="login" class="col-sm-2 col-form-label">Login</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="login"
								placeholder="Enter login">
						</div>
					</div>
					<div class="form-group row">
						<label for="login" class="col-sm-2 col-form-label">Password</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="pass"
								placeholder="Enter password">
						</div>
					</div>
					<div class="form-group row">
						<label for="firstName" class="col-sm-2 col-form-label">First
							Name</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="firstName"
								placeholder="Enter first name">
						</div>
					</div>

					<div class="form-group row">
						<label for="lastName" class="col-sm-2 col-form-label">Last
							Name</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="lastName"
								placeholder="Enter last name">
						</div>
					</div>

					<div class="form-group row">
						<label for="tell" class="col-sm-2 col-form-label">Tell</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="tell"
								placeholder="Enter tell">
						</div>
					</div>

					<div class="form-group row">
						<label for="filiere" class="col-sm-2 col-form-label">Filiere</label>
						<div class="col-sm-7">
							<select class="form-select" aria-label="Default select example"
								name="filiere">
								<c:forEach items="${filieres}" var="fil">
									<option value="${fil.id}">${fil.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>

					<button type="submit" class="btn btn-primary" name="action"
						value="add">Submit</button>
				</form>
			</div>
		</div>
	</div>
	<br />
	<br />

	<div class="container">
		<h4>Student Table:</h4>
		<div class="card">
			<div class="card-body">
				<table class="table table-bordered">
					<thead class="thead-light">
						<tr>
							<th scope="col">Id</th>
							<th scope="col">Login</th>
							<th scope="col">Firstname</th>
							<th scope="col">Lastname</th>
							<th scope="col">Tell</th>
							<th scope="col">Filiere</th>
					
							<th scope="col">Role</th>
						
							<th scope="col">Actions</th>
						</tr>
					</thead>
					<c:forEach items="${students}" var="f">
						<tr>
							<td>${f.id}</td>
							<td>${f.login}</td>
							<td>${f.firstname}</td>
							<td>${f.lastname}</td>
							<td>${f.tell}</td>
							<td>${f.filiere.name}</td>
					 <td>${f.roles}</td>
					
							
							<td>
								<div class="btn-group" role="group">

									  <button type="button" class="btn btn-success" data-toggle="modal" data-target="#updateModal${f.id}">
                <i class="fas fa-edit"></i>
            </button>
            </div>
		<div class="btn-group" role="group">
									<form action="<%=request.getContextPath()%>/StudentServlet"
										method="post">
										<input type="hidden" name="action" value="del" /> <input
											type="hidden" name="id" value="${f.id}" />
										<button type="submit" class="btn btn-danger">
											<i class="far fa-trash-alt"></i>
										</button>
									</form>
									
								</div>
										<div class="btn-group" role="group">
			 <button type="button" class="btn btn-info" data-toggle="modal" data-target="#affectRole${f.id}">
                 <i class="fas fa-th-list"></i>
            </button>
            </div>
   
					<div class="modal fade" id="affectRole${f.id}" tabindex="-1"
									role="dialog" aria-labelledby="updateModalLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="updateModalLabel">Affect Role to
													Student </h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<form action="<%=request.getContextPath()%>/StudentServlet"
													method="post">
													<input type="hidden" name="action" value="affect" /> <input
														type="hidden" name="id" value="${f.id}" />
												
													<div class="form-group row">
														<label for="filiere" class="col-sm-2 col-form-label">Roles</label>
														<div class="col-sm-7">
															<select class="form-select"
																aria-label="Default select example" name="role">
																<c:forEach items="${roles}" var="rl">
																	<option value="${rl.id}">${rl.name}</option>
																</c:forEach>
															</select> </select>
														</div>
													</div>
													<button type="submit" class="btn btn-primary">Affect</button>
												</form>
											</div>
										</div>
									</div>
								</div>
								<div class="modal fade" id="updateModal${f.id}" tabindex="-1"
									role="dialog" aria-labelledby="updateModalLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="updateModalLabel">Update
													Students</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<form action="<%=request.getContextPath()%>/StudentServlet"
													method="post">
													<input type="hidden" name="action" value="update" /> <input
														type="hidden" name="id" value="${f.id}" />
													<div class="form-group">
														<label for="updateCode">Login:</label> <input type="text"
															class="form-control" name="login"
															value="${f.login}">
													</div>
													<div class="form-group">
														<label for="updateCode">Password:</label> <input type="text"
															class="form-control" name="pass"
															value="${f.password}">
													</div>
													<div class="form-group">
														<label for="updateCode">Firstname:</label> <input
															type="text" class="form-control"
															name="firstName" value="${f.firstname}">
													</div>
													<div class="form-group">
														<label for="updateName">Lirstname:</label> <input
															type="text" class="form-control"
															name="lastName" value="${f.lastname}">
													</div>
													<div class="form-group">
														<label for="updateName">Tell:</label> <input type="text"
															class="form-control" name="tell"
															value="${f.tell}">
													</div>
													<div class="form-group row">
														<label for="filiere" class="col-sm-2 col-form-label">Filiere</label>
														<div class="col-sm-7">
															<select class="form-select"
																aria-label="Default select example" name="filiere">
																<c:forEach items="${filieres}" var="fil">
																	<option value="${fil.id}">${fil.name}</option>
																</c:forEach>
															</select> </select>
														</div>
													</div>
													<button type="submit" class="btn btn-primary">Update</button>
												</form>
											</div>
										</div>
									</div>
								</div>
							</td>
						</tr>

					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
