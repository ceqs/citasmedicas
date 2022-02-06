<%-- 
    Document   : pagEspecial
    Created on : Jan 29, 2022, 3:30:39 PM
    Author     : ceqs
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Alumno"%>
<%@page import="modelo.Especial"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <h2 class="alert-success">Lista de Alumnos</h2>
        <table class="table table-hover">
            <tr>
                <th>Codigo</th>
                <th>Apellido</th>
                <th>Nombre</th>
                <th>Foto</th>
                <th>Notas</th>
            </tr>
            <%
                List<Alumno> alumnos = (List<Alumno>)request.getAttribute("dato");
                for(Alumno x : alumnos) {                    
            %>
            <tr>
                <td><%=x.getCoda()%></td>
                <td><%=x.getApe()%></td>
                <td><%=x.getNoma()%></td>
                <td><img src="fotos/<%=x.getCoda()%>.jpg" width="90" height="90" class="img-circle" onerror="src='fotos/sin_foto.jpg'"></td>
                <td><a href="control?opc=2&cod=<%=x.getCoda()%>&ape=<%=x.getApe()%>&nom=<%=x.getNoma()%>">Notas</a></td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
