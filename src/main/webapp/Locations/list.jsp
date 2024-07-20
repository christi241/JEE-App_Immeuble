<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Application Immeuble | Liste</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          integrity="sha384-JcKb8q3iqJ61gNVgO1qKm5bFpyjXy0EcYmP3Wxg3lJVUTD5KZsVVWFPjqswtkIkk"
          crossorigin="anonymous">
</head>
<body>
<%@include file="../topBar.jsp "%>
<div class="container mt-5">
    <div class="card">
        <div class="card-header">Liste des Immeubles</div>
        <div class="card-body">
            <form action="search.do" method="get" class="mb-3">
                <div class="form-group">
                    <label for="motCle">Mot Clé</label>
                    <input type="text" id="motCle" name="motCle" class="form-control">
                </div>
                <button type="submit" class="btn btn-success">Rechercher</button>
            </form>
            <table class="table table-striped">
                <thead class="thead-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Nom</th>
                    <th scope="col">Adresse</th>
                    <th scope="col">Détails</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${immeubles}" var="immeuble">
                    <tr>
                        <td>${immeuble.id}</td>
                        <td>${immeuble.nom}</td>
                        <td>${immeuble.adresse}</td>
                        <td>${immeuble.details}</td>
                        <td>
                            <a href="edit.do?id=${immeuble.id}" class="btn btn-warning">Modifier</a>
                            <a href="delete.do?id=${immeuble.id}" class="btn btn-danger">Supprimer</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
