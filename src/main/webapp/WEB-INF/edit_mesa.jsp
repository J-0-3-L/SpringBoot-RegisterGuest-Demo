<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding= "UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create a Task</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="<c:url value='/home' />">Inicio</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/logout">Logout</a>
            </li>
        </ul>
    </nav>
    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-sm-4">
                <h1>Edit table</h1>
                <div class="card border rounded shadow">
                    <div class="card-body">
                        <form action="<c:url value='/mesas/${mesa.id}/edit' />" method="post">
                            <div class="form-group">
                                <label for="guest_name">Guest Name:</label>
                                <input type="text" name="guest_name" value="${mesa.guest_name}" class="form-control" minlength="3" required>
                            </div>
                            <div class="form-group">
                                <label for="number_guest">Number of guest:</label>
                                <input type="text" name="number_guest" value="${mesa.number_guest}" class="form-control" required>   
                            </div>
                            <div class="form-group">
                                <label for="note">Notes:</label>
                                <input type="text" name="note" value="${mesa.note}" class="form-control" required>   
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                        <a class="btn btn-success" href="<c:url value='/home' />">Cancel</a>
                        <button type="button" class="btn btn-danger" data-toggle="modal" id="confirmDeleteButton" data-target="#deleteModal">Delete</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteModalLabel">Confirma eliminacion</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    ¿Está seguro de que desea eliminar esta mesa?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-danger" id="confirmDelete">Delete</button>
                </div>
            </div>
        </div>
    </div>
    
    <script>
        document.getElementById("confirmDeleteButton").addEventListener("click", function() {
            var deleteModal = `
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="deleteModalLabel">Confirm Deletion</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            ¿Está seguro de que desea eliminar esta mesa?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                            <button type="button" class="btn btn-danger" id="confirmDelete">Delete</button>
                        </div>
                    </div>
                </div>`;
                
            var deleteModalContainer = document.getElementById("deleteModal");
            deleteModalContainer.innerHTML = deleteModal;
            $('#deleteModal').modal('show');
            
            document.getElementById("confirmDelete").addEventListener("click", function() {
                var deleteUrl = "<c:url value='/mesas/${mesa.id}/delete' />";
                window.location.href = deleteUrl;
            });
        });
    </script>  
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>