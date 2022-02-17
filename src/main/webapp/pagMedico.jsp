<%@page import="edu.utp.dwi.citasmedicas.dao.EspecialidadDAO"%>
<%@page import="edu.utp.dwi.citasmedicas.model.Especialidad"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!--<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/> -->
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <link href="datatable/css/dataTables.bootstrap5.min.css" rel="stylesheet" type="text/css"/>
        <link href="datatable/css/fixedColumns.bootstrap5.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <!<!-- https://getbootstrap.com/docs/4.3/components/forms/ -->

        <%
            EspecialidadDAO daoEspecialidad = new EspecialidadDAO();
        %>

        <section id="main-content">
            <section class="wrapper">
                <div  class="row" style="margin-top: 15px;">
                    <div class="row">
                        <div class="col-lg-12">
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <section class="panel">
                            <nav class="navbar header-datatable">
                                <div class="container-fluid">
                                    <div><b>Listado de Médicos</b></div>
                                    <a id="btnNuevo" class="btn btn-primary flex-row-reverse" data-toggle="modal" onclick="nuevo()">Nuevo Ingreso</a>
                                </div>
                            </nav>
                            <table id="tablaMaestra" class="table table-condensed dataTable">
                                <thead>
                                    <tr>                                       
                                        <th>Código</th>
                                        <th>Nombre del Médico</th>
                                        <th>Genero</th>
                                        <th>Fec.Nac.</th>
                                        <th>DNI</th>                                        
                                        <th>Celular</th>
                                        <th>Email</th>
                                        <th>Especialidad</th>
                                        <th>Editar</th>
                                        <th>Anular</th>
                                    </tr>
                                </thead>
                                <tbody id="tblMaestraBody">
                                </tbody>
                            </table>
                        </section>
                    </div>
                </div>
            </section>
        </section>


        <div class="modal" tabindex="-1" role="dialog" id="modalInfoMed" aria-hidden="false" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Registro de Médico</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form id="form_medico">
                            <div class="form-group row">
                                <label class="col-sm-3 control-label">Código</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="txtcodigo" id="txtcodigo" placeholder="Código" readonly="">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 control-label">Apellidos</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="txtapellido" id="txtapellido" placeholder="Apellidos" maxlength="45">
                                </div>
                            </div>  
                            <div class="form-group row">
                                <label class="col-sm-3 control-label">Nombres</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="txtnombre" id="txtnombre" placeholder="Nombres" maxlength="45">
                                </div>
                            </div>  
                            <div class="form-group row">
                                <label class="col-sm-3 control-label">Género</label>
                                <div class="col-sm-9">
                                    <div class="form-check form-check-inline">                                        
                                        <label class="form-check-label">
                                            <input class="form-check-input" type="radio" name="rdGenero" id="rdgeneroM" value="M" checked="">
                                            Masculino
                                        </label>
                                    </div>
                                    <div class="form-check form-check-inline">                                        
                                        <label class="form-check-label">
                                            <input class="form-check-input" type="radio" name="rdGenero" id="rdgeneroF" value="F">
                                            Femenino
                                        </label>
                                    </div>
                                </div>
                            </div>  
                            <div class="form-group row">
                                <label class="col-sm-3 control-label">Fecha nac.</label>
                                <div class="col-sm-9">
                                    <input type="date" min="1920-01-01" max="2050-12-31" class="form-control" name="txtdate" id="txtdate">                                   
                                </div>
                            </div>  
                            <div class="form-group row">
                                <label class="col-sm-3 control-label">DNI</label>
                                <div class="col-sm-9">
                                    <input type="number" class="form-control" name="txtDNI" id="txtDNI">
                                </div>
                            </div>  
                            <div class="form-group row">
                                <label class="col-sm-3 control-label">Celular</label>
                                <div class="col-sm-9">
                                    <input type="number" class="form-control" name="txtphone" id="txtphone">
                                </div>
                            </div>  
                            <div class="form-group row">
                                <label class="col-sm-3 control-label">Email</label>
                                <div class="col-sm-9">
                                    <input type="email" class="form-control" name="txtemail" id="txtemail" placeholder="Email" maxlength="60">
                                </div>
                            </div>  
                            <div class="form-group row">
                                <label class="col-sm-3 control-label">Especialidad</label>
                                <div class="col-sm-9">
                                    <select class="custom-select" name="cboespecialidad" id="cboespecialidad">                                        
                                        <%
                                            for (Especialidad x : daoEspecialidad.getLista()) {
                                        %>
                                        <option value="<%=x.getIdEspecialidad()%>"><%= x.getNomEspecialidad()%></option>                                                
                                        <%
                                            }
                                        %>                                       
                                    </select>
                                </div>
                            </div>  
                            <input type="hidden" id="opc" name="opc" value="1">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" id="btnGuardar">Guardar</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>

        <script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>       
        <!-- <script src="js/bootstrap.min.js" type="text/javascript"></script> -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


        <script src="datatable/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="datatable/js/dataTables.bootstrap5.min.js" type="text/javascript"></script>
        <script src="datatable/js/dataTables.responsive.min.js" type="text/javascript"></script>
        <script src="datatable/js/responsive.bootstrap5.min.js" type="text/javascript"></script>

        <script src="js/jsMedico.js" type="text/javascript"></script> 

    </body>
</html>
