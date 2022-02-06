<%-- 
    Document   : regAlumno
    Created on : 30/03/2018, 09:04:51 AM
    Author     : Administrador
--%>

<%@page import="modelo.Especial"%>
<%@page import="dao.Negocio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-theme.css">
<link rel="stylesheet" href="css/bootstrapValidator.css">

<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/bootstrapValidator.js"></script>

<title>Registra Alumno</title>
</head>

<body>

<div class="container">
<h1>Registra Alumno</h1>
	<form action="control" id="id_form" method="post"> 
			<input type="hidden" name="opc" value="6">	
			<div class="form-group">
				<label class="control-label" for="id_nombre">Nombres</label>
				<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_apellido">Apellido</label>
				<input class="form-control" type="text" id="id_apellido" name="apellido" placeholder="Ingrese el apellido">
			</div>
			<div class="form-group">
				<label class="control-label">Especialidad</label>
                                <select name="cbe" class="form-control">
                                <%
                                    Negocio obj = new Negocio();
                                    for(Especial x: obj.lisEsp()) {
                                %>
                                    <option value="<%=x.getCode()%>"><%=x.getNoma()%></option>
                                <%
                                    }
                                %>
                                </select>
			</div>
			<div class="form-group">
                            <label class="control-label" for="id_apellido">Apellido</label>
                            <div>
                                <input type="radio" name="tipo" value="N">Nacional
                            </div>
                            <div>
                                <input type="radio" name="tipo" value="P">Particular
                            </div>
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary" >Crea Alumno</button>
			</div>
	</form>
</div>


<script type="text/javascript">
$(document).ready(function() {
    $('#id_form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	nombre: {
                validators: {
                    notEmpty: {
                        message: 'El nombre es un campo obligatorio'
                    },
              regexp:{
            	  regexp: /^[A-Za-z ñÑ]+$/,
            	  message: 'Solo letras o espacios'
            	  
              }
                }
            },
        	apellido: {
                validators: {
                    notEmpty: {
                        message: 'El apellido es un campo obligatorio'
                    }
                }
            },
        	edad: {
                validators: {
                    notEmpty: {
                        message: 'La edad es un campo obligatorio'
                    },
		            lessThan: {
		                value: 45,
		                inclusive: true,
		                message: 'La edad es menor a 45'
		            },
		            greaterThan: {
		                value: 18,
		                inclusive: true,
		                message: 'La edad es mayor a 18'
		            }
                }
            },            
        }   
    });

    // Validate the form manually
    $('#validateBtn').click(function() {
        $('#id_form').bootstrapValidator('validate');
    });
});
</script>

</body>
</html>


