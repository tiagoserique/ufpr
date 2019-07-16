(* ENUNCIAD0
O tratamento de duplicatas é um fator importante em alguns algoritmos. 
Um exemplo é um tipo que se pretende a representar um conjunto no sentido da teoria dos conjuntos e matemática. 
Um conjunto não pode ter elementos repetidos.
Escreva um programa em Free Pascal que leia uma quantidade arbitrária de números inteiros positivos do teclado 
e determine os números repetidos fornecidos na entrada de dados. 
O programa deve imprimir apenas uma ocorrência de cada número repetido, mesmo que sejam fornecidas várias duplicatas 
do mesmo número no momento da entrada. 
O número zero é o último lido e não deve ser levado em conta na determinação de repetidos. 
Nota: O usuário nunca irá digitar mais do que 100 números para a entrada do programa (excluindo o zero).
Um exemplo de entrada e saı́da é:

Exemplo de entrada:
3 4 5 5 6 7 8 8 9 10 5 5 5 7 7 3 0
Saı́da esperada para a entrada acima:
3 5 7 8
*)

program 1repetidos;
const
    max = 1000;
type
	meuvetor = array [1 .. max] of integer;
var
	lista, ocor, freq: meuvetor;
	nocor,cont, posi: integer;

procedure inicializa(var vetor: meuvetor); 
var
	posi:integer;
begin
for posi:=1 to max do                
	vetor[posi]:=0;
end;


function ler(var vetor:meuvetor):integer;
var
	cont:integer;
begin
cont:=0;
        repeat
                cont:=cont+1;
                read(lista[cont]);
        until lista[cont] = 0;
ler:=cont;
end;
	
function verifica(cont:integer;var lista,ocor,freq:meuvetor):integer;
var
	nocor,cont2,posi:integer;
	igual:boolean;
begin
 nocor:=0;
        for cont2:=1 to (cont-1) do
        begin
                posi:=1; igual:=false;
                while (posi<=nocor) and (not igual) do
                begin
                        if lista[cont2] = ocor[posi] then
                        begin
                        freq[posi]:=freq[posi]+1;
                        igual:=true;
                        end;
                posi:=posi+1;
                end;
                if not igual then
                begin
                nocor:=nocor+1;
                ocor[nocor]:=lista[cont2];
                freq[nocor]:=1;
                end;
        end;
verifica:=nocor;
end;


begin
	cont:= ler(lista);
	inicializa(ocor);
	inicializa(freq);
	nocor:=verifica(cont,lista,ocor,freq);

	for posi:=1 to nocor do
	begin
		if (freq[posi]>1) then
		write(ocor[posi],' ');
	end;
end.
