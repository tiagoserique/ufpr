(* 
ENUNCIADO
A decomposição em fatores primos é uma regra matemática importante quando se deseja encontrar 
o mínimo múltiplo comum e o máximo divisor comum entre dois ou mais números. A regra é definida por:
I) Dividir o número dado por um divisor primo.
II) Dividir o quociente da divisão anterior por outro número primo.
III) Repetir o processo até que o quociente da divisão seja igual a 1.
Sobre o número 180 o processo pode ser definido por:
// Devia ter uma imagem com os divisores primos
Fazer um programa em Free Pascal que leia um número inteiro positivo do teclado. 
Após a leitura, o programa deve calcular a decomposição em fatores primos do número informado e imprimir 
os fatores calculados.
Exemplo de entrada 1:
12
Saída esperada para a entrada acima:
2 2 3
Exemplo de entrada 1:
150
Saída esperada para a entrada acima:
2 3 5 5
*)

program 1fatoresprimos;
var
   val : integer;
begin
val := 0;

read(val);

 	if (val mod 2 = 0) then
 	begin
	while (val mod 2 = 0) do
		begin
        val := val div 2;
		write(2 ,' ');
		end;
	end;
 	if (val mod 3 = 0) then
 	begin	
	while (val mod 3 = 0) do
		begin
		val := val div 3;
		write(3 ,' ');
		end;
	end;
 	if (val mod 5 = 0) then
 	begin	
	while (val mod 5 = 0) do
		begin
		val := val div 5;
		write(5 ,' ');
		end;
	end;
	if (val mod 7 = 0) then
 	begin	
	while (val mod 7 = 0) do
		begin
		val := val div 7;
		write(7 ,' ');
		end;
	end;
	if (val <> 1) then
	write(val);
end.
