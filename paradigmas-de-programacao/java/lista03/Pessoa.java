import java.io.IOException;

class Pessoa {
	String nome;
	String endereco;
	String telefone;
	String email;

	public Pessoa(){
	}

	public Pessoa(String nome, String endereco, String telefone, String email){
		this.nome = nome;
		this.endereco = endereco;
		this.telefone = telefone;
		this.email = email;
	}

	public void setNome(String nome){
		this.nome = nome;
	}
	public String getNome(){
		return this.nome;
	}

	public void setEndereco(String endereco){
		this.endereco = endereco;
	}
	public String getEndereco(){
		return this.endereco;
	} 

	public void setTelefone(String telefone){
		this.telefone = telefone;
	}
	public String getTelefone(){
		return this.telefone;
	} 

	public void setEmail(String email){
		this.email = email;
	}
	public String getEmail(){
		return this.email;
	}

	public void grava() throws IOException{
		String frase = this.nome + "\t" 
					+ this.endereco + "\t" 
					+ this.telefone + "\t" 
					+ this.email;
					
		Arquivo.gravar(frase, "arquivo.txt");
	}

	@Override
	public String toString() {
		return "Pessoa [email=" + email + ", endereco=" + endereco + ", nome=" + nome + ", telefone=" + telefone + "]";
	}
}
