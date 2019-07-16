(* 
ENUNCIADO
Faça um programa em Free Pascal que leia o número N, 1 <= N <= 20 e em seguida leia os nomes dos N times que participaram 
do campeonato de um certo ano. Em seguida leia a pontuação respectiva que cada um dos times obteve naquele campeonato, 
supondo (para simplificar) que nenhum time obteve a mesma pontuação. 
Seu programa deve imprimir o nome do campeão, isto é, o que teve a maior pontuação.

No Free Pascal, nomes (ou frases) podem ser manipulados usando-se o tipo predefinido string. 
Considere que os nomes dos times não ultrapassam 20 caracteres, por isso pode usar o tipo string20. 
Neste tipo você pode ler os nomes a partir do teclado como se fossem números, mas para não gerar erros de compilação, 
substitua todos os seus comandos read por readln, senão seu programa pode gerar erros de execução (runtime error) 
por causa do modo como o compilador lida com o ENTER.

Exemplo do uso do tipo string:
-------------------------------------------------------------
var x, y: string[20];
begin
    readln (x);
    readln (y);
    if x = y then
        writeln ('os nomes sao iguais')
    else
        writeln ('o nome ',x,' eh diferente do nome ',y);
end.
-------------------------------------------------------------
Ou ainda:
-------------------------------------------------------------
var x, y: string[20];
begin
    x:= 'algoritmos 1';
    y:= 'computacao';
    if x = y then
        writeln ('os nomes sao iguais')
    else
        writeln ('o nome ',x,' eh diferente do nome ',y);
end.
--------------------------------------------------------------
então x < y, pois o Free Pascal usa ordenação lexicográfica para isso.

Exemplo de entrada:
5
XV de Piracicaba
Ferroviaria
Botafogo-RP
Sao Carlense
XV de Jau
75
47
68
82
56

Saida esperada:
O campeao eh o Sao Carlense
*)

program 3campeonato;
const 
	max = 20;
type
	meuvetor = array [1 .. max] of string[20];
	meuvetor2 = array [1 .. max] of integer;
var 
	nomes:meuvetor; pontos:meuvetor2;
	indice,n:integer;

procedure ler(n:integer;var nomes: meuvetor;var pontos: meuvetor2);
var 
cont: integer;

begin
	if (n>=1) and (n<=20) then
	begin
		for cont:=1 to n do 
		readln(nomes[cont]);

		for cont:=1 to n do
		readln(pontos[cont]);
	end;
end;

function maior(n:integer;pontos:meuvetor2):integer;
var
	i, cont:integer;
begin
	i:=1;
	for cont:=2 to n-1 do
	begin
		if (pontos[cont] > pontos[i]) then
		maior:= cont;
	i:=i+1;
	end;
end;

begin
	readln(n); 
	ler(n,nomes,pontos);
	indice := maior(n,pontos);
	write('O campeao eh o ', nomes[indice]);
end.
