<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Your Page Title</title>
    <link rel="stylesheet" type="text/css" href="bootstrap/bootstrap.min.css" />
</head>
<body>

    <header class="bg-dark text-white">
        <div class="container">
            <h1>TP</h1>
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="#" onclick="loadPage('RoleServlet')">Role</a></li>
                    <li class="nav-item"><a class="nav-link" href="#" onclick="loadPage('FiliereServlet')">Filiere</a></li>
                    <li class="nav-item"><a class="nav-link" href="#" onclick="loadPage('StudentServlet')">Student</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <div class="container mt-4" id="body">

    </div>

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        function loadPage(path) {
            $("#body").load(path);
        }
    </script>

</body>
</html>
