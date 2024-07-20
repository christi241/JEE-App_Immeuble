<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/CSS/bootstrap.min.css">
    <title>Liste des Utilisateurs</title>
</head>
<body>
<%@ include file="/topBar.jsp" %>

<div class="container mt-5">
    <a href="${pageContext.request.contextPath}/utilisateur/ajouter.jsp" class="btn btn-primary btn-lg mx-2">Ajouter un Utilisateur</a>
    <div class="card">
        <div class="card-header">Liste des Utilisateurs</div>
        <div class="card-body">
            <table class="table table-striped">
                <thead class="thead-primary">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Nom</th>
                    <th scope="col">Prénom</th>
                    <th scope="col">Email</th>
                    <th scope="col">Role</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${utilisateurs}" var="utilisateur">
                    <tr>
                        <td>${utilisateur.id}</td>
                        <td>${utilisateur.nom}</td>
                        <td>${utilisateur.prenom}</td>
                        <td>${utilisateur.email}</td>
                        <td>${utilisateur.role}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/utilisateur/modifier.jsp?id=${utilisateur.id}" class="btn btn-warning">Modifier</a>
                            <a href="${pageContext.request.contextPath}/utilisateur/details.jsp?id=${utilisateur.id}" class="btn btn-info">Détails</a>
                            <a href="${pageContext.request.contextPath}/utilisateur/supprimer.do?id=${utilisateur.id}" class="btn btn-danger" onclick="return confirm('Êtes-vous sûr de vouloir supprimer cet utilisateur?');">Supprimer</a>
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
