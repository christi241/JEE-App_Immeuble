<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <link type="text/css" rel="stylesheet" href="CSS/bootstrap.min.css">
    <title>Application Immeuble | Liste</title>

</head>
<body>
<%@ include file="/topBar.jsp" %>

<div class="container mt-5">
    <a href="add.jsp" class="btn btn-primary btn-lg mx-2">Ajouter un Immeuble</a>
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
                <c:forEach var="immeuble" items="${immeubleModel.immeubles}">
                    <tr>
                        <td>${immeuble.nom}</td>
                        <td>${immeuble.adresse}</td>
                        <td>${immeuble.equipements}</td>
                        <td>${immeuble.description}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/edit.do?id=${immeuble.id}" class="btn btn-warning">Modifier</a>
                            <a href="${pageContext.request.contextPath}/delete.do?id=${immeuble.id}" class="btn btn-danger" onclick="return confirm('Êtes-vous sûr de vouloir supprimer cet immeuble?');">Supprimer</a>
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
