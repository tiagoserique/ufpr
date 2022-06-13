import java.util.*;

class Exe9 {
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		int numero = 1, soma = 0;

		while ( numero != -1 ){
			System.out.println("Digite um numero");
			numero = input.nextInt();
			soma += numero;
		}

		soma++;

		System.out.println("Soma: " + soma);
		input.close();
	}
} 