import java.io.*;

public class Exe7L03 {
	public static void main(String[] args) throws IOException {
		PessoaL03 pessoa[] = new PessoaL03[4];
		LeitorL03 leitor = new LeitorL03();

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

			pessoa[i] = new PessoaL03(nome, email, telefone, endereco);
			pessoa[i].grava();
		}
	}
}