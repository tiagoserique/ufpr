import java.util.*;

class Exe05L06 {
    public static void main(String[] args) {
        ArrayList<String> nomes = new ArrayList<String>();


        // TODO colocar logica de interface grafica


        Collections.sort(nomes);
        
        System.out.println("\nImprime em ordem alfabetica:");

        Iterator<String> itr = nomes.iterator();

        while ( itr.hasNext() ){
            System.out.println(itr.next());
        }
    }
}