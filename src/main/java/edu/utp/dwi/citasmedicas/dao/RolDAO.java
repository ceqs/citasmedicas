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
import edu.utp.dwi.citasmedicas.model.Rol;
import edu.utp.dwi.citasmedicas.util.MySQLConexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RolDAO {

    public Rol getDatos(int _id) {
        Rol d = new Rol();
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "select idRol, nomRol from roles where idRol = ?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setInt(1, _id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {               
                d.setIdRol(Integer.parseInt(rs.getString(1)));
                d.setNomRol(rs.getString(2));                
            }
        }
        catch (NumberFormatException | SQLException ex) {
            ex.printStackTrace();
        }
        return d;     
    }

    public List<Rol> getLista() {
        List<Rol> lista = new ArrayList();
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "select idRol, nomRol from roles";
            PreparedStatement st = cn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Rol d = new Rol();
                d.setIdRol(Integer.parseInt(rs.getString(1)));
                d.setNomRol(rs.getString(2));  
                lista.add(d);
            }
        }
        catch (NumberFormatException | SQLException ex) {
            ex.printStackTrace();
        }
        return lista;
    }

    public void adicionar(Rol e) {
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "insert into roles(nomRol) values(?)";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, e.getNomRol());
            st.executeUpdate();
            cn.close();
        }
        catch (NumberFormatException | SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void editar(Rol e) {
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "update roles set nomRol = ? where idRol = ?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, e.getNomRol());
            st.setInt(2, e.getIdRol());
            st.executeUpdate();
            cn.close();
        }
        catch (NumberFormatException | SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void borrar(int _id) {
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "delete from roles where idRol = ?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setInt(1, _id);
            st.executeUpdate();
            cn.close();
        }
        catch (NumberFormatException | SQLException ex) {
            ex.printStackTrace();
        }
        
    }

}
