<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding= "UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Table</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="<c:url value='/' />">Inicio</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value='/home' />">Regresar</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/logout">Logout</a>
            </li>
        </ul>
    </nav>
    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-sm-4">
                <h1>New Table</h1>
                <div class="card border rounded shadow">
                    <div class="card-body">
                        <form action="<c:url value='/mesas/new' />" method="post">
                            <div class="form-group">
                                <label for="guest_name">Guest Name:</label>
                                <input type="text" name="guest_name" value="${mesa.guest_name}" class="form-control" minlength="2" required>
                            </div>
                            <div class="form-group">
                                <label for="number_guest">Number of guest:</label>
                                <input type="number" name="number_guest" value="${mesa.number_guest}" class="form-control" required>   
                            </div>
                            <div class="form-group">
                                <label for="note">Notes:</label>
                                <input type="text" name="note" value="${mesa.note}" class="form-control" required>   
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                        <a class="nav-link" href="<c:url value='/home' />">Cancel</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>