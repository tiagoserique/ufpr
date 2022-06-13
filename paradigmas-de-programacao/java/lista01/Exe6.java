import java.util.*;

class Exe6 {
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		int x;

		x = input.nextInt();

		if ( x >= 0 && x < 5 )
			System.out.println(x);

		else if ( x >= 5 && x < 10 )
			System.out.println(2 * x + 1);
		
		else if ( x >= 10 )
			System.out.println(x - 3);
		
		input.close();
	}
}
