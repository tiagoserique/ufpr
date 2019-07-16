(* ENUNCIADO
Em teoria dos conjuntos uma de suas possı́veis operações é a operação de União. 
Dados dois conjuntos A e B, a união entre os conjuntos é definida por:
A ∪ B = {x : x ∈ A ∨ x ∈ B}
Isto é, a União do conjunto A com o conjunto B é um conjunto formado por todo elemento x tal que x é elemento de 
A ou x é elemento de B. O diagrama de Venn abaixo ilustra bem este conceito.

//Devia ter uma imagem aqui

No diagrama apresentado, o conjunto A é composto pelos elementos {1, 2, 3, 7} e o conjunto B é composto pelos 
elementos {4, 5, 6, 7}, o conjunto A ∪ B é o conjunto {1, 2, 3, 4, 5, 6, 7}.

Escreva um programa em Free Pascal que leia duas sequências com quantidades arbitrárias de valores inteiros positivos, 
as quais denotam dois conjuntos da matemática. 
Os valores de uma sequência nunca conterão duplicatas mas podem vir fora de ordem. 
Cada sequência termina com o valor 0 (que não é elemento de nenhum dos conjuntos). 
Depois da leitura dos dados, o programa deve determinar e imprimir o conjunto união. 
O tamanho máximo de cada conjunto é de 200 elementos.
Por exemplo, considere a entrada e a saı́da de dados abaixo:

Exemplo de entrada:
11 7 1 18 6 5 9 0
9 22 4 5 6 18 0
Saı́da esperada para a entrada acima:
11 7 1 18 6 5 9 22 4
*)

program 2uniao;

type
	meuvetor = array [1 .. 100] of integer;
var
	nocor,posi1,posi2: integer;
	seq1,seq2,ocor:meuvetor;


function lerseq(var seq:meuvetor): integer;
var cont:integer;
begin
cont:=0;
	repeat 
		cont:=cont+1;
		read(seq[cont]);
	until seq[cont]=0;
lerseq:=cont-1;
end;

procedure unir(var nocor:integer;posi:integer; seq:meuvetor; var ocor:meuvetor);
var 
	igual:boolean;
	cont,posoc:integer;
begin
	for cont:=1 to posi do
	begin
		posoc:=1; igual:=false;
		while (posoc<=nocor)and(not igual) do
		begin
			if (seq[cont] = ocor[posoc]) then
			begin
				igual:=true;
			end;
		posoc:=posoc+1;
		end;
		if not igual then
		begin
			nocor:=nocor+1;
			ocor[nocor]:=seq[cont];
		end;
	end;
end;

begin
	posi1:=lerseq(seq1);
	posi2:=lerseq(seq2);
	nocor:=0;
	unir(nocor,posi1,seq1,ocor);
	unir(nocor,posi2,seq2,ocor);	
	for posi1:=1 to nocor do
		write(ocor[posi1],' ');	
end.
