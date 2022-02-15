<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>


    <!--<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">


    <link href="datatable/css/dataTables.bootstrap5.min.css" rel="stylesheet" type="text/css"/>
    <link href="datatable/css/fixedColumns.bootstrap5.min.css" rel="stylesheet" type="text/css"/>


    <body>

        <section id="main-content_esp">
            <section class="wrapper">
                <div  class="row" style="margin-top: 15px;">
                    <div class="row">
                        <div class="col-lg-12">
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <section class="panel">
                            <header class="panel-heading" style="padding: 5px;">
                                Especialidades
                                <a id="btnNuevo_esp" class="btn btn-turq pull-right" data-toggle="modal" onclick="nuevo()">Nuevo Ingreso</a>
                            </header>
                            <table id="tablaMaestra_esp" class="table table-condensed dataTable">
                                <thead>
                                    <tr>
                                        <th>Item</th>
                                        <th>Codigo</th>
                                        <th>Nombre de la Especialidad</th>
                                        <th>Editar</th>
                                        <th>Anular</th>
                                    </tr>
                                </thead>
                                <tbody id="tblMaestraBody_esp">
                                </tbody>
                            </table>
                        </section>
                    </div>
                </div>
            </section>
        </section>


        <div class="modal" tabindex="-1" role="dialog" id="modalInfo_esp" aria-hidden="false" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Especialidad</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="form_esp" method="post">
                            <div class="form-group">
                                <label>Codigo</label>
                                <input type="text" class="form-control" id="txtcodigo_esp" name="txtcodigo">
                            </div>
                            <div class="form-group">
                                <label>Nombre de Especialidad</label>
                                <input type="text" class="form-control" id="txtnombre_esp" name="txtnombre">
                            </div> 
                            <input type="hidden" id="opc_esp" name="opc" value="1">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" id="btnGuardar_esp">Guardar</button>
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
        
        <script src="js/jsEspecialidad.js" type="text/javascript"></script>



    </body>
</html>
