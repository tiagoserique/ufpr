public class Exe8L03 {
	public static void main(String[] args) {
		ProdutoL03 prod1 = new ProdutoL03();
		ProdutoL03 prod2 = new ProdutoL03(
			123, 
			"coca cola", 
			3, 
			65
		);

		PessoaL03 pessoa1 = new PessoaL03();
		PessoaL03 pessoa2 = new PessoaL03(
			"tiago",
			"XV",
			"123",
			"tiago@ufpr.com"
		);

		System.out.println(prod1.toString());
		System.out.println(prod2.toString());
		System.out.println(pessoa1.toString());
		System.out.println(pessoa2.toString());
	}
}
