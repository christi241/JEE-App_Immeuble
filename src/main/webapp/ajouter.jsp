<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/CSS/bootstrap.min.css">
    <title>Ajouter un Utilisateur</title>
</head>
<body>
<%@ include file="/topBar.jsp" %>

<div class="container mt-5">
    <div class="card">
        <div class="card-header">Ajouter un Utilisateur</div>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/UtilisateurServlet?action=inscription" method="post">
                <div class="form-group">
                    <label for="nom">Nom</label>
                    <input type="text" id="nom" name="nom" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="prenom">Prénom</label>
                    <input type="text" id="prenom" name="prenom" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="motDePasse">Mot de Passe</label>
                    <input type="password" id="motDePasse" name="motDePasse" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="role">Rôle</label>
                    <select id="role" name="role" class="form-control" required>
                        <option value="LOCATAIRE">Locataire</option>
                        <option value="ADMIN">Administrateur</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-success">Ajouter</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
