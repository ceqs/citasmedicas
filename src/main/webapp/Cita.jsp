<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="edu.utp.dwi.citasmedicas.dao.*"%>
<%@page import="edu.utp.dwi.citasmedicas.model.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        
        <link href="datatable/css/dataTables.bootstrap5.min.css" rel="stylesheet" type="text/css"/>
        <link href="datatable/css/fixedColumns.bootstrap5.min.css" rel="stylesheet" type="text/css"/>       

        <style>
            .rowT{
                padding-bottom: 10px;
            }          

        </style>
    </head>
    <body>
        <%
            EspecialidadDAO daoEspecialidad = new EspecialidadDAO();            
        %>
        <h4>Reserva de Citas</h4>

        <section id="main-content">
            <section class="wrapper">

                <div  class="row" style="margin-top: 15px;">
                    <div class="row">
                        <div class="col-lg-12">
                        </div>
                    </div>
                    <div class="row">
                        <form name="form_historial" id="form_historial">
                            <div class="form-group row rowT">
                                <div class="col-lg-4 row">
                                    <label class="col-sm-4 control-label">Fecha Inicio</label>
                                    <div class="col-sm-8">
                                        <input type="date" min="1920-01-01" max="2050-12-31" class="form-control" name="txtfechaI" id="txtfechaI">                                   
                                    </div>
                                </div>
                                <div class="col-lg-6 row">
                                    <label class="col-sm-3 control-label">Especialidad</label>
                                    <div class="col-sm-9">
                                        <select class="form-select" name="cboEspecial" id="cboEspecial">
                                            <option value="0">(TODOS)</option>
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
                                <div class="col-lg-2 row">
                                    <button type="button" class="btn btn-primary" id="btnBuscar">Grabar</button>
                                    <input type="hidden" name="opc", id="opc" value="4" >
                                    <input type="hidden" name="des_horario", id="opc" value="" >
                                    <input type="hidden" name="des_medico", id="opc" value="" >
                                </div>
                            </div>
                            <div class="form-group row rowT">
                                <div class="col-lg-4 row">
                                    <!--label class="col-sm-4 control-label">Fecha Fin</label-->
                                    <div class="col-sm-8">
                                        <!--input type="date" min="1920-01-01" max="2050-12-31" class="form-control" data-live-search="true" name="txtfechaF" id="txtfechaF"-->
                                    </div>
                                </div>
                                <div class="col-lg-6 row">
                                    <label class="col-sm-3 control-label">Medico</label>
                                    <div class="col-sm-9">
                                        <select class="form-select" name="cboMedico" id="cboMedico">
                                            <option value="0" selected="">(TODOS)</option>
                                        </select>
                                    </div>
                                </div>                               
                            </div>
                            <div class="form-group row rowT">
                                <div class="col-lg-4 row">
                                    <label class="col-sm-4 control-label">&nbsp;</label>
                                    <div class="col-sm-8">
                                        &nbsp;                                 
                                    </div>
                                </div>
                                <div class="col-lg-6 row">
                                    <label class="col-sm-3 control-label">Horarios Disponibles</label>
                                    <div class="col-sm-9">
                                        <select class="form-select" name="cboHorario" id="cboHorario">
                                            <option value="0" selected="">(TODOS)</option>
                                        </select>
                                    </div>
                                </div>                               
                            </div>                                        
                        </form>
                    </div>
                    <div class="col-sm-12" style="margin-top: 40px;">                        
                        <section class="panel">                           
                            <table id="tablaMaestra" class="table table-condensed dataTable">
                                <thead>
                                    <tr> 
                                        <th>&nbsp;</th>
                                        <th>&nbsp;</th>
                                        <th>&nbsp;</th>                                        
                                        <th>&nbsp;</th>
                                        <th>&nbsp;</th>                                        
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

        <script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>       
      
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


        <script src="datatable/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="datatable/js/dataTables.bootstrap5.min.js" type="text/javascript"></script>
        <script src="datatable/js/dataTables.responsive.min.js" type="text/javascript"></script>
        <script src="datatable/js/responsive.bootstrap5.min.js" type="text/javascript"></script>

        <script src="js/jsCita.js" type="text/javascript"></script> 

    </body>
</html>
