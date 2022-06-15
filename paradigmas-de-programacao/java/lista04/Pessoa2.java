import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

public class Pessoa2 implements Serializable {
	private String nome;
	private String email;

	public Pessoa2(){}

	public Pessoa2(String nome, String email){
		this.nome = nome;
		this.email = email;
	}

	public String getNome() {
		return this.nome;
	}

	public String getEmail() {
		return this.email;
	}
}


class ObjTeste {
	public static void main(String[] args) {
		try {
			FileOutputStream arq = new FileOutputStream("arquivo.txt");
			ObjectOutputStream out = new ObjectOutputStream(arq);

			for (int i = 0; i < 5; i++){
				Pessoa2 p = new Pessoa2("pessoa" + i, "pessoa" + i + "@spet");
				out.writeObject(p);
				out.flush();
			}
			
			out.close();
		}
		catch ( java.io.IOException ioex ) {
			System.out.println("Erro ao gravar arquivo");
		}

		try {
			FileInputStream arq = new FileInputStream("arquivo.txt");
			ObjectInputStream in = new ObjectInputStream(arq);

			for (int i = 0; i < 5; i++){
				Pessoa2 p = (Pessoa2) in.readObject();
				System.out.println(p.getNome());
				System.out.println(p.getEmail());
			}
			in.close();
		}
		catch ( java.io.IOException ioex ){
			System.out.println("Erro ao ler arquivo");
		}
		catch ( ClassNotFoundException cnfex ){
			System.out.println("Nao achou a classe");
		}
	}
}
