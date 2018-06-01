<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Dtop-Gestión</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/fontawesome-all.min.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/style.css" />
</head>

<body>

    <nav class="navbar navbar-light bg-light">
        <a class="navbar-brand" href="#">
            <img src="img/DGestLogo.png" width="30" height="30" class="d-inline-block align-top" alt="">
            <span class="brand-title">DGest</span>
        </a>

        <ul class="nav justify-content-end">
            <li class="nav-item">
                <a class="nav-link active" href="#">Contacto</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Nosotros</a>
            </li>
        </ul>
    </nav>

    <div class="container-fluid">

        <div class="row col-12 search-bar">
            <div class="col-3 logo-home">
                <!-- Contains logo -->
            </div>
            <div class="col-5 align-self-center">
                <form class="form-inline">
                    <div class="col-9 mb-2">
                        <input type="password" class="form-control" placeholder="Departamento">
                    </div>
                    <button type="submit" class="btn btn-primary mb-2">
                        <i class="fas fa-search" aria-hidden="true"></i>
                    </button>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="card-columns">
                    {foreach from=$departamentos key=index item=depto}
                    <div class="card">
                        <img class="card-img-top" src="img/deptoTest.jpg" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">Departamento</h5>
                            <p class="card-text">{$depto.descripcion}</p>
                            <p class="card-text">Superficie: {$depto.superficie}m<sup>2</sup></p>
                            <p class="card-text">Ubicación: {$depto.ciudad}</p>
                            <a href="#" class="btn btn-primary">Reservar</a>
                        </div>
                    </div>
                    {/foreach}
                </div>
            </div>

        </div>

    </div>
    <footer class="footer">
        <span class="text-muted">Designed by CDM - 2018 -
            <a href="https://github.com/DavidRnR/TPE-DB" target="_blank" title="Github">
                <i class="fab fa-github" aria-hidden="true"></i>
            </a>
        </span>
    </footer>
</body>

</html>
<script src="js/jquery-3.3.1.slim.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>