<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding=
"UTF-8" %> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
          <a class="nav-link">Hello,<c:out value="${user.name}" /></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/logout">Logout</a>
        </li>
      </ul>
    </nav>
    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-sm-8">
                <h1>Mesas creadas por usuario:</h1>
                <div class="table-responsive">
                    <table class="table table-bordered table-hover table-bordered">
                        <thead>
                            <tr>
                                <th>Guest Name</th>
				                <th># Guests</th>
				                <th>Arrived At</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${mesas}" var="mesa">
                                <tr>
                                    <td>${mesa.guest_name}</td>
					                <td>${mesa.number_guest}</td>
					                <td>${mesa.createdAt}</td>
                                    <td><a href="<c:url value='/mesas/${mesa.id}/edit' />">Edit</a> | <a href="<c:url value='/mesas/${mesa.id}/delete' />">Finished</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <a href="/mesas/">See Other Tables</a> | <a href="/mesas/new">new mesa</a>
            </div>
        </div>
    </div>
  </body>
</html>
