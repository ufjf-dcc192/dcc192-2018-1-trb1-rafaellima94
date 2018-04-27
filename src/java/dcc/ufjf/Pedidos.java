/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dcc.ufjf;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author ice
 */
public class Pedidos {

    private Integer numero;
    private Map<Itens, Integer> itens;
    private LocalDateTime horaAbertura;
    private LocalDateTime horaFechamento;

    public Pedidos(Integer numero, LocalDateTime horaAbertura) {
        this.numero = numero;
        this.horaAbertura = horaAbertura;
        itens = new HashMap<>();
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

    public void addItens(Itens item, Integer quantidade) {
        if(itens.containsKey(item)) {
            itens.put(item, itens.get(item) + quantidade);
        } else {
            this.itens.put(item, quantidade);
        }
    }

    public LocalDateTime getHoraAbertura() {
        return horaAbertura;
    }

    public String getHoraAberturaString() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
        return horaAbertura.format(formatter);
    }

    public void setHoraAbertura(LocalDateTime horaAbertura) {
        this.horaAbertura = horaAbertura;
    }

    public LocalDateTime getHoraFechamento() {
        return horaFechamento;
    }

    public String getHoraFechamentoString() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
        return horaFechamento.format(formatter);
    }

    public void setHoraFechamento(LocalDateTime horaFechamento) {
        this.horaFechamento = horaFechamento;
    }
}
