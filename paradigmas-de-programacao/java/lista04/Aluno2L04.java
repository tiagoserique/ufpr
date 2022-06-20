import java.util.Arrays;

public class Aluno2L04 extends Pessoa1L04 {
	double notas[] = new double[4];

	public double[] getNotas() {
		return this.notas;
	}

	public void setNotas(double[] notas) {
		this.notas = notas;
	}

	
	public void insereNota(double nota, int i){
		this.notas[i] = nota;
	}


	public double calculaMedia(){
		double media = 0;
		for (int i = 0; i < this.notas.length; i++)
			media += this.notas[i] / this.notas.length;

		return media;
	}


	@Override
	public String toString() {
		return "Aluno2 [email=" + this.email + ", endereco=" + this.endereco + ", nome=" + this.nome + ", notas="
				+ Arrays.toString(this.notas) + ", telefone=" + this.telefone + "]";
	}
}
