/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.utp.dwi.citasmedicas.dao;

/**
 *
 * @author ceqs
 */
import edu.utp.dwi.citasmedicas.model.Paciente;
import edu.utp.dwi.citasmedicas.util.MySQLConexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PacienteDAO {
    
    public Paciente getByUsuario(String _username) {
        Paciente d = null;
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "select idPaciente, tipoDoc, numDoc, apePaterno, apeMaterno, nombres, telefono, celular, email, fecNacimiento, sexo, usuario\n" +
                         "from pacientes\n" +
                         "where usuario = ?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, _username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                d = new Paciente();
                d.setIdPaciente(rs.getInt(1));
                d.setTipoDoc(rs.getString(2));
                d.setNumDoc(rs.getString(3));
                d.setApePaterno(rs.getString(4));
                d.setApeMaterno(rs.getString(5));
                d.setNombres(rs.getString(6));
                d.setTelefono(rs.getString(7));
                d.setCelular(rs.getString(8));
                d.setEmail(rs.getString(9));
                d.setFecNacimiento(rs.getDate(10));
                d.setSexo(rs.getString(11));
                d.setUsuario(rs.getString(12));
            }
        }
        catch (NumberFormatException | SQLException ex) {
            ex.printStackTrace();
        }
        return d;
    }

    public Paciente getDatos(String _idPaciente) {
        Paciente d = null;
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "select idPaciente, tipoDoc, numDoc, apePaterno, apeMaterno, nombres, telefono, celular, email, fecNacimiento, sexo, usuario\n" +
                         "from pacientes\n" +
                         "where idPaciente = ?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, _idPaciente);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                d = new Paciente();
                d.setIdPaciente(rs.getInt(1));
                d.setTipoDoc(rs.getString(2));
                d.setNumDoc(rs.getString(3));
                d.setApePaterno(rs.getString(4));
                d.setApeMaterno(rs.getString(5));
                d.setNombres(rs.getString(6));
                d.setTelefono(rs.getString(7));
                d.setCelular(rs.getString(8));
                d.setEmail(rs.getString(9));
                d.setFecNacimiento(rs.getDate(10));
                d.setSexo(rs.getString(11));
                d.setUsuario(rs.getString(12));
            }
        }
        catch (NumberFormatException | SQLException ex) {
            ex.printStackTrace();
        }
        return d;  
    }

    public void adicionar(Paciente e) {
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "insert into pacientes(tipoDoc, numDoc, apePaterno, apeMaterno, nombres, telefono, celular, email, fecNacimiento, sexo, usuario)\n" +
                         "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, e.getTipoDoc());
            st.setString(2, e.getNumDoc());
            st.setString(3, e.getApePaterno());
            st.setString(4, e.getApeMaterno());
            st.setString(5, e.getNombres());
            st.setString(6, e.getTelefono());
            st.setString(7, e.getCelular());
            st.setString(8, e.getEmail());
            st.setDate(9, e.getFecNacimiento());
            st.setString(10, e.getSexo());
            st.setString(11, e.getUsuario());
            st.executeUpdate();
            cn.close();
        }
        catch (NumberFormatException | SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void editar(Paciente e) {
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "update pacientes\n" +
                        "set tipodoc = ?,\n" +
                        "numDoc = ?, \n" +
                        "apePaterno = ?, \n" +
                        "apeMaterno = ?, \n" +
                        "nombres = ?,\n" +
                        "telefono = ?, \n" +
                        "celular = ?, \n" +
                        "email = ?, \n" +
                        "fecNacimiento = ?, \n" +
                        "sexo = ?, \n" +
                        "usuario = ?\n" +
                        "where idPaciente = ?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, e.getTipoDoc());
            st.setString(2, e.getNumDoc());
            st.setString(3, e.getApePaterno());
            st.setString(4, e.getApeMaterno());
            st.setString(5, e.getNombres());
            st.setString(6, e.getTelefono());
            st.setString(7, e.getCelular());
            st.setString(8, e.getEmail());
            st.setDate(9, e.getFecNacimiento());
            st.setString(10, e.getSexo());
            st.setString(11, e.getUsuario());
            st.setInt(12, e.getIdPaciente());
            st.executeUpdate();
            cn.close();
        }
        catch (NumberFormatException | SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void borrar(String _idPaciente) {
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "delete from pacientes where idPaciente = ?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, _idPaciente);
            st.executeUpdate();
            cn.close();
        }
        catch (NumberFormatException | SQLException ex) {
            ex.printStackTrace();
        }
    }
}
