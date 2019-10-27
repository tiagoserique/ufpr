(* 
ENUNCIADO
Fazer um programa em Free Pascal que leia um número inteiro positivo n. 
Em seguida leia uma sequência contendo n números inteiros. 
Se o valor de n for par o programa deve retornar a soma dos números pares da sequência, 
caso contrário o programa deve retornar a soma dos números ímpares.
Exemplo de entrada 1:
4
1 12 3 4
Saída esperada para a entrada acima:
16
Exemplo de entrada 2:
3
1 122 3001
Saída esperada para a entrada acima:
3002
*)

program 2somasepar;
var
   x, n, y, s: integer;

begin
x := 0;
n := 0;
y := 0;
s := 0;


read(n);
   while (x < n) do  
   begin  
      read(y);
         if (y mod 2 = 0) then
           s:= s + y;
      x:= x + 1;
   end;
if (n mod 2 = 1) then
writeln('Soma: impar')
else
writeln('Soma: ', s);
end.
