(* 
ENUNCIADO
Fazer um programa em Free Pascal que leia do teclado um número inteiro que representa uma quantidade de segundos 
(unidade de medida de ângulo geométrico) e que imprima na tela o seu valor equivalente em graus, minutos e segundos.
Se a quantidade de segundos for insuficiente para dar o valor 1 (um) em graus, o valor em graus deve ser 0 (zero).
A mesma observação vale em relação aos minutos e segundos.

Exemplo de entrada 1: 3600
Saída esperada para a entrada acima: 1 graus, 0 minutos e 0 segundos
Exemplo de entrada 2: 3500
Saída esperada para a entrada acima: 0 graus, 58 minutos e 20 segundos
*)

program 3segemgrau;
var 
   grau, min, val, seg :integer;
begin 
read(val);
grau := val div 3600;
min := (val div 60);
  if (min >= 60) then
  min:= min - (60*grau);
seg := val mod 60;
writeln(grau,' grau(s), ', min, ' minuto(s), ',seg,' segundo(s)');
end.
