
class Exe1 {
	public static void main(String[] args) {
		Pessoa1 pessoa[] = new Pessoa1[4];
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

			pessoa[i] = new Pessoa1(nome, email, telefone, endereco);
		}

		System.out.println("Impressao\n");

		for (int i = 0; i < 4; i++){
			System.out.println("Nome: " + pessoa[i].nome);
			
			System.out.println("Email: " + pessoa[i].email);
			
			System.out.println("Telefone: " + pessoa[i].telefone);
			
			System.out.println("Endereco: " + pessoa[i].endereco);
			
			System.out.println();
		}
	}
}

