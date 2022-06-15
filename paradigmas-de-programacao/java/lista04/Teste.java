public class Teste {
	public static void main(String[] args) {
		Aluno1 a = new Aluno1();
		Aluno2 b = new Aluno2();

		a.nome = "andrey";
		a.email = "andrey@inf";
		a.endereco = "ufpr";
		a.telefone = "123";
		a.notas[0] = 5.2;
		a.notas[1] = 2.4;
		a.notas[2] = 7.5;
		a.notas[3] = 10;

		b.nome = "castilho";
		b.email = "castilho@inf";
		b.endereco = "ufpr";
		b.telefone = "0";
		b.notas[0] = 10;
		b.notas[1] = 10;
		b.notas[2] = 10;
		b.notas[3] = 10;

		System.out.println(a.toString());
		System.out.println(b.toString());

		System.out.printf("Media: %.2f\n", a.calculaMedia());
		System.out.printf("Media: %.2f\n", b.calculaMedia());
	}
}
