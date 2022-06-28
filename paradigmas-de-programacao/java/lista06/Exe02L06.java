class Exe02L06 {
    public double soma(double num1, double den1, double num2, double den2){
        return ( num1/den1 ) + ( num2/den2 );
    }

    public double subtracao(double num1, double den1, double num2, double den2){
        return ( num1/den1 ) - ( num2/den2 );
    }

    public double multiplicacao(double num1, double den1, double num2, double den2){
        return ( num1/den1 ) * ( num2/den2 );
    }

    public double divisao(double num1, double den1, double num2, double den2){
        return ( num1/den1 ) / ( num2/den2 );
    }
}

class Main02L06 {
    public static void main(String[] args) {
        Exe02L06 fracoes = new Exe02L06();

        System.out.println(fracoes.soma(1, 2, 1, 2));
        System.out.println(fracoes.subtracao(1, 2, 1, 2));
        System.out.println(fracoes.divisao(1, 2, 1, 2));
        System.out.println(fracoes.multiplicacao(1, 2, 1, 2));
    }
}
