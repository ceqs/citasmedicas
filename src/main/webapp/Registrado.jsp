<%-- 
    Document   : Registrado
    Created on : Mar 9, 2022, 10:56:03 PM
    Author     : ceqs
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cita registradae</title>
    </head>
    <body>
        <h2><b>Felicidades</b>: Su cita ha sido registrada</h2>
        <br>
        <br>
        <div>Para el <%=request.getAttribute("fecha")%> en el horario de : <%=request.getAttribute("horario")%>.
            Con el medico: <b><%=request.getAttribute("medico")%></b>
            <br><br>
            <b>IMPORTANTE: </b>No olvide llegar 30 minutos antes de su cita.
        </div>

    </body>
</html>
