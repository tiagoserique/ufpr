import java.util.*;

class Exe5L03 {
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);

		String frase = input.nextLine();

		for (int i = frase.length() - 1; i >= 0; i--)
			System.out.print(frase.charAt(i));

		System.out.println();
		input.close();
	}
}
