<%-- 
    Document   : Menu.jsp
    Created on : Feb 13, 2022, 5:55:53 PM
    Author     : ceqs
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title>Citas Medicas - Clinica la Luna</title>

        <!-- Bootstrap CSS CDN -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <!-- Our Custom CSS -->
        <link rel="stylesheet" href="css/style.css">

        <!-- Font Awesome JS -->
        <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
        <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" crossorigin="anonymous"></script>

    </head>

    <body>

        <div class="wrapper">
            <!-- Sidebar Holder -->
            <nav id="sidebar">
                <div class="sidebar-header">
                    <h3>Clinica La Luna</h3>
                </div>

                <ul class="list-unstyled components">
                    <p>Bienvenid@: Carlos Quispe</p>
                    <li>
                        <a class="menu-options" href="ReservaCita.jsp">Reservar cita</a>
                    </li>
                    <li>
                        <a class="menu-options" href="Historial.jsp">Historial</a>
                    </li>
                    <li>
                        <a class="menu-options" href="DatosPersonales.jsp">Datos personales</a>
                    </li>
                    <li>
                        <a href="#adminSubmenu" data-bs-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Administración</a>
                        <ul class="collapse list-unstyled" id="adminSubmenu" data-bs-target="#adminSubmenu">
                            <li>
                                <a class="menu-options" href="pagEspecialidad.jsp">Especialidad</a>
                            </li>
                            <li>
                                <a class="menu-options" href="pagMedico.jsp">Medicos</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#seguridadSubmenu" data-bs-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Seguridad</a>
                        <ul class="collapse list-unstyled" id="seguridadSubmenu" data-bs-target="#seguridadSubmenu">
                            <li>
                                <a class="menu-options" href="Roles.jsp">Roles</a>
                            </li>
                            <li>
                                <a class="menu-options" href="Usuario.jsp">Usuarios</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </nav>


            <!-- Page Content Holder -->
            <div id="content">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <div class="container-fluid">

                        <button type="button" id="sidebarCollapse" class="navbar-btn">
                            <span></span>
                            <span></span>
                            <span></span>
                        </button>
                        <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <i class="fas fa-align-justify"></i>
                        </button>

                        <div class="collapse navbar-collapse flex-row-reverse" id="navbarSupportedContent">
                            <ul class="nav navbar-nav ml-auto">
                                <li class="nav-item active">
                                    <a class="nav-link" href="#">Cerrar sesión</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <!--
                <iframe id="iframeApplication" name="iframeApplication" class="embed-responsive-item" width="100%" height="100%"></iframe>
                -->
                <div id="content-options" class="embed-responsive-item"></div>
            </div>
        </div>



        <script type="text/javascript">
            $(document).ready(function () {
                $('#sidebarCollapse').on('click', function () {
                    $('#sidebar').toggleClass('active');
                    $(this).toggleClass('active');
                });
            });
            
            $(".menu-options").click(function(event) {
                event.preventDefault();
                var href = $(this).attr('href');
                //$( "#content-app" ).load(href);
                $.get(href, function( data ) {
                    data = data.replace('https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css', '')
                    $('#content-options').html( data );
                    //alert( "Load was performed." );
                });
            });
        </script>
    </body>

</html>
