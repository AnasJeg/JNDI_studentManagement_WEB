<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Role Management</title>
    <link rel="stylesheet" type="text/css" href="bootstrap/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>

<div class="container">
    <h1>Role Form:</h1>
    <div class="card">
        <div class="card-body">
            <form action="<%=request.getContextPath()%>/RoleServlet" method="post">
                <div class="form-group row">
                    <label for="name" class="col-sm-2 col-form-label">Name</label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" name="name" placeholder="Enter name">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary" name="action" value="add">Submit</button>
            </form>
        </div>
    </div>
</div>

<br/>
<br/>

<div class="container">
    <h1>Role Table:</h1>
    <div class="card">
        <div class="card-body">
            <table class="table table-bordered">
                <thead class="thead-light">
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Name</th>
                        <th scope="col">Actions</th>
                    </tr>
                </thead>
                <c:forEach items="${rl}" var="r">
                   <tr>
    <td>${r.id}</td>
    <td>${r.name}</td>
    <td>
        <div class="btn-group" role="group">

            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#updateModal${r.id}">
                <i class="fas fa-edit"></i>
            </button>
            
            <form action="<%=request.getContextPath()%>/RoleServlet" method="post">
                <input type="hidden" name="action" value="del" />
                <input type="hidden" name="id" value="${r.id}" />
                <button type="submit" class="btn btn-danger"><i class="far fa-trash-alt"></i></button>
            </form>
        </div>

        <div class="modal fade" id="updateModal${r.id}" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="updateModalLabel">Update Role</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="<%=request.getContextPath()%>/RoleServlet" method="post">
                            <input type="hidden" name="action" value="update" />
                            <input type="hidden" name="id" value="${r.id}" />
                            <div class="form-group">
                                <label for="updateName">Name:</label>
                                <input type="text" class="form-control" id="updateName" name="name" value="${r.name}">
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

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
