<%-- 
    Document   : pagEspecial
    Created on : Jan 29, 2022, 3:30:39 PM
    Author     : ceqs
--%>

<%@page import="modelo.AlumnoNotas"%>
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
        <h2 class="alert-success">Lista de Alumnos</h2>
        <table class="table table-hover">
            <tr>
                <th>Codigo</th>
                <th>Apellido</th>
                <th>Nombre</th>
                <th>Parcial</th>
                <th>Final</th>
                <th>Promedio</th>
                <th>Observacion</th>
            </tr>
            <%
                List<AlumnoNotas> anotas = (List<AlumnoNotas>)request.getAttribute("dato");
                int aAprobados = 0;
                int aDesaprobados = 0;
                for(AlumnoNotas x : anotas) {
                    if(x.prom() >= 11.5) {
                        aAprobados++;
                    }
                    else {
                        aDesaprobados++;
                    }
            %>
            <tr style="background-color: <%=(x.prom() >= 11.5?"white":"#ea899a")%>">
                <td><%=x.getCoda()%></td>
                <td><%=x.getApe()%></td>
                <td><%=x.getNoma()%></td>
                <td><%=x.getExp()%></td>
                <td><%=x.getExf()%></td>
                <td><%=x.prom()%></td>
                <td><%=x.obser()%></td>
            </tr>
            <%
                }
            %>
        </table>
        <hr>
        <span>Numero de aprobados <%=aAprobados%></span><br>
        <span>Numero de desaprobados <%=aDesaprobados%></span><br>
    </body>
</html>

