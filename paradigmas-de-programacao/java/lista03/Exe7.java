import java.io.*;

public class Exe7 {
	public static void main(String[] args) throws IOException {
		Pessoa pessoa[] = new Pessoa[4];
		Leitor leitor = new Leitor();

		for (int i = 0; i < 4; i++){
			String nome, email, telefone, endereco;

			System.out.println("Nome:");
			nome = leitor.leString();
			
			System.out.println("Email:");
			email = leitor.leString();
			
			System.out.println("Telefone:");
			telefone = leitor.leString();
			
			System.out.println("Endereco:");
			endereco = leitor.leString();

			System.out.println();

			pessoa[i] = new Pessoa(nome, email, telefone, endereco);
			pessoa[i].grava();
		}
	}
}
