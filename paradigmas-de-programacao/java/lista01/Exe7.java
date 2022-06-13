import java.util.*;

class Exe7 {
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		int lado1, lado2, lado3;

		lado1 = input.nextInt();
		lado2 = input.nextInt();
		lado3 = input.nextInt();


		if ( lado1 == lado2 && lado2 == lado3 )
			System.out.println("equilátero");
	
		else if ( lado1 == lado2 || lado2 == lado3 || lado1 == lado3 )
			System.out.println("isósceles");

		else if ( lado1 != lado2 && lado2 != lado3 && lado1 != lado3 )
			System.out.println("escaleno");
		
		input.close();
	}
}
