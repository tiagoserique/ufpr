package lista09;


class Exe07L09 {
    public static void main(String[] args) {
        Lista lista = new Lista();

        lista.printList();
        lista.insert("1", 0);
        lista.printList();
        System.out.println("tamanho: " + lista.size() + "\n");
        lista.insert("2", 1);
        lista.printList();
        System.out.println("tamanho: " + lista.size() + "\n");
        lista.insert("3", 2);
        lista.printList();

        System.out.println("Elemento na posicao 1: " + lista.elementAt(1));
        System.out.println("Elemento na posicao 2: " + lista.elementAt(2));
        System.out.println("Elemento na posicao 3: " + lista.elementAt(3));
        System.out.println("Elemento na posicao 0: " + lista.elementAt(0));

        System.out.println("tamanho: " + lista.size() + "\n");
        lista.remove(2);
        lista.printList();
        System.out.println("tamanho: " + lista.size() + "\n");
        lista.remove(1);
        lista.printList();
        System.out.println("tamanho: " + lista.size() + "\n");
        lista.remove(0);
        lista.printList();
        System.out.println("tamanho: " + lista.size() + "\n");
        lista.remove(0);
        lista.printList();
        System.out.println("tamanho: " + lista.size() + "\n");
    }
}
