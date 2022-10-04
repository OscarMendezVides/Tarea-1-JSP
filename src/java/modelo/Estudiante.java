/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import javax.swing.table.DefaultTableModel;
/**
 *
 * @author Oscar
 */
public class Estudiante extends Persona {
    private String carne,correo;
    private int id_tipo_sangre;
    private Conexion cn;
    
    public Estudiante() {}
    public Estudiante(String carne, String correo, int id_tipo_sangre, int id, String nombres, String apellidos, String direccion, String telefono, String fecha_nacimiento) {
        super(id, nombres, apellidos, direccion, telefono, fecha_nacimiento);
        this.carne = carne;
        this.correo = correo;
        this.id_tipo_sangre = id_tipo_sangre;
    }

    public String getCarne() {
        return carne;
    }

    public void setCarne(String carne) {
        this.carne = carne;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public int getId_tipo_sangre() {
        return id_tipo_sangre;
    }

    public void setId_tipo_sangre(int id_tipo_sangre) {
        this.id_tipo_sangre = id_tipo_sangre;
    }
    
 public DefaultTableModel leer(){
   DefaultTableModel tabla = new DefaultTableModel();
   try{
       cn = new Conexion();
       cn.abrir_conexion();
       
       String query = "select e.id_estudiante as id,e.carne,e.nombres,e.apellidos,e.direccion,e.telefono,e.correo,e.fecha_nacimiento,p.tipo_sangre,p.id_tipo_sangre FROM estudiantes as e inner join tipos_sangre as p on e.id_tipo_sangre = p.id_tipo_sangre;";
       ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
       String encabezado[] = {"id","carne","nombres","apellidos","direccion","telefono","correo","nacimiento","tipo_sangre","id_tipo_sangre"};
       tabla.setColumnIdentifiers(encabezado);
       String datos[] = new String[10];
       while(consulta.next()){
           datos[0] = consulta.getString("id");
           datos[1] = consulta.getString("carne");
           datos[2] = consulta.getString("nombres");
           datos[3] = consulta.getString("apellidos");
           datos[4] = consulta.getString("direccion");
           datos[5] = consulta.getString("telefono");
           datos[6] = consulta.getString("correo");
           datos[7] = consulta.getString("tipo_sangre");
           datos[8] = consulta.getString("fecha_nacimiento");
           datos[9] = consulta.getString("id_tipo_sangre");
           tabla.addRow(datos);
       }
       
       cn.cerrar_conexion();
   }catch(SQLException ex){
       System.out.println(ex.getMessage());
   }
   return tabla;
   }
   
    @Override
    public int agregar(){
        int retorno = 0;
    try{
        PreparedStatement parametro;
        cn = new Conexion();
        String query="INSERT INTO estudiantes(carne,nombres,apellidos,direccion,telefono,correo,id_tipo_sangre,fecha_nacimiento)VALUES (?,?,?,?,?,?,?,?);";
        cn.abrir_conexion();
        parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
        parametro.setString(1, getCarne());
        parametro.setString(2, getNombres());
        parametro.setString(3, getApellidos());
        parametro.setString(4, getDireccion());
        parametro.setString(5, getTelefono());
        parametro.setString(6, getCorreo());
        parametro.setInt(7, getId_tipo_sangre());
        parametro.setString(8, getFecha_nacimiento());
        
        
        retorno =parametro.executeUpdate();
        cn.cerrar_conexion();
        
    }catch(SQLException ex){
        System.out.println(ex.getMessage());
        retorno = 0;
    }
    
    return retorno;
    }
   @Override
    public int modificar(){
        int retorno = 0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "update estudiantes set carne=?, nombres=?, apellidos=?, direccion=?, telefono=?, correo=?, id_tipo_sangre=?, fecha_nacimiento=? where id_estudiante=?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setString(1, this.getCarne());
            parametro.setString(2, this.getNombres());
            parametro.setString(3, this.getApellidos());
            parametro.setString(4, this.getDireccion());
            parametro.setString(5, this.getTelefono());
            parametro.setString(6, this.getCorreo());
            parametro.setInt(7, this.getId_tipo_sangre());
            parametro.setString(8, this.getFecha_nacimiento());
            parametro.setInt(9, this.getId());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage()); 
        }
        return retorno;  
    }
    
    @Override
    public int eliminar(){
        int retorno = 0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "delete from estudiantes where id_estudiante=?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, this.getId());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage()); 
        }
        return retorno;  
    }
   
}
