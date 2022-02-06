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
public class Notas {
    String codc;
    String nomc;
    int exp;
    int exf;
    
    public double prom() {
        return (exp + exf) / 2;
    }
    
    public String obser() {
        String cad=(prom() >= 11.5 ? "Aprobado": "Desaprobado");
        return cad;
    }

    public String getCodc() {
        return codc;
    }

    public void setCodc(String codc) {
        this.codc = codc;
    }

    public String getNomc() {
        return nomc;
    }

    public void setNomc(String nomc) {
        this.nomc = nomc;
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

    @Override
    public String toString() {
        return "Notas{" + "codc=" + codc + ", nomc=" + nomc + ", exp=" + exp + ", exf=" + exf + '}';
    }
}
