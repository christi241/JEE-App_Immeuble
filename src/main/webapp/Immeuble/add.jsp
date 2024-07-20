
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajout Immeuble</title>
    <link type="text/css" rel="stylesheet" href="CSS/bootstrap.min.css">
</head>
<body>
<%@ include file="/topBar.jsp" %>
<div class="container">
    <h1 class="text-center text-primary">Ajouter un Immeuble</h1>
    <form action="/create.do" method="post" class="needs-validation" novalidate>
    <input type="hidden" name="action" value="ajouter">
        <div class="form-row">
            <div class="col-md-4 mb-3">
                <label for="nom">Nom</label>
                <input type="text" class="form-control is-valid" id="nom" name="nom" placeholder="Nom de l'immeuble" required>
                <div class="valid-feedback">
                    Looks good!
                </div>
            </div>
            <div class="col-md-4 mb-3">
                <label for="adresse">Adresse</label>
                <input type="text" class="form-control is-valid" id="adresse" name="adresse" placeholder="Adresse de l'immeuble" required>
                <div class="valid-feedback">
                    Looks good!
                </div>
            </div>
            <div class="col-md-4 mb-3">
                <label for="equipements">Équipements</label>
                <input type="text" class="form-control is-invalid" id="equipements" name="equipements" placeholder="Équipements" required>
                <div class="invalid-feedback">
                    Please provide a valid value.
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="col-md-12 mb-3">
                <label for="description">Description</label>
                <textarea class="form-control is-invalid" id="description" name="description" placeholder="Description de l'immeuble" required></textarea>
                <div class="invalid-feedback">
                    Please provide a valid value.
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input is-invalid" id="invalidCheck33" required>
                <label class="custom-control-label" for="invalidCheck33">Agree to terms and conditions</label>
                <div class="invalid-feedback">
                    You must agree before submitting.
                </div>
            </div>
        </div>
        <button class="btn btn-primary" type="submit">Ajouter Immeuble</button>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    (function () {
        'use strict';
        window.addEventListener('load', function () {
            var forms = document.getElementsByClassName('needs-validation');
            var validation = Array.prototype.filter.call(forms, function (form) {
                form.addEventListener('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
</script>
</body>
</html>
