/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dcc.ufjf;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ice
 */
public class ListaDeItens {

    private static List<Itens> itens;

    public static List<Itens> getInstance() {
        if (itens == null) {
            itens = new ArrayList<>();
            itens.add(new Itens("Hamburguer de boi", 15.00));
            itens.add(new Itens("Hamburguer de frango", 12.00));
            itens.add(new Itens("Hamburguer de costela", 18.00));
            itens.add(new Itens("Hamburguer de porco", 13.00));
            itens.add(new Itens("Hamburguer de peixe", 16.00));
            itens.add(new Itens("Hamburguer vegetariano", 10.00));
            itens.add(new Itens("Batata frita", 10.00));
            itens.add(new Itens("Batata canoa", 12.00));
            itens.add(new Itens("Batata rustica", 14.00));
            itens.add(new Itens("Agua", 2.00));
            itens.add(new Itens("Agua com gas", 3.00));
            itens.add(new Itens("Refrigerante", 4.00));
            itens.add(new Itens("Cerveja", 6.00));
            itens.add(new Itens("Cerveja artesanal", 8.00));
        }
        return itens;
    }
}
