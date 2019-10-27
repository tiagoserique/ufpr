(* 
ENUNCIADO
Fazer um programa em Free Pascal que leia do teclado um número inteiro
positivo n e determine o resultado do somatório definido por:
S=1/n + 2/(n-1) + 3/(n-2) + ... + n/1
Exemplo de entrada:
3
Saída esperada para a entrada acima:
4.3333333333333330E+000
*)

program 1somatorioinverso.pas;
var
   s, n, x : real;
begin
x:= 0;
s:= 0;
read(n);
while x<n do
    begin
      x:=x+1;
      s:=s+x/(n+1-x);
      end;
writeln('Somatorio: ', s:0:2);
end.
