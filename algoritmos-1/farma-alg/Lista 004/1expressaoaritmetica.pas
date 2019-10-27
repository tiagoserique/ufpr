(* ENUNCIADO
Escreva um programa em Pascal que leia 6 valores reais para as variáveis A,B,C,D,E, F e imprima o 
valor de X após o cálculo da seguinte expressão aritmética:
X=((A+B)/(C-D)*E)/(F/A*B)+E
Seu programa deve imprimir a mensagem "divisao por zero" caso o denominador seja zero. 
Caso isso não ocorra seu programa irá abortar neste caso, o que não é correto.
Exemplos de entrada e saída:
Exemplo de entrada 1:
1 2 3 4 5 6
Saída esperada:
-1.8750000000000000E+000
Exemplo de entrada 2:
0 0 0 0 0 0
Saída esperada:
divisao por zero
*)

program 1expressaoaritmetica;
var
a,b,c,d,e,f,x :real;
begin
a:=0;
b:=0;
c:=0;
d:=0;
e:=0;
f:=0;                                    
x:=0;
read(a,b,c,d,e,f);

if (((a=0) or (b=0)) or (e=0) or ((c-d) = 0) or (a*b = 0) or (e = -1)) then
writeln('divisao por zero')

else if (((a<>0) and (b<>0)) and (e<>-1)and(e<>1)) then
begin
x:=(((a+b)/(c-d))*e)/((f/(a*b))+e);
writeln(x);
end;
end.
