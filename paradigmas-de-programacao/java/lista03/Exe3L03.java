import java.util.*;

class Exe3L03 {
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);

		double celsius, farenheit;

		System.out.println("Digite os graus em celsius:");
		celsius = input.nextDouble();

		farenheit = celsiusToFarenheit(celsius);

		System.out.println("Graus em farenheit: " + farenheit);

		input.close();
	}

	public static double celsiusToFarenheit(double c){
		double f = c * 1.8 + 32;

		return f;
	}
}
