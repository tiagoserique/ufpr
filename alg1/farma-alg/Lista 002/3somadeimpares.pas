(* ENUNCIADO
Fazer um programa em Free Pascal que leia dois inteiros ímpares A e B, sendo A <= B. 
Após a leitura some todos os números ímpares contidos no intervalo entre A e B, considerando também A e B. 
Em resumo, o programa deverá executar a soma:
S=A+(A+2) + (A+4) + ...+ B
Exemplo de entrada: 
3 9
Saída esperada para a entrada acima:
24
*)

program 3somadeimpares;
var
   a, b, s: integer;

begin
a := 0;
b := 0;
s := 0;

read(a);
read(b);
   
   	while (a <= b) do  
   	begin
      s:=s+a;
      a:=a+2;
   	end;
writeln('Soma: ', s);
end.
