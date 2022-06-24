class AlunoL05 extends PessoaL05 {
    private String grr;

    public AlunoL05() {
    }

    public AlunoL05(String nome, String email, String grr) {
        super(nome, email);
        this.grr = grr;
    }

    public String getGrr() {
        return grr;
    }

    public void setGrr(String grr) {
        this.grr = grr;
    }
}