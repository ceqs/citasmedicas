/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

/**
 *
 * @author ceqs
 */
import modelo.*;
import util.MySQLConexion;
import java.util.*;
import java.sql.*;

public class Negocio {
    public List<Especial> lisEsp() {
        List<Especial> lista = new ArrayList();
        
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "select idesp, nomesp from especialidad";
            PreparedStatement st = cn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            
            while(rs.next()) {
                Especial ep = new Especial();
                ep.setCode(rs.getString(1));
                ep.setNoma(rs.getString(2));
                lista.add(ep);
            }
        }
        catch(SQLException ex) {
            ex.printStackTrace();
        }
        
        return lista;
    }
    
    // lista de alumnos pasando un codigo especialidad
        public List<Alumno> lisAlumno(String id) {
        List<Alumno> lista = new ArrayList();
        
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "select idalumno, apealumno, nomalumno from alumno where idesp=?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            
            while(rs.next()) {
                Alumno alumno = new Alumno();
                alumno.setCoda(rs.getString(1));
                alumno.setApe(rs.getString(2));
                alumno.setNoma(rs.getString(3));
                lista.add(alumno);
            }
        }
        catch(SQLException ex) {
            ex.printStackTrace();
        }
        
        return lista;
    }
        
    // lista de notas de un notas
    public List<Notas> lisNotas(String id) {
        List<Notas> lista = new ArrayList();
        
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "select c.IdCurso, nomcurso, exaparcial, ExaFinal from curso c join notas n on c.idCurso = n.idCurso\n" +
                         "where n.idAlumno = ?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            
            while(rs.next()) {
                Notas notas = new Notas();
                notas.setCodc(rs.getString(1));
                notas.setNomc(rs.getString(2));
                notas.setExp(rs.getInt(3));
                notas.setExf(rs.getInt(4));
                lista.add(notas);
            }
        }
        catch(SQLException ex) {
            ex.printStackTrace();
        }
        
        return lista;
    }
    
    // Lista de cursos
    public List<Curso> lisCursos() {
        List<Curso> lista = new ArrayList();
        
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "select idcurso, nomcurso, credito from curso";
            PreparedStatement st = cn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            
            while(rs.next()) {
                Curso ep = new Curso();
                ep.setCodc(rs.getString(1));
                ep.setNomc(rs.getString(2));
                ep.setCred(rs.getInt(3));
                lista.add(ep);
            }
        }
        catch(SQLException ex) {
            ex.printStackTrace();
        }
        
        return lista;
    }
    
    // lista de alumnos de un curso
    public List<AlumnoNotas> lisAlumnosCurso(String id) {
        List<AlumnoNotas> lista = new ArrayList();
        
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "select a.IdAlumno, a.ApeAlumno, a.NomAlumno, exaparcial, ExaFinal from curso c \n" +
                         "join notas n on c.idCurso = n.idCurso\n" +
                         "join alumno a on n.IdAlumno = a.IdAlumno\n" +
                         "where c.idCurso = ?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            
            while(rs.next()) {
                AlumnoNotas notas = new AlumnoNotas();
                notas.setCoda(rs.getString(1));
                notas.setApe(rs.getString(2));
                notas.setNoma(rs.getString(3));
                notas.setExp(rs.getInt(4));
                notas.setExf(rs.getInt(5));
                lista.add(notas);
            }
        }
        catch(SQLException ex) {
            ex.printStackTrace();
        }
        
        return lista;
    }
    
    public void adicion(Alumno a) {
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "{call spadicion(?,?,?,?)}";
            CallableStatement st = cn.prepareCall(sql);
            st.setString(1, a.getApe());
            st.setString(2, a.getNoma());
            st.setString(3, a.getCode());
            st.setString(4, a.getProce());
            st.executeUpdate();
        }
        catch(Exception ex) {
            ex.printStackTrace();
        }
    }
    
    public void modifica(Alumno a) {
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "{call cambia(?,?,?,?,?)}";
            CallableStatement st = cn.prepareCall(sql);
            st.setString(1, a.getCoda());
            st.setString(2, a.getApe());
            st.setString(3, a.getNoma());
            st.setString(4, a.getCode());
            st.setString(5, a.getProce());
            
            st.executeUpdate();
        }
        catch(Exception ex) {
            ex.printStackTrace();
        }
    }
    
    public void anula(String cod) {
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "{call spanula(?)}";
            CallableStatement st = cn.prepareCall(sql);
            st.setString(1, cod);
            
            st.executeUpdate();
        }
        catch(Exception ex) {
            ex.printStackTrace();
        }
    }
    
    // lista de alumnos pasando un codigo especialidad
    public List<Alumno> lisGenAlumno() {
        List<Alumno> lista = new ArrayList();
        
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "select idalumno, apealumno, nomalumno,idesp, proce from alumno";
            PreparedStatement st = cn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            
            while(rs.next()) {
                Alumno alumno = new Alumno();
                alumno.setCoda(rs.getString(1));
                alumno.setApe(rs.getString(2));
                alumno.setNoma(rs.getString(3));
                alumno.setCode(rs.getString(4));
                alumno.setProce(rs.getString(5));
                lista.add(alumno);
            }
        }
        catch(SQLException ex) {
            ex.printStackTrace();
        }
        
        return lista;
    }
    
    public Alumno busAlumno(String cod) {
        Alumno alumno =  null;
        
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "select idalumno, apealumno, nomalumno,idesp, proce from alumno where idalumno=?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, cod);
            ResultSet rs = st.executeQuery();
            
            if(rs.next()) {
                alumno = new Alumno();
                alumno.setCoda(rs.getString(1));
                alumno.setApe(rs.getString(2));
                alumno.setNoma(rs.getString(3));
                alumno.setCode(rs.getString(4));
                alumno.setProce(rs.getString(5));
            }
        }
        catch(SQLException ex) {
            ex.printStackTrace();
        }
        
        return alumno;
    }
}
