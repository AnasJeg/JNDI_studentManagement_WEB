<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Filter</title>
    <link rel="stylesheet" type="text/css" href="bootstrap/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>

<div class="container mt-4">
    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Select Filiere:</h4>
                    <form action="<%=request.getContextPath()%>/StudentByFiliere" method="post">
                        <div class="form-group">
                            <label for="filiere">Filiere:</label>
                            <select class="form-control" name="filiere" id="filiere">
                                <c:forEach var="filiere" items="${filieres}">
                                    <option value="${filiere.id}">${filiere.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary" name="filter">Filter</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="row mt-4">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Student Table:</h4>
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
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="bootstrap/bootstrap.bundle.min.js"></script>
</body>
</html>
