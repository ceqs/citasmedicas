<%-- 
    Document   : pagEspecial
    Created on : Jan 29, 2022, 3:30:39 PM
    Author     : ceqs
--%>

<%@page import="modelo.Notas"%>
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
        <h2 class="alert-success">Lista de Notas del: <%=request.getAttribute("ape")%>, <%=request.getAttribute("nom")%></h2>
        <table class="table table-hover">
            <tr>
                <th>Codigo</th>
                <th>Curso</th>
                <th>Parcial</th>
                <th>Final</th>
                <th>Promedio</th>
                <th>Observacion</th>
            </tr>
            <%
                List<Notas> notas = (List<Notas>)request.getAttribute("dato");
                for(Notas x : notas) {                    
            %>
            <tr>
                <td><%=x.getCodc()%></td>
                <td><%=x.getNomc()%></td>
                <td><%=x.getExp()%></td>
                <td><%=x.getExf()%></td>
                <td><%=x.prom()%></td>
                <td><%=x.obser()%></td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
