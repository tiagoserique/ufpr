import java.util.*;

class Exe6 {
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);

		String frase[] = input.nextLine()
			.replace("!", "")
			.replace(".", "")
			.replace(",", "")
			.replace("?", "")
			.split(" ");

		System.out.println("Possui " + frase.length + " palavras");

		input.close();
	}
}
