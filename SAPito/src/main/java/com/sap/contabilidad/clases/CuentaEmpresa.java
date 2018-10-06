/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.contabilidad.clases;

/**
 *
 * @author fgb
 */
public class CuentaEmpresa {
    int id;
    String clave;
    String descripcion;
    String naturaleza;
    double clavesat;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getNaturaleza() {
        return naturaleza;
    }

    public void setNaturaleza(String naturaleza) {
        this.naturaleza = naturaleza;
    }

    public double getClavesat() {
        return clavesat;
    }

    public void setClavesat(double clavesat) {
        this.clavesat = clavesat;
    }
    
}
