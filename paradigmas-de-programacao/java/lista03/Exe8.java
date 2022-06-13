public class Exe8 {
	public static void main(String[] args) {
		Produto prod1 = new Produto();
		Produto prod2 = new Produto(
			123, 
			"coca cola", 
			3, 
			65
		);

		Pessoa pessoa1 = new Pessoa();
		Pessoa pessoa2 = new Pessoa(
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
