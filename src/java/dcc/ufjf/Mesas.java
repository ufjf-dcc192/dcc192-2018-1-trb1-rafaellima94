package dcc.ufjf;

import java.util.ArrayList;
import java.util.List;

public class Mesas {

    private Integer numero;
    private List<Pedidos> pedidos;
    private boolean aberta;

    public Mesas(Integer numero) {
        this.numero = numero;
        this.aberta = false;
        this.pedidos = new ArrayList<>();
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

    public void addPedido(Pedidos pedido) {
        this.pedidos.add(pedido);
    }

    public Pedidos getPedidoAtual() {
        return this.pedidos.get(this.pedidos.size() - 1);
    }

    public boolean isAberta() {
        return aberta;
    }

    public void setAberta(boolean aberta) {
        this.aberta = aberta;
    }
}
