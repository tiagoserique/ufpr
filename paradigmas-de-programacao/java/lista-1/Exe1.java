class Exe1 {
	public static void main(String[] args) {

		System.out.println("Adicao");
		for (int i = 0; i <= 10; i++){
			System.out.printf("%d + 6 = %d\n", i, i + 6);
		}

		System.out.println("\nsubtracao");
		for (int i = 6; i <= 16; i++){
			System.out.printf("%d - 6 = %d\n", i, i - 6);
		}

		System.out.println("\ndivisao");
		for (int i = 0; i <= 10; i++){
			System.out.printf("%d / 6 = %d\n", i * 6, i);
		}

		System.out.println("\nmultiplicacao");
		for (int i = 0; i <= 10; i++){
			System.out.printf("%d * 6 = %d\n", i, i * 6);
		}
	}
}
