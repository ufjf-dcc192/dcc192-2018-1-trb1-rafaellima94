package dcc.ufjf;

import java.util.ArrayList;
import java.util.List;

public class ListaDeMesas {

    private static List<Mesas> mesas;

    public static List<Mesas> getInstance() {
        if (mesas == null) {
            mesas = new ArrayList<>();
            for (Integer i = 1; i < 16; i++) {
                mesas.add(new Mesas(i));
            }
        }
        
        return mesas;
    }
}
