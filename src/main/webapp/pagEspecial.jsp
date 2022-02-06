<%-- 
    Document   : pagEspecial
    Created on : Jan 29, 2022, 3:30:39 PM
    Author     : ceqs
--%>

<%@page import="modelo.Especial"%>
<%@page import="dao.Negocio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <h2 class="alert-success">Especialidades</h2>
        <table class="table table-hover">
            <tr>
                <th>Codigo</th>
                <th>Nombre</th>
                <th>Alumno</th>
            </tr>
            <%
                Negocio obj = new Negocio();
                for(Especial x : obj.lisEsp()) {
            %>
            <tr>
                <td><%=x.getCode()%></td>
                <td><%=x.getNoma()%></td>
                <td><a href="control?opc=1&cod=<%=x.getCode()%>">Alumno</a></td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
