class ManterAlunoL05 {
    public ManterAlunoL05(){
    }
    
    public AlunoL05[] inserirAluno(AlunoL05[] alunos, AlunoL05 aluno){
        AlunoL05 nova_lista_alunos[] = new AlunoL05[alunos.length + 1];

        for (int i = 0; i < alunos.length; i++){
            nova_lista_alunos[i] = alunos[i];
        }

        nova_lista_alunos[alunos.length] = aluno;

        return nova_lista_alunos;
    } 
    
    public AlunoL05[] removerAluno(AlunoL05[] alunos, AlunoL05 aluno){
        AlunoL05 nova_lista_alunos[] = new AlunoL05[alunos.length - 1];

        for (int i = 0; i < alunos.length; i++){
            boolean nome  = alunos[i].getNome().equals(aluno.getNome());
            boolean email = alunos[i].getEmail().equals(aluno.getEmail());
            boolean grr   = alunos[i].getGrr().equals(aluno.getGrr());

            if ( !nome || !email || !grr )
                nova_lista_alunos[i] = alunos[i];
        }

        return nova_lista_alunos;
    }
    
    public void salvarAlunos(AlunoL05[] alunos){
        ArquivoL05 arq = new ArquivoL05();

        arq.gravaAlunos(alunos);
    }
    
    public AlunoL05[] recuperarAlunos(){
        ArquivoL05 arq = new ArquivoL05();

        return arq.leAlunos();
    }
}
