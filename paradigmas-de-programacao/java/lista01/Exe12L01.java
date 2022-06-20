import java.util.*;

class Exe12L01 {
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);

		double aluno_maior_nota = 0, turma_maior_nota = 0;


		for (int i = 0; i < 30; i++){
			aluno_maior_nota = input.nextDouble();
			for (int j = 0; j < 3; j++){
				double nova_nota = input.nextDouble();
				
				if ( nova_nota > aluno_maior_nota )
					aluno_maior_nota = nova_nota;
			}

			System.out.println("Maior nota do aluno " + i + ": " + aluno_maior_nota);

			if ( aluno_maior_nota > turma_maior_nota )
				turma_maior_nota = aluno_maior_nota;
		}

		System.out.println("Maior nota da turma: " + turma_maior_nota);
		input.close();
	}
}
