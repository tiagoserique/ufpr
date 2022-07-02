public class NodoPilha {
    private String elemento;
    private NodoPilha proximo;
    
    public NodoPilha(){}
    
    public NodoPilha(String elemento){
        setElemento(elemento);
    }

    public NodoPilha(String elemento, NodoPilha proximo){
        setElemento(elemento);
        setProximo(proximo);
    }

    public String getElemento() {
        return this.elemento;
    }

    public void setElemento(String elemento) {
        this.elemento = elemento;
    }

    public NodoPilha getProximo() {
        return this.proximo;
    }

    public void setProximo(NodoPilha proximo) {
        this.proximo = proximo;
    }
}
