import java.util.*;

class Aula1 {
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);

		int numeros[] = new int[20];

		for (int i = 0; i < 20; i++)
			numeros[i] = input.nextInt();

		int x = input.nextInt();
		
		for (int i = 0; i < 20; i++)
			if ( numeros[i] == x )
				System.out.println("Está na lista"); 

		input.close();
	}
}
