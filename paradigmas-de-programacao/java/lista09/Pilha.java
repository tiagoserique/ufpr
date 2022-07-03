public class Pilha {
    private NodoPilha topo = null;
    private String nome = "pilha";
    private int size = 0;

    public Pilha(){}

    // getters and setters
    private NodoPilha getTopo() {
        return this.topo;
    }

    private void setTopo(NodoPilha topo) {
        this.topo = topo;
    }

    public String getNome() {
        return this.nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    private int getSize() {
        return this.size;
    }

    private void setSize(int size) {
        this.size = size;
    }
    // getters and setters


    public void push(String elemento){
        NodoPilha novo_nodo = new NodoPilha(elemento);

        if ( !this.empty() ){
            novo_nodo.setProximo(this.getTopo());
        }
        
        this.setTopo(novo_nodo);

        int tamanho = this.getSize();
        this.setSize(++tamanho);
    }
    
    public void pop(){
        NodoPilha topo = this.getTopo();
        
        if ( topo != null ){
            NodoPilha novo_topo = topo.getProximo();
            
            topo.setProximo(null);

            this.setTopo(novo_topo);

            int tamanho = this.getSize();
            this.setSize(--tamanho);
        }
    }
    
    public String top(){
        NodoPilha nodo = this.getTopo();
        
        return nodo.getElemento();
    }
    
    public int size(){
        return this.getSize();
    }
    
    public boolean empty(){
        return ( this.getSize() == 0 ) ? true: false;
    }
    
    public void printStack(){
        if ( this.getSize() > 0 ){
            NodoPilha topo_atual = this.getTopo();

            while ( topo_atual != null ){
                System.out.println(topo_atual.getElemento());
                topo_atual = topo_atual.getProximo();
            }
        }
        else
            System.out.println("Pilha vazia");

        System.out.println();
    }
    
}