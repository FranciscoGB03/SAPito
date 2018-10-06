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
public class AsientoContable {
    String claveg;
    String modulo;
    String periodo;
    String fecha;
    String concepto;
    String tipocuenta;
    String idcuentacli;
    String idcuentapro;
    Double monto;
    String descripcion;
    String clavefactu;

    public String getClaveg() {
        return claveg;
    }

    public void setClaveg(String claveg) {
        this.claveg = claveg;
    }

    public String getModulo() {
        return modulo;
    }

    public void setModulo(String modulo) {
        this.modulo = modulo;
    }

    public String getPeriodo() {
        return periodo;
    }

    public void setPeriodo(String periodo) {
        this.periodo = periodo;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getConcepto() {
        return concepto;
    }

    public void setConcepto(String concepto) {
        this.concepto = concepto;
    }

    public String getTipocuenta() {
        return tipocuenta;
    }

    public void setTipocuenta(String tipocuenta) {
        this.tipocuenta = tipocuenta;
    }

    public String getIdcuentacli() {
        return idcuentacli;
    }

    public void setIdcuentacli(String idcuentacli) {
        this.idcuentacli = idcuentacli;
    }

    public String getIdcuentapro() {
        return idcuentapro;
    }

    public void setIdcuentapro(String idcuentapro) {
        this.idcuentapro = idcuentapro;
    }

    public Double getMonto() {
        return monto;
    }

    public void setMonto(Double monto) {
        this.monto = monto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getClavefactu() {
        return clavefactu;
    }

    public void setClavefactu(String clavefactu) {
        this.clavefactu = clavefactu;
    }
    
}
