import java.io.*;

class ArquivoL05 {
    public ArquivoL05(){
    }

    public void gravaAlunos(AlunoL05[] alunos){
        try {
            FileOutputStream arq = new FileOutputStream("alunos.txt");
            ObjectOutputStream out = new ObjectOutputStream(arq);

            out.writeInt(alunos.length);

            for (int i = 0; i < alunos.length; i++){
                out.writeObject(alunos[i]);
                out.flush();
            }

            out.close();            
        } catch (Exception e) {
            System.out.println("Erro ao gravar arquivo");
        }
    }

    public AlunoL05[] leAlunos(){
        try {
            FileInputStream arq = new FileInputStream("alunos.txt");
            ObjectInputStream in = new ObjectInputStream(arq);

            int tamanho = in.readInt();
            AlunoL05 alunos[] = new AlunoL05[tamanho];

            for (int i = 0; i < alunos.length ; i++){
                alunos[i] = (AlunoL05) in.readObject();
            }

            in.close();

            return alunos;
        }
        catch (Exception e) {
            System.out.println("Erro ao ler arquivo");
        }

        return null;
    }
}
