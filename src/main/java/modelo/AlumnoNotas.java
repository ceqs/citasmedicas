/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author ceqs
 */
public class AlumnoNotas {
    String coda;
    String ape;
    String noma;
    int exp;
    int exf;    

    public double prom() {
        return (exp + exf) / 2;
    }
    
    public String obser() {
        String cad=(prom() >= 11.5 ? "Aprobado": "Desaprobado");
        return cad;
    }
    
    public String getCoda() {
        return coda;
    }

    public void setCoda(String coda) {
        this.coda = coda;
    }

    public String getApe() {
        return ape;
    }

    public void setApe(String ape) {
        this.ape = ape;
    }

    public String getNoma() {
        return noma;
    }

    public void setNoma(String noma) {
        this.noma = noma;
    }

    public int getExp() {
        return exp;
    }

    public void setExp(int exp) {
        this.exp = exp;
    }

    public int getExf() {
        return exf;
    }

    public void setExf(int exf) {
        this.exf = exf;
    }
}
