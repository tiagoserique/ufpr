import java.util.*;

class Exe04L01 {
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		int numero;

		numero = input.nextInt();

		if ( numero > 0 ){
			System.out.println("Positivo");
		}

		input.close();
	}
}
