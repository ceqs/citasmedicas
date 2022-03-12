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
import edu.utp.dwi.citasmedicas.model.GraficoCita;
import edu.utp.dwi.citasmedicas.util.MySQLConexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GraficoDAO {

    public List<GraficoCita> lisMes(int _anio) {
        List<GraficoCita> lista = new ArrayList();
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "select month(fecha) mes, count(*) total\n" +
                        "from citas\n" +
                        "where year(fecha)=?\n" +
                        "group by month(fecha)";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setInt(1, _anio);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                GraficoCita ep = new GraficoCita();
                ep.setMes(rs.getInt(1));
                ep.setTotal(rs.getDouble(2));
                lista.add(ep);        
            }
        }
        catch (NumberFormatException | SQLException ex) {
            ex.printStackTrace();
        }
        
        return lista;
    }
}
