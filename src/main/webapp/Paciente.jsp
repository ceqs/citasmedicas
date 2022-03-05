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
            <form action="paciente" method="post">
                <input name="opc" type="hidden" value="1">
                <img class="mb-4" src="imagenes/Logo.jpg" alt="" width="72" height="57">
                <h1 class="h3 mb-3 fw-normal">Nuevo Paciente</h1>
                <div>El numero de documento sera su usuario</div>
                <div class="form-floating">
                  <input name="tipodoc" type="text" class="form-control" id="floatingInput" placeholder="Tipo Documento">
                  <label for="floatingInput">Tipo documento</label>
                </div>
                <br>
                
                <div class="form-floating">
                  <input name="numdoc" type="text" class="form-control" id="floatingInput" placeholder="Numero documento">
                  <label for="floatingInput">Numero documento</label>
                </div>
                <br>

                <div class="form-floating">
                  <input name="apepaterno" type="text" class="form-control" id="floatingInput" placeholder="Apellido paterno">
                  <label for="floatingInput">Apellido paterno</label>
                </div>
                <br>

                <div class="form-floating">
                  <input name="apematerno" type="text" class="form-control" id="floatingInput" placeholder="Apellido materno">
                  <label for="floatingInput">Apellido materno</label>
                </div>
                <br>
                
                <div class="form-floating">
                  <input name="nombres" type="text" class="form-control" id="floatingInput" placeholder="Nombres">
                  <label for="floatingInput">Nombres</label>
                </div>
                <br>

                <div class="form-floating">
                  <input name="telefono" type="tel" class="form-control" id="floatingInput" placeholder="Telefono">
                  <label for="floatingInput">Telefono</label>
                </div>
                <br>
                
                <div class="form-floating">
                    <input name="celular" type="tel" class="form-control" id="floatingInput" placeholder="Celular">
                  <label for="floatingInput">Celular</label>
                </div>
                <br>
                
                <div class="form-floating">
                  <input name="email" type="email" class="form-control" id="floatingInput" placeholder="email">
                  <label for="floatingInput">Celular</label>
                </div>
                <br>
                
                <div class="form-floating">
                  <input name="fecnacimiento" type="date" class="form-control" id="floatingInput" placeholder="Fecha Nacimiento">
                  <label for="floatingInput">Fecha de Nacimiento</label>
                </div>
                <br>
                
                <div class="form-floating">
                  <input name="sexo" type="text" class="form-control" id="floatingInput" placeholder="Sexo">
                  <label for="floatingInput">Sexo</label>
                </div>
                <br>
                
                <div class="form-floating">
                  <input name="password" type="password" class="form-control" id="floatingPassword" placeholder="Ingrese password">
                  <label for="floatingPassword">Password</label>
                </div>
                <br>
                <button class="w-100 btn btn-lg btn-primary" type="submit">Grabar</button>
                
                <p class="mt-5 mb-3 text-muted">&copy; 2022</p>
            </form>
        </main>
  </body>
</html>
