package lista09;


class Exe08L09 {
    public static void main(String[] args) {
        Fila fila = new Fila();

        fila.printQueue();
        System.out.println("tamanho: " + fila.size() + "\n");

        fila.enqueue("1");
        fila.printQueue();
        System.out.println("tamanho: " + fila.size() + "\n");

        fila.enqueue("2");
        fila.printQueue();
        System.out.println("tamanho: " + fila.size() + "\n");

        fila.enqueue("3");
        fila.printQueue();
        System.out.println("tamanho: " + fila.size() + "\n");

        fila.dequeue();
        fila.printQueue();
        System.out.println("tamanho: " + fila.size() + "\n");

        fila.dequeue();
        fila.printQueue();
        System.out.println("tamanho: " + fila.size() + "\n");

        fila.dequeue();
        fila.printQueue();
        System.out.println("tamanho: " + fila.size() + "\n");
        
        fila.dequeue();
        fila.printQueue();
        System.out.println("tamanho: " + fila.size() + "\n");
    }
}
