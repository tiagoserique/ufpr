(* 
ENUNCIADO
Uma matriz D(8 × 8) pode representar a posiçao atual de um jogo de damas, sendo que 0 indica uma casa vazia, 
1 indica uma casa ocupada por uma peça branca e -1 indica uma casa ocupada por uma peça preta. 
Supondo que as peças pretas estão se movendo no sentido crescente das linhas da matriz D, determinar as posições 
das peças pretas que:

• podem tomar peças brancas;
• podem mover-se sem tomar peças brancas;
• não podem se mover.

Para este exercício, considere que as peças pretas nunca estarão na última linha do jogo (dama). 
Caso não ocorra peça para algum dos movimentos possíveis exibir o valor 0 (zero) ao invés da posição.

Exemplo de Entrada 1:
-1 0 -1 0 -1 0 -1 0
0 -1 0 -1 0 -1 0 -1
-1 0 -1 0 -1 0 -1 0
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 1 0 1 0 1 0 1
1 0 1 0 1 0 1 0
0 1 0 1 0 1 0 1
Saída esperada para a entrada acima:
tomar: 0
mover: 3-1 3-3 3-5 3-7
ficar: 1-1 1-3 1-5 1-7 2-2 2-4 2-6 2-8

Exemplo de Entrada 2:
-1 0 -1 0 -1 0 -1 0
0 -1 0 -1 0 -1 0 -1
0 0 -1 0 -1 0 -1 0
0 -1 0 0 0 0 0 0
0 0 1 0 0 0 0 0
0 1 0 0 0 1 0 1
1 0 1 0 1 0 1 0
0 1 0 1 0 1 0 1
Saída esperada para a entrada acima:
tomar: 4-2
mover: 2-2 3-3 3-5 3-7
ficar: 1-1 1-3 1-5 1-7 2-4 2-6 2-8
*)

program 5damas;
const
	max = 8;
	peca = 12;
	tomar = 10;
	mover = 20;
	ficar = 30;
	
type
	coord = record
		x,y:longint;
	end;
	jogo = record
		tabu:array [1 .. max+1,1 .. max+1] of longint;
		diatomar,diamover,diaficar : longint;
	
	end;
	movi = record
		tomar,mover,ficar:array [1 .. peca] of coord;
	end;
	
	
procedure inicio_jogo(var game:jogo; var possi:movi);
var
	i,j:longint;
begin
	for i:=1 to max+1 do
		for j:=1 to max+1 do
			game.tabu[i,j]:=2;

	for i:=1 to peca do
	begin
		possi.tomar[i].x:=0;
		possi.tomar[i].y:=0;
		possi.mover[i].x:=0;
		possi.mover[i].y:=0;
		possi.ficar[i].x:=0;
		possi.ficar[i].y:=0;
	end;
	game.diatomar:=0; game.diamover:=0; game.diaficar:=0;
end;
	
	
procedure ler_tabuleiro(var game:jogo);
var
	i,j:longint;
begin
	for i:=1 to max do
		for j:=1 to max do
			read(game.tabu[i,j]);
end;


function ver_dia2(var game:jogo; var possi:movi; i,j:longint):longint;
begin
	ver_dia2:=0;
        if (game.tabu[i,j] = -1) then
        begin
                if (game.tabu[i+1,j+1] = 1) then
                begin
                        if (game.tabu[i+2,j+2] = 0) then
                        begin
				ver_dia2:=tomar;
                        end
			else
			begin
				ver_dia2:=ficar;
			end;
                end
		else if (game.tabu[i+1,j+1] = 0) then
			ver_dia2:=mover
		else
			ver_dia2:=ficar;
        end;
end;


procedure ver_dia1(var game:jogo; var possi:movi; i,j:longint);
var
	valdia2:longint;
begin
	valdia2:=0;

	if (game.tabu[i,j] = -1) then
	begin
		if (game.tabu[i+1,j-1] = 1) then
		begin
			if (game.tabu[i+2,j-2] = 0) then
			begin
				game.diatomar:=game.diatomar+1;
				possi.tomar[game.diatomar].x:=i;
				possi.tomar[game.diatomar].y:=j;
			end
			else
			begin
				valdia2:=ver_dia2(game,possi,i,j);
				if valdia2 = tomar then
				begin
					game.diatomar:=game.diatomar+1;
					possi.tomar[game.diatomar].x:=i;
					possi.tomar[game.diatomar].y:=j;
				end
				else if valdia2 = mover then
				begin
					game.diamover:=game.diamover+1;
					possi.mover[game.diamover].x:=i;
					possi.mover[game.diamover].y:=j;
				end
				else if valdia2 = ficar then
				begin
					game.diaficar:=game.diaficar+1;
					possi.ficar[game.diaficar].x:=i;
					possi.ficar[game.diaficar].y:=j;	
				end;
			end;
		end
		else if (game.tabu[i+1,j-1] = 0) then
		begin
			valdia2:=ver_dia2(game,possi,i,j);
			if (valdia2 <> tomar) then
			begin
				game.diamover:=game.diamover+1;
				possi.mover[game.diamover].x:=i;
				possi.mover[game.diamover].y:=j;
			end
			else if (valdia2 = tomar) then
			begin
				game.diatomar:=game.diatomar+1;
				possi.tomar[game.diatomar].x:=i;
				possi.tomar[game.diatomar].y:=j;
			end;
		end
		else if (game.tabu[i+1,j-1] = -1) or (game.tabu[i+1,j-1] = 2) then
		begin
			valdia2:=ver_dia2(game,possi,i,j);
			if valdia2 = tomar then
			begin
				game.diatomar:=game.diatomar+1;
				possi.tomar[game.diatomar].x:=i;
				possi.tomar[game.diatomar].y:=j;
			end
			else if valdia2 = mover then
			begin
				game.diamover:=game.diamover+1;
				possi.mover[game.diamover].x:=i;
				possi.mover[game.diamover].y:=j;
			end
			else if valdia2 = ficar then
			begin
				game.diaficar:=game.diaficar+1;
				possi.ficar[game.diaficar].x:=i;
				possi.ficar[game.diaficar].y:=j;
			end;
		end;
	end;
end;


procedure imprimir(var game:jogo; var possi:movi);
var
	i:longint;
begin
	writeln(' ');
	write('tomar: ');
	if game.diatomar <> 0 then
		for i:=1 to game.diatomar do
			write(possi.tomar[i].x,'-',possi.tomar[i].y,' ')	
	else
		write('0');
	writeln(' ');

	write('mover: ');
	if game.diamover <> 0 then
		for i:=1 to game.diamover do
			write(possi.mover[i].x,'-',possi.mover[i].y,' ')
	else
		write('0');
        writeln(' ');

	write('ficar: ');
	if game.diaficar <> 0 then
		for i:=1 to game.diaficar do
			write(possi.ficar[i].x,'-',possi.ficar[i].y,' ')
	else
		write('0');
end;


var
	game: jogo;
	possi: movi;
	i,j: longint;
begin
	inicio_jogo(game,possi);
	ler_tabuleiro(game);
	i:=0;

	while (i < max) do
	begin
		i:=i+1;
		j:=0;
		
		while (j < max) do
		begin
			j:=j+1;
			ver_dia1(game, possi, i, j);
		end;
	end;
	imprimir(game,possi);
end.
