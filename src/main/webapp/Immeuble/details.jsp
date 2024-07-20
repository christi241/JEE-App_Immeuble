<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Détails de l'Unité de Location</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/CSS/bootstrap.min.css">
</head>

<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10">
            <div class="card mt-5">
                <div class="card-header">
                    <h4 class="card-title">Détails de l'Unité de Location</h4>
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <label for="numeroUnite">Numéro d'Unité:</label>
                        <p id="numeroUnite">${uniteLocation.numeroUnite}</p>
                    </div>
                    <div class="form-group">
                        <label for="nombrePieces">Nombre de Pièces:</label>
                        <p id="nombrePieces">${uniteLocation.nombrePieces}</p>
                    </div>
                    <div class="form-group">
                        <label for="superficie">Superficie:</label>
                        <p id="superficie">${uniteLocation.superficie}</p>
                    </div>
                    <div class="form-group">
                        <label for="loyer">Loyer:</label>
                        <p id="loyer">${uniteLocation.loyer}</p>
                    </div>
                    <div class="form-group">
                        <label for="immeuble">Immeuble:</label>
                        <p id="immeuble">${uniteLocation.immeuble.nom}</p>
                    </div>
                </div>
                <div class="card-footer text-right">
                    <a href="edit.po?id=${uniteLocation.id}" class="btn btn-primary">Modifier</a>
                    <a href="list.po" class="btn btn-secondary">Retour à la liste</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

</html>
