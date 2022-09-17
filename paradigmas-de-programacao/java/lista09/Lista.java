package lista09;

public class Lista {
    private Nodo inicio = null;
    private int size    = 0;

    public Lista(){}

    public void insert(String elemento, int pos){
        Nodo novo_nodo = new Nodo();
        novo_nodo.elemento = elemento; 

        if ( pos >= 1 ){
            Nodo aux = this.inicio;
            int i = 1;
            
            while ( ( i < pos ) && ( aux.proximo != null ) ){
                aux = aux.proximo;
                i++;
            }
            
            novo_nodo.proximo = aux.proximo;
            aux.proximo = novo_nodo;
        }
        else {
            novo_nodo.proximo = this.inicio;
            this.inicio = novo_nodo;            
        }

        this.size += 1;
    }


    public void remove(int pos){
        if ( this.size > 0 ){
            Nodo deletado_nodo, aux = this.inicio;
            int i = 1;

            while ( ( i < pos - 1 ) && ( aux.proximo != null ) ){
                aux = aux.proximo;
                i++;
            }

            if ( i > 1 ){
                deletado_nodo = aux.proximo;
                aux.proximo = aux.proximo.proximo;
                
            }
            else {
                deletado_nodo = this.inicio;
                this.inicio = deletado_nodo.proximo;
            }
            
            deletado_nodo.proximo = null;
            deletado_nodo = null;

            this.size -= 1;
        }
    }


    public String elementAt(int pos){
        if ( pos >= this.size || pos < 0 )
            return "nao ha esta posicao no vetor";

        Nodo aux = this.inicio;
        int i = 0;

        while ( ( i < pos ) && ( aux.proximo != null ) ){
            aux = aux.proximo;
            i++;
        }

        return aux.elemento;
    }


    public void printList(){
        if ( this.size > 0 ){

            Nodo aux = this.inicio;
            
            while ( aux != null ){
                System.out.print(aux.elemento + " ");
                
                aux = aux.proximo;
            }
            
            System.out.println();
        }
        else {
            System.out.println("Lista vazia");
        }

        System.out.println();
    }


    public boolean empty(){
        return ( this.size == 0 )? true : false;
    }


    public int size(){
        return this.size;
    }
}
