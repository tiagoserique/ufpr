class Exe01L06 {
    private int[] array;

    public Exe01L06(){
    }

    public Exe01L06(int[] array){
        this.setArray(array);
    }

    public int busca(int elemento){
        int i = 0, posicao = 0;
        boolean achou = false; 

        while ( i < this.array.length && !achou ){
            if ( this.array[i] == elemento ){
                posicao = i;
                achou = true;
            }
            
            i++;
        }

        return posicao;
    }

    public void ordena(){
        int key;

        for (int i = 0; i < this.array.length; i++){
            key = i;

            for (int j = i + 1; j < this.array.length; j++){
                if ( this.array[key] > this.array[j] ){
                    key = j;
                }
            }
            
            int aux = this.array[key];
            this.array[key] = this.array[i];
            this.array[i] = aux;
        }
    }

    public void exibe(){
        for(int i = 0; i < this.array.length; i++){
            System.out.print(array[i] + " ");
        }
        System.out.println();
    }

    public int[] getArray() {
        return this.array;
    }

    public void setArray(int[] array) {
        this.array = array;
    }
}

class Main01L06 {
    public static void main(String[] args) {
        int[] array = {10, 2, 5, 8, 5};
        Exe01L06 tad_array = new Exe01L06(array);

        tad_array.exibe();
        System.out.printf("Busca pelo numero 8:\nresposta certa: 3\nresposta dada: %d\n", tad_array.busca(8));
        tad_array.ordena();
        tad_array.exibe();
    }
}