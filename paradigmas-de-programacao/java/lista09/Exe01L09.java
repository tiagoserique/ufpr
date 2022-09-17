package lista09;

class Exe01L09 {
    public static void main(String[] args) {
        Pilha pilha = new Pilha();

        pilha.printStack();
        pilha.push("1");
        pilha.printStack();
        System.out.println("tamanho: " + pilha.size() + "\n");
        pilha.push("2");
        pilha.printStack();
        System.out.println("tamanho: " + pilha.size() + "\n");
        pilha.push("3");
        pilha.printStack();
        System.out.println("tamanho: " + pilha.size() + "\n");
        pilha.pop();
        pilha.printStack();
        System.out.println("tamanho: " + pilha.size() + "\n");
        pilha.pop();
        pilha.printStack();
        System.out.println("tamanho: " + pilha.size() + "\n");
        pilha.pop();
        pilha.printStack();
        System.out.println("tamanho: " + pilha.size() + "\n");
        pilha.pop();
        pilha.printStack();
        System.out.println("tamanho: " + pilha.size() + "\n");
    }
}
