/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dcc.ufjf;

import java.util.List;

/**
 *
 * @author ice
 */
public class Mesas {

    private Integer numero;
    private List<Pedidos> pedidos;
    private boolean aberta;

    public Mesas(Integer numero) {
        this.numero = numero;
        this.aberta = false;
    }

    public Integer getNumero() {
        return numero;
    }

    public void setNumero(Integer numero) {
        this.numero = numero;
    }

    public List<Pedidos> getPedidos() {
        return pedidos;
    }

    public void setPedidos(List<Pedidos> pedidos) {
        this.pedidos = pedidos;
    }

    public boolean isAberta() {
        return aberta;
    }

    public void setAberta(boolean aberta) {
        this.aberta = aberta;
    }
}