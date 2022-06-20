class Exe02L01 {
	public static void main(String[] args) {
		int a = 1, b = 1, c = -6;
		double x1, x2, delta;

		delta = Math.pow(b, 2) - 4 * a * c;

		x1 = ( -b + Math.sqrt(delta) )/2 * a;
		x2 = ( -b - Math.sqrt(delta) )/2 * a;

		System.out.println("x1 = " + x1);
		System.out.println("x2 = " + x2);
	}
}