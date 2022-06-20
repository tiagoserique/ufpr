import java.util.Arrays;

class Aluno1L04 {
	String nome;
	String endereco;
	String email;
	String telefone;
	double notas[] = new double[4];

	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	
	public String getEndereco() {
		return endereco;
	}
	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	
	
	public double[] getNotas() {
		return notas;
	}
	public void setNotas(double[] notas) {
		this.notas = notas;
	}


	public void insereNota(double nota, int i){
		this.notas[i] = nota;
	}


	public double calculaMedia(){
		double media = 0;
		for (int i = 0; i <  this.notas.length; i++)
			media += this.notas[i] / this.notas.length;

		return media;
	}


	@Override
	public String toString() {
		return "Aluno2 [email=" + this.email + ", endereco=" + this.endereco + ", nome=" + this.nome + ", notas="
				+ Arrays.toString(this.notas) + ", telefone=" + this.telefone + "]";
	}
}