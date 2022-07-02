
class Exe01L09 {
    public static void main(String[] args) {
        Pilha pilha = new Pilha();

        pilha.imprimePilha();
        pilha.push("1");
        pilha.imprimePilha();
        System.out.println("tamanho: " + pilha.size() + "\n");
        pilha.push("2");
        pilha.imprimePilha();
        System.out.println("tamanho: " + pilha.size() + "\n");
        pilha.push("3");
        pilha.imprimePilha();
        System.out.println("tamanho: " + pilha.size() + "\n");
        pilha.pop();
        pilha.imprimePilha();
        System.out.println("tamanho: " + pilha.size() + "\n");
        pilha.pop();
        pilha.imprimePilha();
        System.out.println("tamanho: " + pilha.size() + "\n");
        pilha.pop();
        pilha.imprimePilha();
        System.out.println("tamanho: " + pilha.size() + "\n");
        pilha.pop();
        pilha.imprimePilha();
        System.out.println("tamanho: " + pilha.size() + "\n");
    }
}
