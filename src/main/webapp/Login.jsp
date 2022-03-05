<%-- 
    Document   : login2.jsp
    Created on : Mar 5, 2022, 10:04:42 AM
    Author     : ceqs
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <style>
          .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
          }

          @media (min-width: 768px) {
            .bd-placeholder-img-lg {
              font-size: 3.5rem;
            }
          }
        </style>
        <link href="css/signin.css" rel="stylesheet">
    </head>
    <body class="text-center">
        <main class="form-signin">
            <form action="login" method="post">
                <input name="opc" type="hidden" value="1">
                <img class="mb-4" src="imagenes/Logo.jpg" alt="" width="72" height="57">
                <h1 class="h3 mb-3 fw-normal">Bienvenido</h1>

                <div class="form-floating">
                  <input name="username" type="text" class="form-control" id="floatingInput" placeholder="Ingrese usuario">
                  <label for="floatingInput">Usuario</label>
                </div>
                <br>
                <div class="form-floating">
                  <input name="password" type="password" class="form-control" id="floatingPassword" placeholder="Ingrese password">
                  <label for="floatingPassword">Password</label>
                </div>

                <div class="checkbox mb-3">
                  <label>
                    <input type="checkbox" value="remember-me">&nbsp;Mantenerse conectado
                  </label>
                </div>
                
                <button class="w-100 btn btn-lg btn-primary" type="submit">Iniciar sesi&oacute;n</button>
                <br><br>
                <button class="w-100 btn btn-lg btn-secondary" type="submit">Registrarse</button>
                
                <p class="mt-5 mb-3 text-muted">&copy; 2022</p>
            </form>
        </main>
  </body>
</html>
