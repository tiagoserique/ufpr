(* 
ENUNCIADO
Faça um programa em Free Pascal que leia duas listas de valores inteiros positivos, 
cada um deles terminado em zero. O zero indica o término da entrada de dados e não deve ser processado. 
Seu programa deve imprimir as duas listas na ordem inversa da entrada. 
Considere que o usuário nunca digitará mais do que 100 números antes do zero para cada conjunto.

Exemplo de entrada:
1 2 3 4 5 6 0
9 8 7 6 5 4 3 2 1 0

Saída esperada:
6 5 4 3 2 1
1 2 3 4 5 6 7 8 9
*)

program 1listainversa;
const
        max=100;
type
meuvetor = array [1 .. max] of integer;
var
        vetor, vetor2: meuvetor;
        cont, cont2: integer;


function lervetor(var vetor:meuvetor): integer;
var posi: integer;
begin
posi:=0;
repeat
        posi:=posi+1;
        read(vetor[posi]);
until vetor[posi] = 0;
lervetor:=posi;
end;


procedure imprimevetor(vetor:meuvetor; posi:integer);
begin
repeat
        posi:=posi-1;
        write(vetor[posi] ,' ');
until posi=1;
end;



begin
	cont:=0;
	cont2:=0;
	cont := lervetor(vetor);
	cont2:= lervetor(vetor2);
	imprimevetor(vetor,cont);
	writeln(' ');
	imprimevetor(vetor2,cont2);
end.
