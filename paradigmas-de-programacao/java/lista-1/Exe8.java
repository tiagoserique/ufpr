import java.util.*;

class Exe8 {
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		int x;

		x = input.nextInt();

		System.out.println("Adicao");
		for (int i = 0; i <= 10; i++){
			System.out.printf("%d + %d = %d\n", i, x, i + x);
		}

		System.out.println("\nsubtracao");
		for (int i = x; i <= 10 + x; i++){
			System.out.printf("%d - %d = %d\n", i, x, i - x);
		}

		System.out.println("\ndivisao");
		for (int i = 0; i <= 10; i++){
			System.out.printf("%d / %d = %d\n", i * x, x, i);
		}

		System.out.println("\nmultiplicacao");
		for (int i = 0; i <= 10; i++){
			System.out.printf("%d * %d = %d\n", i, x, i * x);
		}
		
		input.close();
	}
}
