public class Exe8 {
	public static void main(String[] args) {
		Produto prod1 = new Produto();
		Produto prod2 = new Produto(
			123, 
			"coca cola", 
			3, 
			65
		);

		Pessoa1 pessoa1 = new Pessoa1();
		Pessoa1 pessoa2 = new Pessoa1(
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
