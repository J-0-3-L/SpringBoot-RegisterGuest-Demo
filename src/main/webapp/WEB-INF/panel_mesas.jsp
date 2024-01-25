<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding= "UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Project Manager Dashboard</title>
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" >
  </head>
  <body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item">
          <a class="nav-link" href="/home">Home</a>
        </li>
      </ul>
    </nav>
    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-sm-8">
                <h1>All tables</h1>
                <div class="table-responsive">
                    <table class="table table-bordered table-hover table-bordered">
                        <thead>
                            <tr>
                                <th>Guest Name</th>
				                <th># Guests</th>
				                <th>Arrived At</th>
                                <th>Server</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${mesas}" var="mesa">
                                <tr>
                                    <td>${mesa.guest_name}</td>
					                <td>${mesa.number_guest}</td>
					                <td>${mesa.createdAt}</td>
                                    <td>${mesa.user.name}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
  </body>
</html>
