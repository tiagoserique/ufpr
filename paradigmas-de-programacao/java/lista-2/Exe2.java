import java.io.*;

class Exe2 {
	public static void main(String[] args)throws IOException {
		BufferedReader input = new BufferedReader(new InputStreamReader(System.in));

		int idades[] = new int[10];
		double media = 0;

		for (int i = 0; i < 10; i++)
			idades[i] = Integer.parseInt(input.readLine());

		for (int i = 0; i < 10; i++)
			media += idades[i];

		media /= 10;
		System.out.println("Media: " + media);

		for (int i = 0; i < 10; i++)
			if ( idades[i] >= media )
				System.out.println("Acima da media: " + idades[i]);
			else
				System.out.println("Abaixo da media: " + idades[i]);
	}
}
