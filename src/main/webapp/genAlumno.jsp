<%-- 
    Document   : pagEspecial
    Created on : Jan 29, 2022, 3:30:39 PM
    Author     : ceqs
--%>

<%@page import="dao.Negocio"%>
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
        <%
            Negocio obj = new Negocio();
        %>
        <h2 class="alert-success">Lista de Alumnos</h2>
        <a href="regAlumno.jsp">Nuevo Alumno</a>
        <table class="table table-hover">
            <tr>
                <th>Codigo</th>
                <th>Apellido</th>
                <th>Nombre</th>
                <th>Especialidad</th>
                <th>Procedencia</th>
                <th>Foto</th>
                <th>Editar</th>
                <th>Anular</th>
            </tr>
            <%
                for(Alumno x : obj.lisGenAlumno()) {
            %>
            <tr>
                <td><%=x.getCoda()%></td>
                <td><%=x.getApe()%></td>
                <td><%=x.getNoma()%></td>
                <td><%=x.getCode()%></td>
                <td><%=x.getProce()%></td>
                <td><img src="fotos/<%=x.getCoda()%>.jpg" width="90" height="90" class="img-circle" onerror="src='fotos/sin_foto.jpg'"></td>
                <td><a href="control?opc=4&cod=<%=x.getCoda()%>"><img src="botones/Edit.gif" alt="alt"/></a></td>
                <td><a href="control?opc=5&cod=<%=x.getCoda()%>"><img src="botones/eliminar.png" alt="alt"/></a></td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
