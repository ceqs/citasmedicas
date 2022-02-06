<%-- 
    Document   : pagEspecial
    Created on : Jan 29, 2022, 3:30:39 PM
    Author     : ceqs
--%>

<%@page import="modelo.Curso"%>
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
        <h2 class="alert-success">Cursos</h2>
        <table class="table table-hover">
            <tr>
                <th>Codigo</th>
                <th>Nombre</th>
                <th>Alumno</th>
            </tr>
            <%
                Negocio obj = new Negocio();
                for(Curso x : obj.lisCursos()) {
            %>
            <tr>
                <td><%=x.getCodc()%></td>
                <td><%=x.getNomc()%></td>
                <td><a href="control?opc=3&cod=<%=x.getCodc()%>">Alumno</a></td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
