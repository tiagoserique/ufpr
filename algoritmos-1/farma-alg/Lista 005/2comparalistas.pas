(* ENUNCIADO
Faça um programa em Free Pascal que leia duas listas de valores inteiros positivos, 
cada um deles terminado em zero. O zero indica o término da entrada de dados e não deve ser processado. 
Seu programa deve inicialmente testar se as duas listas têm o mesmo número de elementos. 
Se não tiverem deve imprimir a mensagem "Tamanhos diferentes". 
Caso tenham o mesmo tamanho, seu programa deve verificar se um conjunto é o inverso do outro.
Se forem, imprimir "Sim" e em caso contrário, imprimir "Nao"

Exemplo de entrada 1:
1 2 3 4 5 6 0
9 8 7 6 5 4 3 2 1 0
Saída esperada:
Tamanhos diferentes

Exemplo de entrada 2:
1 2 3 4 5 6 0
6 5 4 3 2 1 0
Saída esperada:
Sim

Exemplo de entrada 3:
1 7 3 3 5 6 0
6 5 4 3 2 1 0
Saída esperada:
Nao
*)

program 2comaparalistas;
const
max = 100;
var
	vetor, vetor2: array [1 .. max] of integer;
	cont, cont2, aux, invert: integer;

begin
	cont:=0;
	repeat 
		cont:=cont+1;
		read(vetor[cont]);
	until vetor[cont] = 0;
	
	cont2:=0;
        repeat 
        cont2:=cont2+1;
	read(vetor2[cont2]);
        until vetor2[cont2] = 0;

	if cont <> cont2 then
		write('Tamanhos diferentes');
	if cont = cont2 then
	begin
		cont:=0;
		aux:=cont2-1;
		invert:=1;
		repeat
		cont:=cont+1;
                cont2:=cont2-1;
		if (vetor[cont] <> vetor2[cont2]) then
		begin
			invert:=0;
		end;
		until cont=aux;

		if invert = 1 then
			write('Sim')
		else if invert = 0 then
			write('Nao');
	end;	
end.
