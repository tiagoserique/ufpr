import java.util.*;

class Exe04L06 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        ArrayList<String> array = new ArrayList<String>();


        String string = input.nextLine();
        while ( !string.equals("fim") ){
            array.add(string);

            string = input.nextLine();
        }

        Collections.sort(array);
        
        System.out.println("\nImprime em ordem alfabetica:");

        Iterator<String> itr = array.iterator();

        while ( itr.hasNext() ){
            System.out.println(itr.next());
        }        

        input.close();
    }
}