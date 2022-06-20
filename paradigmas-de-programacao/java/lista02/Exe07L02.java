import java.util.*;

class Exe07L02 {
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);

		String nome = input.nextLine();
		String array_nomes[] = nome.split(" ");

		String referencia = array_nomes[1] + ", " + array_nomes[0].charAt(0) + ".";

		System.out.println(referencia);

		input.close();
	}
}
