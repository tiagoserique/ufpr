(* 
ENUNCIADO
Fazer um programa em Free Pascal que leia seis números (a11, a12, b1, a21, a22, b2) 
e imprima uma solução para o sistema de equações lineares abaixo:
a11 x + a12 y = b1
a21 x + a22 y = b2
O método de cálculo do sistema é indiferente, desde que o resolva independente dos valores informados.
Veja um exemplo de execução incluindo entrada e saída:
Exemplo de entrada:
2.0 1.0 11.0 5.0 7.0 13.0
Saída esperada para a entrada acima:
x = 7.111
y = -3.222
*)

program 5equacoeslineares;
var
   a11, a12, b1, a21, a22, b2: real;
   x, y: real;
begin 
read(a11);
read(a12);
read(b1);
read(a21);
read(a22);
read(b2);

x := ((b2 * a12) - (a22 * b1)) / ((a21 * a12) - (a11 * a22));
y := (b1 - a11 * x) / a12;

writeln('x = ', x:0:3);
writeln('y = ', y:0:3);
end.
