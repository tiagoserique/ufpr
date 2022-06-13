import java.util.*;

class Exe10 {
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);

		int acima_do_peso = 0;

		double peso = 0, altura = 0; 

		boolean condition = true;

		while ( condition ){
			peso = input.nextDouble();
			
			condition = peso != -1;
			
			if ( condition ){ 
				altura = input.nextDouble();
				condition = altura != -1;
			
				if ( condition ){
					double bmi = peso / ( altura * altura );
					if ( bmi > 25 ){
						acima_do_peso++;
						System.out.println("Acima do peso");
					}
				}
			}

		}

		System.out.println(acima_do_peso + " pessoa(s) esta(o) acima do peso");
		input.close();
	}
}
