/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.utp.dwi.citasmedicas.model;

/**
 *
 * @author ceqs
 */
public class Especialidad {

    private int idEspecialidad;
    private String nomEspecialidad;

    public Especialidad() {
    }

    public Especialidad(int idEspecialidad, String nomEspecialidad) {
        this.idEspecialidad = idEspecialidad;
        this.nomEspecialidad = nomEspecialidad;
    }

    public int getIdEspecialidad() {
        return idEspecialidad;
    }

    public void setIdEspecialidad(int idEspecialidad) {
        this.idEspecialidad = idEspecialidad;
    }

    public String getNomEspecialidad() {
        return nomEspecialidad;
    }

    public void setNomEspecialidad(String nomEspecialidad) {
        this.nomEspecialidad = nomEspecialidad;
    }

}
