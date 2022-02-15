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
import edu.utp.dwi.citasmedicas.model.Especialidad;
import edu.utp.dwi.citasmedicas.util.MySQLConexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EspecialidadDAO {

    public Especialidad getDatos(int _id) {
        Especialidad d = new Especialidad();
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "{call usp_s_especialidad(?)}";
            CallableStatement st = cn.prepareCall(sql);
            st.setInt(1, _id);
            ResultSet rs = st.executeQuery();
            //st.execute();
            //final ResultSet rs = st.getResultSet();
            if (rs.next()) {               
                d.setIdEspecialidad(Integer.parseInt(rs.getString(1)));
                d.setNomEspecialidad(rs.getString(2));                
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return d;     
    }

    public List<Especialidad> getLista() {
        List<Especialidad> lista = new ArrayList();
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "{call usp_s_especialidad_lst()}";
            CallableStatement st = cn.prepareCall(sql);
            //st.setString(1, id);
            ResultSet rs = st.executeQuery();
            //st.execute();
            //final ResultSet rs = st.getResultSet();
            while (rs.next()) {
                Especialidad d = new Especialidad();
                d.setIdEspecialidad(Integer.parseInt(rs.getString(1)));
                d.setNomEspecialidad(rs.getString(2));
                lista.add(d);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return lista;
    }

    public void adicionar(Especialidad e) {
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "{call usp_i_especialidad(?)}";
            CallableStatement st = cn.prepareCall(sql);
            st.setString(1, e.getNomEspecialidad());
            st.executeUpdate();
            cn.close();
        } catch (Exception ex) {
            //error a través de consola
            ex.printStackTrace();
            throw new RuntimeException(ex);
        } 
    }

    public void editar(Especialidad e) {
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "{call usp_u_especialidad(?, ?)}";
            CallableStatement st = cn.prepareCall(sql);
            st.setInt(1, e.getIdEspecialidad());
            st.setString(2, e.getNomEspecialidad());
            st.executeUpdate();
            cn.close();
        } catch (Exception ex) {
            //error a través de consola
            ex.printStackTrace();
        }
    }

    public void borrar(int _id) {
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "{call usp_d_especialidad(?)}";
            CallableStatement st = cn.prepareCall(sql);
            st.setInt(1, _id);
            st.executeUpdate();
            cn.close();
        } catch (Exception ex) {
            //error a través de consola
            ex.printStackTrace();
        }
    }

}
