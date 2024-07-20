<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Demandes de Location</title>
    <!-- Inclure les CSS ou Bootstrap si nécessaire -->
</head>
<body>
<h1>Liste des Demandes de Location</h1>

<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Locataire</th>
        <th>Offre de Location</th>
        <th>Statut</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${demandes}" var="demande">
        <tr>
            <td>${demande.id}</td>
            <td>${demande.locataire.nom}</td>
            <td>${demande.offreLocation.nom}</td>
            <td>${demande.statut}</td>
            <td>
                <a href="${pageContext.request.contextPath}/demandes/edit?id=${demande.id}">Modifier</a>
                <form action="${pageContext.request.contextPath}/demandes/delete" method="post" style="display: inline;">
                    <input type="hidden" name="id" value="${demande.id}">
                    <button type="submit">Supprimer</button>
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<h2>Ajouter une Demande de Location</h2>
<form action="${pageContext.request.contextPath}/demandes" method="post">
    <input type="hidden" name="action" value="save">
    <label for="locataireId">ID du Locataire:</label>
    <input type="text" id="locataireId" name="locataireId" required><br><br>

    <label for="offreId">ID de l'Offre de Location:</label>
    <input type="text" id="offreId" name="offreId" required><br><br>

    <label for="statut">Statut:</label>
    <input type="text" id="statut" name="statut" required><br><br>

    <button type="submit">Ajouter Demande</button>
</form>
</body>
</html>
