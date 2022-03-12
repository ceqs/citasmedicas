<%-- 
    Document   : Grafico1.jsp
    Created on : Feb 12, 2022, 4:54:06 PM
    Author     : ceqs
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <link href="datatable/css/dataTables.bootstrap5.min.css" rel="stylesheet" type="text/css"/>
        <link href="datatable/css/fixedColumns.bootstrap5.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>Graficar ventas</h1>
        <form action="grafico" target="win">
            <div class="form-group">
                <span>Ingrese año:</span>
                <input name="anio" class="form-control">
            </div>
            <div class="form-group">
                <span>Tipo de grafico:</span>
                <select name="tipo" class="form-control">
                    <option value="1">Barra</option>
                    <option value="2">Torta</option>
                    <option value="3">Lineal</option>
                </select>
            </div>
            <div class="form-group">
                <button class="btn btn-primary" type="submit">Mostrar</button>
            </div>
        </form>
        <iframe name="win" height="500" width="500"></iframe>
    </body>
</html>
