package lista09;


public class Fila {
    private Nodo inicio = null;
    private Nodo fim = null;
    private int size = 0;


    public Fila(){}

    public void enqueue(String elemento){
        Nodo novo_nodo = new Nodo();
        novo_nodo.elemento = elemento;

        if ( this.size > 0 ){
            this.fim.proximo = novo_nodo;
            this.fim = this.fim.proximo;
        }
        else {
            this.inicio = novo_nodo; 
            this.fim = novo_nodo; 
        }

        this.size += 1;
    }
    
    public void dequeue(){
        if ( this.size > 0 ){
            Nodo aux = this.inicio;
            this.inicio = this.inicio.proximo;

            aux.proximo = null;
            aux = null;

            this.size -= 1;
        }
    }
    
    public int size(){
        return this.size;
    }

    public boolean empty(){
        return ( this.size == 0 )? true : false;
    }

    public void printQueue(){
        if ( this.size > 0 ){
            Nodo aux = this.inicio;

            while ( aux != this.fim.proximo ){
                System.out.print(aux.elemento + " ");

                aux = aux.proximo;
            }

            System.out.println();
        }
        else
            System.out.println("Fila vazia");

    }
}
