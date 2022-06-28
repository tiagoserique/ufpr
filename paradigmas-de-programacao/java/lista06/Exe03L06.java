import java.util.*;


class Exe03L06 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        Vector<String> vector = new Vector<String>();


        String string = input.nextLine();
        while ( !string.equals("fim") ){
            vector.add(string);

            string = input.nextLine();
        }

        Collections.sort(vector);
        
        System.out.println("\nImprime em ordem alfabetica:");
        for (int i = 0; i < vector.size(); i++){
            System.out.println(vector.get(i));
        }        

        input.close();
    }
}
