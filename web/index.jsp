<%-- 
    Document   : index
    Created on : 28/09/2022, 10:05:08 PM
    Author     : Oscar
--%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="modelo.Estudiante"%>
<%@page import="modelo.Sangre"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Estudiantes</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    </head>
    <body>
        <h1>FORMULARIO ESTUDIANTES</h1>
        <button type="button" name="btn_nuevo" id="btn_nuevo" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal_empleado" onclick="limpiar()">Nuevo</button>
        
        <div class="container">
        <div class="modal fade" id="modal_empleado" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
            <form action="sr_estudiante" method="post" class="form-group">
                <label for="lbl_id"><b>ID:</b></label>
                <input type="text" name="txt_id" id="txt_id" class="form-control" value ="0" readonly>  
                <label for="lbl_carne"><b>Carne:</b></label>
                <input type="text" name="txt_carne" id="txt_carne" class="form-control" placeholder="Ejemplo:E001" required>  
                <label for="lbl_nombres"><b>Nombres:</b></label>
                <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Ejemplo:NOMBRE1 NOMBRE2" required>
                <label for="lbl_apellidos"><b>Apellidos:</b></label>
                <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Ejemplo:APELLIDO1 APELLIDO2" required>  
                <label for="lbl_direccion"><b>Direccion:</b></label>
                <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Ejemplo: # CASA CALLE ZONA CIUDAD" required>
                <label for="lbl_telefono"><b>Telefono:</b></label>
                <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ejemplo:55555555" required>  
                <label for="lbl_correo"><b>Correo:</b></label>
                <input type="text" name="txt_correo" id="txt_correo" class="form-control" placeholder="Ejemplo:55555555" required>  
                <label for="lbl_sangre"><b>Tipo Sangre</b></label>
                <select name="drop_sangre" id="drop_list" class="form-control">
                    <% 
                        Sangre sangre = new Sangre();
                        HashMap<String, String> drop = sangre.drop_sangre();
                        for(String i: drop.keySet()){
                            out.println("<option value='" + i + "'>" + drop.get(i) +"</option>");
                        }
                    %>
                </select>
                <label for="lbl_fn"><b>Fecha nacimiento:</b></label>
                <input type="date" name="txt_fn" id="txt_fn" class="form-control" required>
                <br>
                <input type="submit" class="btn btn-primary" name="btn_agregar" id="btn_agregar" value="agregar" >
                <input type="submit" class="btn btn-success" name="btn_modificar" id="btn_modificar" value="modificar">
                <input type="submit" class="btn btn-danger" name="btn_eliminar" id="btn_eliminar" value="eliminar"onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false">
                <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>
               
            </form>
        </div>
      </div>
      
    </div>
  </div>  
            
          
                
                
            <table class="table table-striped">
    <thead>
      <tr>
        <th>Carne</th>
        <th>Nombres</th>
        <th>Apellidos</th>
        <th>Direccion</th>
        <th>Telefono</th>
        <th>Correo</th>
        <th>Tipo de sangre</th>
        <th>Nacimiento</th>
      </tr>
    </thead>
    <tbody id="tbl_estudiantes">
        <% 
        Estudiante estudiante = new Estudiante();
        DefaultTableModel tabla = new DefaultTableModel();
        tabla = estudiante.leer();
        for (int t=0;t<tabla.getRowCount();t++){
            out.println("<tr data-id=" + tabla.getValueAt(t,0) + " data-id_p=" + tabla.getValueAt(t,9) + ">");
            out.println("<td>" + tabla.getValueAt(t,1) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,2) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,3) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,4) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,5) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,6) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,7) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,8) + "</td>");
            out.println("</tr>");
        
        }
        %>
      
    </tbody>
  </table>
        </div>
        
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script>
        
     function limpiar(){
   $("#txt_id").val(0);
   $("#txt_carne").val('');
   $("#txt_nombres").val('');
   $("#txt_apellidos").val('');
   $("#txt_direccion").val('');
   $("#txt_telefono").val('');
   $("#txt_correo").val('');
   $("#drop_list").val(1);
   $("#txt_fn").val('');
   
     }   
        $('#tbl_estudiantes').on('click','tr td', function(evt){
   var target,id,id_p,carne,nombres,apellidos,direccion,telefono,correo,nacimiento;
   
   target = $(event.target);
   id = target.parent().data('id');
   id_p = target.parent().data('id_p');
   carne= target.parents("tr").find("td").eq(0).html();
   nombres= target.parents("tr").find("td").eq(1).html();
   apellidos= target.parents("tr").find("td").eq(2).html();
   direccion= target.parents("tr").find("td").eq(3).html();
   telefono= target.parents("tr").find("td").eq(4).html();
   correo= target.parents("tr").find("td").eq(5).html();
   nacimiento= target.parent("tr").find("td").eq(7).html();
   
   $("#txt_id").val(id);
   $("#txt_carne").val(carne);
   $("#txt_nombres").val(nombres);
   $("#txt_apellidos").val(apellidos);
   $("#txt_direccion").val(direccion);
   $("#txt_telefono").val(telefono);
   $("#txt_correo").val(correo);
   $("#txt_fn").val(nacimiento);
   $("#drop_list").val(id_p);
   $("#modal_empleado").modal('show');
   });
</script>
    </body>
</html>