import java.util.*;

class Principal {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        Menu menu = new Menu();

        AlunoL05[] lista_alunos = new AlunoL05[0];

        ManterAlunoL05 manter_alunos = new ManterAlunoL05();

        boolean sair = false;

        String nome, email, grr;

        while ( !sair ){
            menu.mostraMenu();
            
            int opcao = input.nextInt();
            
            input.nextLine();

            switch (opcao) {
                case 1:
                    System.out.println("Inserir Aluno");
                    System.out.println("Nome aluno:");
                    nome = input.nextLine();
                    System.out.println("Email aluno:");
                    email = input.nextLine();
                    System.out.println("GRR aluno:");
                    grr = input.nextLine();

                    AlunoL05 aluno = new AlunoL05(nome, email, grr); 
                    manter_alunos.inserirAluno(lista_alunos, aluno);

                    break;
                case 2:
                    System.out.println("Remover Aluno");
                    System.out.println("Nome aluno:");
                    nome = input.nextLine();
                    System.out.println("Email aluno:");
                    email = input.nextLine();
                    System.out.println("GRR aluno:");
                    grr = input.nextLine();

                    break;
                case 3:
                    System.out.println("Salvar alunos");

                    manter_alunos.salvarAlunos(lista_alunos);

                    break;
                case 4:
                    System.out.println("Recuperar alunos");

                    lista_alunos = manter_alunos.recuperarAlunos();

                    break;
                case 5:
                    System.out.println("Sair");

                    sair = true;
                    break;
                default:
                    System.out.println("Opção inválida");

                    break;
            }
        }

        input.close();
    }    
}
