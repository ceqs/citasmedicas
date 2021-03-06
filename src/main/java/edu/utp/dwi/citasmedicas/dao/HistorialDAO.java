package edu.utp.dwi.citasmedicas.dao;

import edu.utp.dwi.citasmedicas.model.Historial;
import edu.utp.dwi.citasmedicas.model.Medico;
import edu.utp.dwi.citasmedicas.util.MySQLConexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class HistorialDAO {

    public List<Historial> getLista(int _idpaciente, String _fecI, String _fecF, int _idMed, int _idEsp) {
        List<Historial> lista = new ArrayList();
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "{call usp_s_rephis_cita(?, ?, ?, ?, ?)}";
            CallableStatement st = cn.prepareCall(sql);
            st.setString(1, _fecI);
            st.setString(2, _fecF);
            st.setInt(3, _idMed);
            st.setInt(4, _idEsp);
            st.setInt(5, _idpaciente);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Historial d = new Historial();
                d.setIdCita(Integer.parseInt(rs.getString(1)));
                d.setFecha(Date.valueOf(rs.getString(2)));
                d.setHorario(rs.getString(3));
                d.setMedico(rs.getString(4));
                d.setEspecialidad(rs.getString(5));
                d.setPaciente(rs.getString(6));

                d.setStr_fecha(sdf.format(d.getFecha()));
                lista.add(d);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return lista;
    }

    public List<Medico> getListMedxEsp(int _id) {
        List<Medico> lista = new ArrayList();
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "";

            if (_id > 0) {
                sql = "select idMedico, concat(apellidos,' ', nombres) as medico  from medicos \n"
                        + "where idEspecialidad=? order by apellidos, nombres";
            } else {
                sql = "select idMedico, concat(apellidos,' ', nombres) as medico  from medicos \n"
                        + "order by apellidos, nombres";
            }

            PreparedStatement st = cn.prepareStatement(sql);

            if (_id > 0) {
                st.setInt(1, _id);
            }

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Medico d = new Medico();
                d.setIdMedico(Integer.parseInt(rs.getString(1)));
                d.setApellidos(rs.getString(2));
                lista.add(d);
            }
        } catch (NumberFormatException | SQLException ex) {
            ex.printStackTrace();
        }
        return lista;
    }        
        
}
