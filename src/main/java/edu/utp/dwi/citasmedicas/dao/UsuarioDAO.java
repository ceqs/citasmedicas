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
import edu.utp.dwi.citasmedicas.model.Usuario;
import edu.utp.dwi.citasmedicas.util.MySQLConexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {

    public Usuario getDatos(String _usuario) {
        Usuario d = new Usuario();
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "select usuario, password, idRol, enabled from usuarios where usuario = ?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, _usuario);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                d.setUsuario(rs.getString(1));
                d.setPassword(rs.getString(2));
                d.setIdRol(Integer.parseInt(rs.getString(3)));
                d.setEnabled(rs.getBoolean(4));
            }
        }
        catch (NumberFormatException | SQLException ex) {
            ex.printStackTrace();
        }
        return d;     
    }

    public List<Usuario> getLista() {
        List<Usuario> lista = new ArrayList();
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "select usuario, password, idRol, enabled from usuarios";
            PreparedStatement st = cn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Usuario d = new Usuario();
                d.setUsuario(rs.getString(1));
                d.setPassword(rs.getString(2));
                d.setIdRol(Integer.parseInt(rs.getString(3)));
                d.setEnabled(rs.getBoolean(4));
                lista.add(d);
            }
        }
        catch (NumberFormatException | SQLException ex) {
            ex.printStackTrace();
        }
        return lista;
    }

    public void adicionar(Usuario e) {
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "insert into usuarios(usuario, password, idRol, enabled) values(?, ?, ?, ?)";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, e.getUsuario());
            st.setString(2, e.getPassword());
            st.setInt(3, e.getIdRol());
            st.setBoolean(4, e.isEnabled());
            st.executeUpdate();
            cn.close();
        }
        catch (NumberFormatException | SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void editar(Usuario e) {
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "update usuarios set password = ?, idRol = ?, enabled = ? where usuario = ?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, e.getPassword());
            st.setInt(2, e.getIdRol());
            st.setBoolean(3, e.isEnabled());
            st.setString(4, e.getUsuario());
            st.executeUpdate();
            cn.close();
        }
        catch (NumberFormatException | SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void borrar(String _usuario) {
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "delete from usuarios where usuario = ?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, _usuario);
            st.executeUpdate();
            cn.close();
        }
        catch (NumberFormatException | SQLException ex) {
            ex.printStackTrace();
        }
        
    }

}
