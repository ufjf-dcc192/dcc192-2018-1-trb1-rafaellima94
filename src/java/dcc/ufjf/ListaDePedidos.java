package dcc.ufjf;

import java.util.ArrayList;
import java.util.List;

public class ListaDePedidos {

    private static List<Pedidos> pedidos;

    public static List<Pedidos> getInstance() {
        if (pedidos == null) {
            pedidos = new ArrayList<>();
        }
        
        return pedidos;
    }
}
