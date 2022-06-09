import java.util.*;

class Exe5 {
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		int valor;
	
		valor = input.nextInt();

		if ( valor % 2 == 0 )
			System.out.println("Par");
		else
			System.out.println("Impar");
			
		input.close();
	}
}
