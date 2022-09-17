package lista09;

public class Pilha {
    private Nodo topo = null;
    private int size = 0;

    public Pilha(){}

    public void push(String elemento){
        Nodo novo_nodo = new Nodo();
        novo_nodo.elemento = elemento;

        if ( !this.empty() ){
            novo_nodo.proximo = this.topo;
        }
        
        this.topo = novo_nodo;

        this.size += 1;
    }
    
    public void pop(){
        Nodo topo = this.topo;
        
        if ( topo != null ){
            Nodo novo_topo = topo.proximo;
            
            topo.proximo = null;

            this.topo = novo_topo;

            this.size -= 1;
        }
    }
    
    public String top(){
        Nodo nodo = this.topo;
        
        return nodo.elemento;
    }
    
    public int size(){
        return this.size;
    }
    
    public boolean empty(){
        return ( this.size == 0 ) ? true: false;
    }
    
    public void printStack(){
        if ( this.size > 0 ){
            Nodo topo_atual = this.topo;

            while ( topo_atual != null ){
                System.out.println(topo_atual.elemento);
                topo_atual = topo_atual.proximo;
            }
        }
        else
            System.out.println("Pilha vazia");

        System.out.println();
    }
    
}