import java.io.*;

class Exe2L03 {
	public static void main(String[] args) throws IOException {
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

			String frase = "[email=" + email 
						+ ", endereco=" + endereco 
						+ ", nome=" + nome 
						+ ", telefone=" + telefone 
						+ "]";

			ArquivoL03.gravar(frase, "arquivo.txt");
		}
	}
}
