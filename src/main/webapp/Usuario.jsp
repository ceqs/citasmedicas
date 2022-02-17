<%@page import="edu.utp.dwi.citasmedicas.dao.RolDAO"%>
<%@page import="edu.utp.dwi.citasmedicas.model.Rol"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios</title>
    </head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="datatable/css/dataTables.bootstrap5.min.css" rel="stylesheet" type="text/css"/>
    <link href="datatable/css/fixedColumns.bootstrap5.min.css" rel="stylesheet" type="text/css"/>
    
    <body>
        
        <section>
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
                                    <div><b>Usuarios</b></div>
                                    <a class="btn btn-primary flex-row-reverse" data-toggle="modal" onclick="nuevo()">Nuevo Ingreso</a>
                                </div>
                            </nav>
                            <table id="tbl_maestra_usuario" class="table table-condensed dataTable">
                                <thead>
                                    <tr>
                                        <th>Item</th>
                                        <th>Usuario</th>
                                        <th>Password</th>
                                        <th>Rol</th>
                                        <th>Habilitado</th>
                                        <th>Editar</th>
                                        <th>Anular</th>
                                    </tr>
                                </thead>
                                <tbody id="tbl_maestra_body_usuario">
                                </tbody>
                            </table>
                        </section>
                    </div>
                </div>
            </section>
        </section>
        
        <div class="modal" tabindex="-1" role="dialog" id="modal_usuario" aria-hidden="false" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Usuarios</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="form_usuario" method="post">
                            <div class="form-group">
                                <label>Usuario</label>
                                <input type="text" class="form-control" id="txtusuario_usuario" name="txtusuario">
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input type="password" class="form-control" id="txtpassword_usuario" name="txtpassword">
                            </div> 
                            <div class="form-group row">
                                <label class="col-sm-3 control-label">Rol</label>
                                <div class="col-sm-9">
                                    <select class="custom-select" name="cborol" id="cborol_usuario">                                        
                                        <%
                                            RolDAO daoRol = new RolDAO();
                                            for (Rol x : daoRol.getLista()) {
                                        %>
                                        <option value="<%=x.getIdRol()%>"><%= x.getNomRol()%></option>                                                
                                        <%
                                            }
                                        %>                                       
                                    </select>
                                </div>
                            </div>  
                            <div class="form-group row">
                                <label class="col-sm-3 control-label">Habilitado</label>
                                <div class="col-sm-9">
                                    <div class="form-check form-check-inline">                                        
                                        <label class="form-check-label">
                                            <input class="form-check-input" type="radio" name="rdenabled" id="rdenabledsi_usuario" value="true" checked="">
                                            SI
                                        </label>
                                    </div>
                                    <div class="form-check form-check-inline">                                        
                                        <label class="form-check-label">
                                            <input class="form-check-input" type="radio" name="rdenabled" id="rdenabledno_usuario" value="false">
                                            NO
                                        </label>
                                    </div>
                                </div>
                            </div> 
                            <input type="hidden" id="opc_usuario" name="opc" value="1">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" id="btn_guardar_usuario">Guardar</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
        
         <script src="js/jquery-1.10.2.min.js" type="text/javascript"></script> 
        <!--<script src="js/bootstrap.min.js" type="text/javascript"></script> -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="datatable/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="datatable/js/dataTables.bootstrap5.min.js" type="text/javascript"></script>
        <script src="datatable/js/dataTables.responsive.min.js" type="text/javascript"></script>
        <script src="datatable/js/responsive.bootstrap5.min.js" type="text/javascript"></script>
        <script src="js/jsUsuario.js" type="text/javascript"></script>
    </body>
</html>
