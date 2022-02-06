/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import dao.Negocio;
import java.util.List;
import modelo.Alumno;
import modelo.Especial;
import modelo.Notas;

/**
 *
 * @author ceqs
 */
public class prueba1 {
    public static void main(String[] args) {
        MySQLConexion.getConexion();
        
        Negocio n = new Negocio();
        List<Especial> lista = n.lisEsp();
        for(Especial e : lista) {
            System.out.println(e);
        }
        
        List<Alumno> listAlumno = n.lisAlumno("E01");
        for(Alumno a : listAlumno) {
            System.out.println(a);
        }
        
        List<Notas> listNotas = n.lisNotas("a0002");
        for(Notas no : listNotas) {
            System.out.println(no);
        }
    }
   
}
