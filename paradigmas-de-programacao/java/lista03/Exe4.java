import java.util.*;

class Exe4 {
	public static void main(String[] args) {
		int qtde;
		
		double produto = 100.0, valComissao = 0;

		Scanner input = new Scanner(System.in);

		for (int i = 1; i < 30; i++){
			System.out.println("digite a quantidade vendida");
			qtde = input.nextInt();

			if ( qtde < 10 )
				valComissao = comissao(10, qtde, produto);
			else if ( qtde < 30 )
				valComissao = comissao(15, qtde, produto);
			else
				valComissao = comissao(12, qtde, produto);

			System.out.println("O valor da comissao eh " + valComissao);
			System.out.println();
		}

		input.close();
	}

	public static double comissao(double perc, int quantidade, double valorProduto){
		double valorComissao = (valorProduto * perc * quantidade)/100;

		if ( valorComissao > 1000 )
			valorComissao += valorComissao * 0.02;

		return valorComissao;
	}
}