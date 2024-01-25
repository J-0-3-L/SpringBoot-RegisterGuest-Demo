<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
            <a class="nav-link" href="<c:url value='/login' />">INICIO DE SESION</a>
          </li>
        </ul>
    </nav>
    <h1 style="text-align: center;">Table Master</h1>
    <div class="cus-container">
        <h2>Registro</h2>
        <p>
          <form:errors path="user.*" />
        </p>
        <form:form method="POST" action="/register" modelAttribute="user">
          <div class="form-group">
            <form:label path="name">Name:</form:label>
            <form:input type="text" path="name" class="form-control" id="name" placeholder="Ingresa su nombre" />
          </div>
          <div class="form-group">
            <form:label path="email">Email:</form:label>
            <form:input type="email" path="email" class="form-control" id="email" placeholder="Ingresa el email" />
          </div>
          <div class="form-group">
            <form:label path="password">Password:</form:label>
            <form:password path="password" class="form-control" id="password" placeholder="Ingresa la contraseña" />
          </div>
          <div class="form-group">
            <form:label path="passwordConfirmation">Password Confirmation:</form:label>
            <form:password path="passwordConfirmation" class="form-control" id="passwordConfirmation" placeholder="Confirmar contraseña" />
          </div>
          <button type="submit" class="btn btn-primary">Registrarse</button>
        </form:form>
    </div>
</body>
</html>