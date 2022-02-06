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
public class Curso {
    String codc;
    String nomc;
    int cred;

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

    public int getCred() {
        return cred;
    }

    public void setCred(int cred) {
        this.cred = cred;
    }

    @Override
    public String toString() {
        return "Curso{" + "codc=" + codc + ", nomc=" + nomc + ", cred=" + cred + '}';
    }
}
