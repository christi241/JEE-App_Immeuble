<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modifier Demande de Location</title>
    <!-- Inclure les CSS ou Bootstrap si nécessaire -->
</head>
<body>
<h1>Modifier Demande de Location</h1>
<form action="${pageContext.request.contextPath}/demandes" method="post">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="id" value="${demande.id}">
    <label for="statut">Statut:</label>
    <input type="text" id="statut" name="statut" value="${demande.statut}" required><br><br>

    <button type="submit">Modifier Demande</button>
</form>
</body>
</html>
