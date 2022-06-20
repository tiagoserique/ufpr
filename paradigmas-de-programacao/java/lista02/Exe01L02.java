import java.io.*;

class Exe01L02 {
	public static void main(String[] args)throws IOException {
		BufferedReader input = new BufferedReader(new InputStreamReader(System.in));

		String nomes[] = new String[5];

		int sorteio = (int) (Math.random() * 5);

		for (int i = 0; i < 5; i++)
			nomes[i] = input.readLine();

		System.out.println("O vencedor eh " + nomes[sorteio]);
	}
}