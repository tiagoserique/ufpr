class Exe5 {
	public static void main(String[] args) {
		int m1[][] = { {1, 2, 3}, {4, 5, 6}, {7, 8, 9} };
		int m2[][] = { {9, 8, 7}, {6, 5, 4}, {3, 2, 1} };
		int re[][] = new int[3][3];

		for (int i = 0; i < re.length; i++)
			for (int j = 0; j < re[i].length; j++)
				re[i][j] = m1[i][j] + m2[i][j]; 

		for (int i = 0; i < re.length; i++){
			for (int j = 0; j < re[i].length; j++)
				System.out.printf("%d ", m1[i][j]);
			System.out.println("");
		}

		System.out.println("");

		for (int i = 0; i < re.length; i++){
			for (int j = 0; j < re[i].length; j++)
				System.out.printf("%d ", m2[i][j]);
			System.out.println("");
		}

		System.out.println("");
		
		for (int i = 0; i < re.length; i++){
			for (int j = 0; j < re[i].length; j++)
				System.out.printf("%d ", re[i][j]);
			System.out.println("");
		}
	}
}
