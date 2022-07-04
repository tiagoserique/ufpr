public class Nodo {
    private String elemento;
    private Nodo proximo = null;
    private Nodo anterior = null;
    
    public Nodo(){}
    
    public Nodo(String elemento){
        setElemento(elemento);
    }

    public Nodo(String elemento, Nodo proximo){
        setElemento(elemento);
        setProximo(proximo);
    }

    public String getElemento() {
        return this.elemento;
    }

    public void setElemento(String elemento) {
        this.elemento = elemento;
    }

    public Nodo getProximo() {
        return this.proximo;
    }

    public void setProximo(Nodo proximo) {
        this.proximo = proximo;
    }

    public Nodo getAnterior() {
        return anterior;
    }

    public void setAnterior(Nodo anterior) {
        this.anterior = anterior;
    }
}
