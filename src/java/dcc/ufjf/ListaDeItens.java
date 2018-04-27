package dcc.ufjf;

import java.util.ArrayList;
import java.util.List;

public class ListaDeItens {

    private static List<Itens> itens;

    public static List<Itens> getInstance() {
        if (itens == null) {
            itens = new ArrayList<>();
            itens.add(new Itens(1, "Hamburguer de boi", 15.00));
            itens.add(new Itens(2, "Hamburguer de frango", 12.00));
            itens.add(new Itens(3, "Hamburguer de costela", 18.00));
            itens.add(new Itens(4, "Hamburguer de porco", 13.00));
            itens.add(new Itens(5, "Hamburguer de peixe", 16.00));
            itens.add(new Itens(6, "Hamburguer vegetariano", 10.00));
            itens.add(new Itens(7, "Batata frita", 10.00));
            itens.add(new Itens(8, "Batata canoa", 12.00));
            itens.add(new Itens(9, "Batata rustica", 14.00));
            itens.add(new Itens(10, "Agua", 2.00));
            itens.add(new Itens(11, "Agua com gas", 3.00));
            itens.add(new Itens(12, "Refrigerante", 4.00));
            itens.add(new Itens(13, "Cerveja", 6.00));
            itens.add(new Itens(14, "Cerveja artesanal", 8.00));
        }
        
        return itens;
    }
}
