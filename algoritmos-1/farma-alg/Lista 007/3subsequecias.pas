(* ENUNCIADO
Faça um programa em Free Pascal que leia um número natural 0 < n ≤ 100 e em seguida leia uma sequência de n números 
também naturais. Seu programa deve verificar se existem duas subsequências iguais nesta sequência com tamanho pelo menos 2. 
O tamanho da sequência encontrada deverá ser máximo, se ela existir. 
Caso exista, seu programa deve imprimir o valor do ı́ndice i e do tamanho máximo da sequência m, nesta ordem, 
onde i é a primeira ocorrência da sequência que possui uma cópia na sequência original e m é o tamanho desta 
sequência que se repete. Caso contrário seu programa deve imprimir "nenhuma".
Os casos de teste não conterão entradas com mais de uma subsequência igual.
Exemplo de entrada 1:
87 9 5 4 5 5 4 6
Saı́da esperada para a entrada acima:
3 2
Exemplo de entrada 2:
12
2 7 9 5 2 5 4 8 6 2 5 4
Saı́da esperada para a entrada acima:
5 3
Sugestão:
Use como base para sua implementação a seguinte estrutura inicial de programa, que contém o programa principal e 
algumas funções e procedimentos que visam facilitar o seu trabalho. Evidentemente você pode ignorar esta sugestão. 
Caso aceite, você deve implementar as funções e procedimentos, o programa principal não deveria ter que ser alterado, 
a princı́pio. Você pode também decidir usar mais funções e procedimentos caso perceba que seu programa ficará mais legı́vel.
*)

(*
program escolha_um_nome_bom;
const MAX = 100;
type vetor = array [1..MAX] of longint;
var
    v : vetor;
    n, pos, tamanho_subsequencia: longint;
procedure ler_vetor (var v: vetor; n: longint);
(* procedure para ler um vetor "v" de "n" inteiros *)

(*
function tem_subsequencia_iguais (var v: vetor; n, tam_seg: longint): longint;
(*
recebe uma subsequencia "v" que em tamanho "n" e procura por subsequencias
iguais de tamanho "tam_seg". A funcao devolve zero se nao encontrou
subsequencias iguais ou devolve a posicao do inicio da primeira subsequencia
que encontrou.
*)


(* programa principal *)
(*
begin
    read (n);
    // tamanho da subsequencia a ser lido
    ler_vetor (v,n); 
    pos:= 0;
    tamanho_subsequencia:= n div 2; // inicia com maior valor possivel
    while (pos = 0) and (tamanho_subsequencia >= 2) do
    begin
         pos:= tem_subsequencia_iguais (v,n,tamanho_subsequencia);
         tamanho_subsequencia:= tamanho_subsequencia - 1;
    end;
    if pos > 0 then
        writeln (pos,’ ’,tamanho_subsequencia+1)
    else
        writeln ('nenhuma');
end.
*)

program 3subsequencias;
const 
	MAX = 100;
type 
	vetor = array [1..MAX] of longint;
var
	v : vetor;
	n, pos, tamanho_subsequencia: longint;


procedure ler_vetor(var v: vetor; n: longint);
var
	cont: longint;
begin
	for cont:=1 to n do
	read(v[cont]);
end;

function tem_subsequencia_iguais (var v: vetor; n, tam_seg: longint): longint;
var
	aux:vetor;
	diferente,igual,naocont,cont,posi,cont2,tam_seg_original,auxtam_seg:longint;
begin
	auxtam_seg:=tam_seg;
	if n mod 2 = 0 then
		tam_seg_original:=n div 2
	else
		tam_seg_original:=(n div 2)+1;

        if tam_seg_original>tam_seg then
		auxtam_seg:=(tam_seg_original-tam_seg)*2+tam_seg;

	naocont:=0;
	tem_subsequencia_iguais:=0;
	cont:=0;
	igual:=0;
	diferente:=0;

	while (cont<auxtam_seg)and(igual=0) do
	begin
		cont:=cont+1;
		for posi:=cont to (tam_seg+cont-1) do
	    	begin
			aux[posi-naocont]:=v[posi];
	  	end;
		posi:=0;
		repeat
			posi:=posi+1;
			cont2:=0; igual:=1;
			repeat  
				cont2:=cont2+1;diferente:=0;
				if aux[cont2]<>v[posi+cont2+naocont] then	
				begin
					diferente:=1;
					igual:=0;
				end;

			until ((cont2 = tam_seg)and(igual=1))or(diferente=1);
		until (posi =(auxtam_seg-cont+1))or(igual=1);
		naocont:=naocont+1;
	end;
	if igual=1 then
		tem_subsequencia_iguais:=cont;
end;

(* programa principal *)
begin
    read (n); // tamanho da subsequencia a ser lido
    ler_vetor (v,n); 
    pos:= 0;
	if n mod 2 = 0 then
		tamanho_subsequencia:= n div 2
	else
		tamanho_subsequencia:= (n div 2)+1;
	; // inicia com maior valor possivel
    while (pos = 0) and (tamanho_subsequencia >= 2) do
    begin
         pos:= tem_subsequencia_iguais (v,n,tamanho_subsequencia);
         tamanho_subsequencia:= tamanho_subsequencia - 1;
    end;
    if pos > 0 then
        writeln (pos,' ',tamanho_subsequencia+1)
    else
        writeln ('nenhuma');
end.
