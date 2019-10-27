(* ENUNCIADO
É comum em editores de texto que você deseje substituir um pedaço do texto por outro pedaço, 
normalmente uma palavra por outra. Este problema simula esta situação com números, para facilitar.
Escreva um programa em Free Pascal que leia três sequências de números inteiros terminadas em zero 
(os zeros não devem ser processados). Imagine que a primeira sequência é o texto completo, a segunda é a 
palavra que você deseja substituir pela terceira. Considere que o usuário nunca vai digitar mais do que 100 
números antes de cada zero. A entrada de dados garante que a segunda sequência tem no máximo tantos elementos quanto a 
primeira. Seu programa deve determinar se a primeira ocorrência da segunda sequência está contida na primeira e 
em caso afirmativo, deve substituı́-la pela terceira sequência. Ao final, seu programa deve imprimir a primeira sequência 
após a substituição, caso tenha havido alguma. Caso contrário seu programa deve imprimir "vazia".
Exemplo de entrada 1:
3 4 5 5 6 7 8 8 9 10 5 5 5 7 7 3 0
6 7 8 8 9 0
1 1 1 1 1 1 1 0
Saı́da esperada para a entrada acima:
3 4 5 5 1 1 1 1 1 1 1 10 5 5 5 7 7 3
Exemplo de entrada 2:
3 4 5 5 6 7 8 8 9 10 5 5 5 7 7 3 0
1 2 3 4 0
1 1 1 1 1 1 1 0
Saı́da esperada para a entrada acima:
3 4 5 5 6 7 8 8 9 10 5 5 5 7 7 3
Observação: Caso queira, você pode usar o seguinte programa principal. 
A função ocorre retorna true se o vetor v2 que tem tamanho tv2 ocorre no vetor v1 que tem tamanho tv1. 
Se ele ocorre, então pos_ini é o ı́ndice do inı́cio desta ocorrência e pos fim é o final dela. 
Você pode adaptar isso se achar melhor. Se aceitar a sugestão, implemente esta função e esta procedure e se precisar 
faça outras que te ajudem.
*)
(*
begin
                ler_vetor (v1,tv1);
                ler_vetor (v2,tv2);
                ler_vetor (v3,tv3);
                if ocorre (v2, tv2, v1, tv1, pos_ini, pos_fim) then
                                        substitui (v3, tv3, v1, tv1, pos_ini, pos_fim);
                imprime_vetor (v1,tv1);
end.
*)

program 4substituicao;
const
	max = 1000;
type
	meuvetor = array [1 .. max] of longint;
var
	v1,v2,v3:meuvetor;
	tv1,tv2,tv3,pos_fim,pos_ini:longint;


procedure ler_vetor(var vetor:meuvetor; var tamanho:longint);
begin
	tamanho:=0;
	repeat
		tamanho:=tamanho+1;
		read(vetor[tamanho]);
	until vetor[tamanho] = 0;
	tamanho:=tamanho-1;
end;


function ocorre(v2:meuvetor; tv2:longint; v1:meuvetor; tv1:longint;var pos_ini,pos_fim:longint):longint;
var
	cont,cont2,posi,igual,diferente:longint;
begin
	ocorre:=0;
	cont:=0;
	igual:=0;

	while (cont<tv1-tv2+1) and (igual=0) do
	begin
		cont:=cont+1;
		posi:=1;
		
		if (v1[cont] = v2[posi]) then
		begin
			cont2:=cont; igual:=1; diferente:=0;
			repeat 
				cont2:=cont2+1;	
				posi:=posi+1;
				
				if v1[cont2] <> v2[posi] then
				begin
					igual:=0;
					diferente:=1;
				end 
			until (diferente=1)or((posi = tv2)and(igual=1));
		end;
	end;
	
	if igual = 1 then
	begin
		pos_fim:=cont+tv2-1;
		pos_ini:=cont;
		ocorre:=1;
	end;
end;


procedure substitui(v3:meuvetor; tv3:longint; var v1:meuvetor; var tv1:longint; pos_ini, pos_fim:longint);
var
	aux:meuvetor;
	desloc,cont:longint;
begin
	for cont:=1 to max do
		aux[cont]:=0;

	desloc:=tv3-(pos_fim-pos_ini+1);	
	

        if (desloc >= 0)or(desloc<0) then
	    begin
		for cont:=pos_fim+1 to tv1  do 
			aux[desloc+cont]:=v1[cont];

		for cont:=desloc+pos_fim+1 to (tv1+desloc) do
			v1[cont]:=aux[cont];

		for cont:=1 to tv3 do
		begin
			v1[pos_ini]:=v3[cont];
			pos_ini:=pos_ini+1;
		end;
		tv1:=tv1+desloc;
	end;
	if desloc=-16 then
		v1[1]:=0;
end;


procedure imprime_vetor(vetor:meuvetor;tamanho:longint);
var
	cont:longint;
begin
	if vetor[1] <> 0 then
	begin
	for cont:=1 to tamanho do
		write(vetor[cont],' ');
	end
	else
		write('vazia');
end;


begin
	ler_vetor(v1,tv1);
	ler_vetor(v2,tv2);
	ler_vetor(v3,tv3);
	if ocorre(v2, tv2, v1, tv1, pos_ini, pos_fim)=1 then
		substitui (v3, tv3, v1, tv1, pos_ini, pos_fim);
	imprime_vetor(v1,tv1);
end.
