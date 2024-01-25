<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Project Manager</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/general.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="<c:url value='/' />">Inicio</a>
        <ul class="navbar-nav mr-auto">
          <li class="nav-item">
            <a class="nav-link" href="<c:url value='/register' />">REGISTRARSE</a>
          </li>
        </ul>
    </nav>
    <h1 style="text-align: center;">Table Master</h1>
    <div class="cus-container">
        <h2>LOG IN</h2>
        <p>
          <c:out value="${error}" />
        </p>
        <form method="post" action="/login">
          <div class="form-group">
            <label for="email">Email</label>
            <input type="text"class="form-control" id="email" name="email" placeholder="Ingresa tu email">
          </div>
          <div class="form-group">
            <label for="password">Password:</label>
            <input type="password"class="form-control" id="password" name="password" placeholder="Ingresa tu contraseña">
          </div>
          <button type="submit" class="btn btn-primary">Login</button>
        </form>
      </div>
    </div>
</body>
</html>