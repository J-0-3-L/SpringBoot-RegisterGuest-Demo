<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding= "UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Project Manager</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="<c:url value='/' />">Inicio</a>
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="<c:url value='/login' />">INICIO DE SESION</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value='/register' />">REGISTRARSE</a>
            </li>
        </ul>
    </nav>
    <div class="container mt-4">
        <div class="row justify-content-center">
            <H1>BIENVENIDO MESERO</H1>
            <p>El usuario logeado solo puede ver su creacion, si desea ver las mesas agregadas de los demas le sugiero dar click en "See Other Tables" pero una vez que este logeado</p>
        </div>
    </div>
</body>
</html>