<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>

   
    <script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script>
        $(document).ready(function () {
            $('#button1').click(function () {

                $.post("c_Especialidad", $(document.forms[0]).serialize(), function (response) {
                    var data = $.parseJSON(response);  
                    var s = 'ID: ' + data.idEspecialidad + ' NOmbre: ' + data.nomEspecialidad + '<br> ';                    
                    document.getElementById('result1').innerHTML = s;
                });

                /*
                 $.ajax({
                 type: 'POST',
                 url: 'c_Especialidad',
                 headers: {Accept: "application/json; charset=utf-8",
                 "Content-Type": "application/json; charset=utf-8"
                 },
                 success: function (data) {
                 var lista = $.parseJSON(data);
                 var s = "";
                 for (var i = 0; i < lista.length; i++) {
                 s+= 'ID: ' + lista[i].idEspecialidad + ' NOmbre: ' + lista[i].nomEspecialidad + '<br> ' ;
                 }
                 document.getElementById('result1').innerHTML = s;
                 }                    
                 });              
                 
                 */
            });
        });
    </script>
    <body>
        <h1>Hello World!</h1>
        <form name="frm">
            <fieldset>
                <legend>Demo 1</legend>
                <label>Id Especialidad: </label><br><input type="text" name="txtId">
                <input type="button" value="Display" id="button1"><br><!-- comment -->
                <div id="result1"></div> 
            </fieldset>  
        </form>

    </body>
</html>
