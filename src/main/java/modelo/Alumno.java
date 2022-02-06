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
public class Alumno {
    String coda;
    String ape;
    String noma;
    String code;
    String proce;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getProce() {
        return proce;
    }

    public void setProce(String proce) {
        this.proce = proce;
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

    @Override
    public String toString() {
        return "Alumno{" + "coda=" + coda + ", ape=" + ape + ", noma=" + noma + '}';
    }
}
