import java.io.*;

class Exe04L02 {
	public static void main(String[] args)throws IOException {
		BufferedReader input = new BufferedReader(new InputStreamReader(System.in));

		String nomes[] = new String[10];

		for (int i = 0; i < 10; i++)
			nomes[i] = input.readLine();

		String nome = input.readLine();

		for (int i = 0; i < 10; i++)
			if ( nomes[i].equals(nome) )
				System.out.println("Esta na lista");
	}	
}
