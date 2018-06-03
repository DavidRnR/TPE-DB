<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Dtop-Gestión</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="css/fontawesome-all.min.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/vanillaCalendar.css">
    <link rel="stylesheet" type="text/css" media="screen" href="css/style.css" />
</head>

<body>
    <div class="main-container">
        <nav class="navbar navbar-light bg-light">
            <a class="navbar-brand" id="home-nav">
                <img src="img/DGestLogo.png" width="30" height="30" class="d-inline-block align-top" alt="">
                <span class="brand-title">DGest</span>
            </a>

            <ul class="nav justify-content-end">
                <li class="nav-item">
                    <a class="nav-link active" href="#">Contacto</a>
                </li>
            </ul>
        </nav>

        <div class="container-fluid">
          <!-- Search Bar && Logo -->
          {include file="search-bar.tpl"}
          
          <!-- Dinamic HTML Loader -->
            <div id="dinamic-container">

            </div>
        </div>
        <!-- <footer class="footer">
            <span class="text-muted">Designed by CDM - 2018 -
                <a href="https://github.com/DavidRnR/TPE-DB" target="_blank" title="Github">
                    <i class="fab fa-github" aria-hidden="true"></i>
                </a>
            </span>
        </footer> -->
    </div>


</body>

</html>
<script src="js/jquery-3.3.1.slim.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/vanillaCalendar.js"></script>
<script src="js/main.js"></script>