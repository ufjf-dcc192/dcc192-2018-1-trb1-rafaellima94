/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dcc.ufjf;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author ice
 */
public class Pedidos {

    private Integer numero;
    private Map<Itens, Integer> itens;
    private Date horaAbertura;
    private Date horaFechamento;

    public Pedidos(Integer numero, Date horaAbertura) {
        this.numero = numero;
        this.horaAbertura = horaAbertura;
        itens = new HashMap<Itens, Integer>();
    }

    public Integer getNumero() {
        return numero;
    }

    public void setNumero(Integer numero) {
        this.numero = numero;
    }

    public Map<Itens, Integer> getItens() {
        return itens;
    }

    public void setItens(Map<Itens, Integer> itens) {
        this.itens = itens;
    }

    public Date getHoraAbertura() {
        return horaAbertura;
    }

    public void setHoraAbertura(Date horaAbertura) {
        this.horaAbertura = horaAbertura;
    }

    public Date getHoraFechamento() {
        return horaFechamento;
    }

    public void setHoraFechamento(Date horaFechamento) {
        this.horaFechamento = horaFechamento;
    }
}
