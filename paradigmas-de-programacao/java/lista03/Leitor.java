import java.util.Scanner;

class Leitor {
	Scanner input = new Scanner(System.in);

	public float leNumeroFloat() {

		float ret = input.nextFloat();

		return ret;
	}

	public int leNumeroInt() {
		int ret = input.nextInt();

		return ret;
	}

	public double leNumeroDouble() {
		double ret = input.nextDouble();

		return ret;
	}

	public String leString() {
		String ret = input.nextLine();

		return ret;
	}
}
