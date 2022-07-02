import java.util.*;

class Exe02L09 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        
        Pilha pilha = new Pilha();
        
        String nome = input.nextLine();
        // System.out.println(Arrays.toString(nome.split(" "))); 
        String parse[] = nome.split(" ");

        for (String parte:parse){
            pilha.push(parte);
        }

        System.out.println();
        
        pilha.imprimePilha();

        input.close();
    }
}