(* 
ENUNCIADO
Matematicamente, dadas duas frações ordinárias a/b e c/d, a soma e o produto destas frações é: 
S=((M*a)/b+(M*c)/b)/M
M=(a*c/D)/(b*d/D)
Onde:
M = m.m.c(b,d) *Mínimo Múltiplo Comum.
D = m.d.c(a x c,b x d) *Máximo Divisor Comum.
Contudo, computacionalmente, não é possível entrar com uma fração na sua representação simbólica. 
Por isso, neste exercício, para ler uma fração você deve digitar dois números inteiros A e B que
representarão A/B e outros dois números inteiros C e D que representarão C/D. 
Como estamos no inicio do aprendizado, podemos ignorar o cálculo do MMC e do MDC e simplesmente
fazer uma conta mais simples, apenas o resultado não estará simplificado.
Assim, faça um programa em Free Pascal que leia do teclado quatro variáveis A, B, C e D inteiras e faça o cálculo 
seguinte:
S=(A*D+B*C)/B*D
M=(a*c)/(b*D)
Seu programa deve imprimir os resultados na tela no formato mostrado nos exemplos abaixo.
Exemplo de entrada:
2 15 5 4
Saída esperada para a entrada acima:
A soma = 83 / 60
O produto = 10 / 60
*)

program 4somaeproduto;
var
   a,b,c,d,x,y,z,w: integer;

begin

read(a);
read(b);
read(c);
read(d);

x := (a*d)+(c*b);
y := (b*d);
z := (a*c);
w := (b*d);

writeln('A soma = ', x ,' / ', y);
writeln('O produto = ', z ,' / ', w);

end.
