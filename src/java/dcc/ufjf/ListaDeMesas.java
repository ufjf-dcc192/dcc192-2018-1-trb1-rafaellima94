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
public class ListaDeMesas {

    private static List<Mesas> mesas;

    public static List<Mesas> getInstance() {
        if (mesas == null) {
            mesas = new ArrayList<>();
            for (Integer i = 0; i < 15; i++) {
                mesas.add(new Mesas(i));
            }
        }
        return mesas;
    }
}
