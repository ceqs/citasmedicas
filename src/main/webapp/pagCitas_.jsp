<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="edu.utp.dwi.citasmedicas.model.*,edu.utp.dwi.citasmedicas.dao.*, edu.utp.dwi.citasmedicas.controller.*" %>
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
        <%
            EspecialidadDAO obj=new EspecialidadDAO();
            MedicoDAO objM=new MedicoDAO();
            String code="", coda="";
            if (request.getParameter("cbe")!=null)
            code=request.getParameter("cbe");
            if (request.getParameter("cba")!=null)
            coda=request.getParameter("cba");
        %>

        <section id="main-content_esp">
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
                                    <div><b>Especialidades</b></div>
                                    
                                </div>
                            </nav>
                            
                            <form>
                Especialidad:<select name="cbe" onchange="submit()" class="form-control">
                  <%
                      for(Especialidad x:obj.getLista()){
                          if(code.equals(x.getIdEspecialidad()))
                          out.print("<option value="+x.getIdEspecialidad()+" selected>"+x.getNomEspecialidad());
                          else
                          out.print("<option value="+x.getIdEspecialidad()+" >"+x.getNomEspecialidad());
                      }
                  %>  
                </select>
                Medico<select name="cba" onchange="submit()" class="form-control">
                    <%
                        String nombre;
                      for(Medico x:objM.getListaMedEspec(Integer.parseInt(code))){
                          nombre = x.getApellidos()+","+x.getNombres();
                          if(coda.equals(x.getIdMedico()))
                          out.print("<option value="+x.getIdMedico()+" selected>"+nombre);
                          else
                          out.print("<option value="+x.getIdMedico()+" >"+nombre);
                      }
                  %>  
                      </select>
            </form>
                      
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
