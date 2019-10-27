(* ENUNCIADO
Um jogo de palavras cruzadas pode ser representado por uma matriz A(n × m) onde cada posição da matriz corresponde a 
um quadrado do jogo, sendo que 0 indica um quadrado em branco e -1 indica um quadrado preto. 
Colocar as numerações de início de palavras horizontais e/ou verticais nos quadrados correspondentes (substituindo os zeros), 
considerando que uma palavra deve ter pelo menos duas letras.
Exemplo de entrada:
5 8
0 -1 0 -1 -1 0 -1 0
0 0 0 0 -1 0 0 0
0 0 -1 -1 0 0 -1 0
-1 0 0 0 0 -1 0 0
0 0 -1 0 0 0 -1 -1
Saída esperada para a entrada anterior:
1 -1 2 -1 -1 3 -1 4
5 6 0 0 -1 7 0 0
8 0 -1 -1 9 0 -1 0
-1 10 0 11 0 -1 12 0
13 0 -1 14 0 0 -1 -1
*)

program 4palavrascruzadas;
const
	max = 100;
type
	jogo = record
		cont,lin,col,auxlin,auxcol:longint;
		tabu: array [0 .. max+1, 0 .. max+1] of longint;
		end;

procedure imprime_jogo(game:jogo);
var
	i,j:longint;
begin
	writeln(' ');
	for i:=1 to game.lin do
	begin
		for j:=1 to game.col do
			write(game.tabu[i,j],' ');
		writeln(' ');
	end;
end;

procedure verifica_vizinhos(var game:jogo);
var
	esquerda,direita,cima,baixo:boolean;
	i,j:longint;
begin
	
	for i:=1 to game.lin do
	begin
		for j:=1 to game.col do
		begin
			esquerda:=true; direita:=true;  cima:=true; baixo:=true;
			if game.tabu[i,j] = 0 then
			begin	
				if game.tabu[i,j-1] = -1  then
					esquerda:= false; 
				if game.tabu[i,j+1] = -1 then
					direita:= false;
				if game.tabu[i-1,j] = -1 then
					cima:= false;
				if game.tabu[i+1,j] = -1 then
					baixo:= false;
					
				if ((direita) and (not esquerda))or((baixo)and(not cima)) then
				begin
					game.cont:=game.cont+1;
					game.tabu[i,j]:=game.cont;
				end;
			end;
		end;
	end;
end;

procedure margem(var borda:jogo);
var
        i,j:longint;
begin
      //Borda
        i:=0;
        for j:=0 to borda.auxlin do
                borda.tabu[j,i]:=-1;
        for j:=0 to borda.auxcol do
                borda.tabu[i,j]:=-1;

        i:=borda.auxcol;
        for j:=0 to borda.auxlin do
                borda.tabu[j,i]:=-1;

        i:=borda.auxlin;
        for j:=0 to borda.auxcol do
                borda.tabu[i,j]:=-1;
end;

procedure ler(var game:jogo);
var
	i,j:longint;
begin
	read(game.lin,game.col);
	game.auxlin:=game.lin+1;
	game.auxcol:=game.col+1;
	margem(game);

	for i:=1 to game.lin do
		for j:=1 to game.col do
			read(game.tabu[i,j]);
end;

var
	game:jogo;
begin
	ler(game);
	verifica_vizinhos(game);
	imprime_jogo(game);
end.
