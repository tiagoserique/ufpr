(* ENUNCIAD0
Triângulo de Pascal é um triângulo aritmético infinito onde são dispostos os coeficientes das expansões binominais. 
Os números que compõem o triângulo apresentam diversas propriedades e relações. 
Os números que compõem o triângulo de Pascal são chamados de números binomiais ou coeficientes binomiais. 
Um número binomial é representado por:

//Devia ter uma imagem aqui

Com n e p números naturais e n ≥ p. O número n é denominado numerador e o p denominador. 
O número binomial é calculado a partir da relação:

//Devia ter uma imagem aqui

Sendo,
C n , p : combinação simples de n elementos tomados p a p.

O triângulo de Pascal é construı́do colocando-se os números binomiais de mesmo numerador na mesma linha e os 
coeficientes de mesmo denominador na mesma coluna. Assim, temos:

//Devia ter uma imagem aqui

Propriedades
1. a ) Todas as linhas têm o número 1 como seu primeiro e último elemento.
De fato, o primeiro elemento de todas as linhas é calculado por:

//Devia ter uma imagem aqui

(Considerando 0! = 1)
e o último elemento de todas as linhas é calculado por:

//Devia ter uma imagem aqui

a ) O restante dos números de uma linha é formado pela adição dos dois números mais próximos da linha acima. 
Essa propriedade é chamada de Relação de Stifel e é expressa por:

//Devia ter uma imagem aqui

Fazer um programa em Free Pascal que leia um número inteiro positivo N que representa o número de linhas de 
um Triângulo de Pascal, sendo 0 <= N <= 20. 
Seu programa deve gerar e imprimir os valores de cada linha deste triângulo no monitor de vı́deo do computador. 
Veja uma exemplo de execução do programa:

Exemplo de entrada:
7
Saída esperada para a entrada acima:
1
1 1
1 2 1
1 3 3 1
1 4 6 4 1
1 5 10 10 5 1
1 6 15 20 15 6 1

// Uma explicação mais ou menos parecida https://www.todamateria.com.br/triangulo-de-pascal/
*)

program 3triangulodepascal;

function fatorial(numden:integer):longint;
begin
fatorial:=1;
        if (numden > 0) then
        begin
                repeat
                        fatorial:=numden*fatorial;
                        numden:=numden-1
                until numden<1;
        end;
end;

procedure priele(posi:integer; nume,deno,comple,combi:longint; cont:integer);
begin
        deno:= fatorial(posi);
        nume:= fatorial(nume);
        comple:=(cont-posi);
        comple:=fatorial(comple);
        combi:= nume div (deno*comple);
	write(combi,' ');
end;

procedure linha(posi:integer; nume,deno,comple,combi:longint; cont:integer);
var 
	combi2,auxcont,auxposi,auxnume,auxdeno:longint;
begin
	auxposi:=posi-1;
	auxnume:=nume-1;
	auxcont:=cont-1;
	
	auxdeno:= fatorial(auxposi);
        auxnume:= fatorial(auxnume);
        comple:=(auxcont-auxposi);
        comple:=fatorial(comple);
	combi:= auxnume div (auxdeno*comple);
	comple:=0;
       
	deno:= fatorial(posi);
        nume:= fatorial(auxnume);
        comple:=(auxcont-posi);
        comple:=fatorial(comple);
        combi2:= auxnume div (deno*comple);
	
	combi:=combi+combi2;
	write(combi,' ');	
end;


procedure tri(cont:integer);
var
	nume,deno,comple,combi:longint;
	posi:integer;
begin
posi:=0;
	repeat	
		nume:=cont;
		deno:=0;
		comple:=0;
		combi:=0;
		if (posi=0)or(posi = cont) then
			priele(posi,nume,deno,comple,combi,cont)
		else
			linha(posi,nume,deno,comple,combi,cont);
		posi:=posi+1;
	until posi>cont;	
	writeln(' ');
end;

var
        cont,nlinha:integer;
begin
	readln(nlinha);
	if (nlinha>=0) and (nlinha<=13) then
	begin
		cont:=0;
		repeat	
			tri(cont);
			cont:=cont+1;
		until cont>nlinha;
	end;
end.
