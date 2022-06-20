
class ProdutoL03 {
	private int codigo;
	private String nome;
	private int quantidade;
	private double preco;

	public ProdutoL03(){
	}

	public ProdutoL03(int codigo, String nome, int quantidade, double preco)
	{
		this.setCodigo(codigo);
		this.setNome(nome);
		this.setQuantidade(quantidade);
		this.setPreco(preco);
	}

	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}

	public double getPreco() {
		return preco;
	}
	public void setPreco(double preco) {
		this.preco = preco;
	}

	@Override
	public String toString() {
		return "Produto [codigo=" + codigo + ", nome=" + nome + ", preco=" + preco + ", quantidade=" + quantidade + "]";
	}
}