<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Roles</title>
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
                                    <div><b>Roles</b></div>
                                    <a class="btn btn-primary flex-row-reverse" data-toggle="modal" onclick="nuevo()">Nuevo Ingreso</a>
                                </div>
                            </nav>
                            <table id="tbl_maestra_roles" class="table table-condensed dataTable">
                                <thead>
                                    <tr>
                                        <th>Item</th>
                                        <th>Codigo</th>
                                        <th>Nombre del rol</th>
                                        <th>Editar</th>
                                        <th>Anular</th>
                                    </tr>
                                </thead>
                                <tbody id="tbl_maestra_body_roles">
                                </tbody>
                            </table>
                        </section>
                    </div>
                </div>
            </section>
        </section>
        
        <div class="modal" tabindex="-1" role="dialog" id="modal_roles" aria-hidden="false" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Roles</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="form_roles" method="post">
                            <div class="form-group">
                                <label>Codigo</label>
                                <input type="text" class="form-control" id="txtcodigo_roles" name="txtcodigo">
                            </div>
                            <div class="form-group">
                                <label>Nombre de Rol</label>
                                <input type="text" class="form-control" id="txtnombre_roles" name="txtnombre" style="text-transform:uppercase" >
                            </div> 
                            <input type="hidden" id="opc_roles" name="opc" value="1">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" id="btn_guardar_roles">Guardar</button>
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
        <script src="js/jsRoles.js" type="text/javascript"></script>
    </body>
</html>
