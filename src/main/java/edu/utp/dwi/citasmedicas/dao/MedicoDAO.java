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
import edu.utp.dwi.citasmedicas.model.Medico;
import edu.utp.dwi.citasmedicas.util.MySQLConexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class MedicoDAO {

    public Medico getDatos(int _id) {
        Medico d = new Medico();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "{call usp_s_medico(?)}";
            CallableStatement st = cn.prepareCall(sql);
            st.setInt(1, _id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                d.setIdMedico(Integer.parseInt(rs.getString(1)));
                d.setApellidos(rs.getString(2));
                d.setNombres(rs.getString(3));
                d.setGenero(rs.getString(4));
                d.setFecNac(Date.valueOf(rs.getString(5)));
                d.setDNI(rs.getString(6));
                d.setTelefono(rs.getString(7));
                d.setEmail(rs.getString(8));

                d.setStr_fecNac(sdf.format(d.getFecNac()));

                d.setIdEspecialidad(Integer.parseInt(rs.getString(9)));
                d.setNomEspecialidad(rs.getString(10));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return d;
    }

    public List<Medico> getLista() {
        List<Medico> lista = new ArrayList();
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "{call usp_s_medico_lst()}";
            CallableStatement st = cn.prepareCall(sql);
            //st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Medico d = new Medico();
                d.setIdMedico(Integer.parseInt(rs.getString(1)));
                d.setApellidos(rs.getString(2));
                d.setNombres(rs.getString(3));
                d.setGenero(rs.getString(4));
                d.setFecNac(Date.valueOf(rs.getString(5)));
                d.setDNI(rs.getString(6));
                d.setTelefono(rs.getString(7));
                d.setEmail(rs.getString(8));

                d.setStr_fecNac(sdf.format(d.getFecNac()));

                d.setIdEspecialidad(Integer.parseInt(rs.getString(9)));
                d.setNomEspecialidad(rs.getString(10));
                lista.add(d);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return lista;
    }

    public void adicionar(Medico e) {
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "{call usp_i_medico(?, ?, ?, ?, ?, ?, ?, ?)}";
            CallableStatement st = cn.prepareCall(sql);
            st.setString(1, e.getApellidos());
            st.setString(2, e.getNombres());
            st.setString(3, e.getGenero());
            st.setDate(4, e.getFecNac());
            st.setString(5, e.getDNI());
            st.setString(6, e.getTelefono());
            st.setString(7, e.getEmail());
            st.setInt(8, e.getIdEspecialidad());
            st.executeUpdate();
            cn.close();
        } catch (Exception ex) {
            //error a través de consola
            ex.printStackTrace();
        }
    }

    public void editar(Medico e) {
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "{call usp_u_medico(?, ?, ?, ?, ?, ?, ?, ?, ?)}";
            CallableStatement st = cn.prepareCall(sql);
            st.setInt(1, e.getIdMedico());
            st.setString(2, e.getApellidos());
            st.setString(3, e.getNombres());
            st.setString(4, e.getGenero());
            st.setDate(5, e.getFecNac());
            st.setString(6, e.getDNI());
            st.setString(7, e.getTelefono());
            st.setString(8, e.getEmail());
            st.setInt(9, e.getIdEspecialidad());
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
            String sql = "{call usp_d_medico(?)}";
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