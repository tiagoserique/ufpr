program questao84;
uses tadconjunto;

var
	sorteados,apostados,acerto:conjunto;
	elem:elemento;
	i,j,apostadores,naposta,valores,nacertos:longint;
begin

(* 
  escreva aqui a solucao para o problema 
*)
	inicializar_conjunto(sorteados);

	for i:=1 to 6 do
	begin
		read(elem);
		inserir(elem,sorteados);
	end;
	
	read(apostadores);
	
	for i:=1 to apostadores do
	begin
		read(naposta);
		inicializar_conjunto(acerto);
		inicializar_conjunto(apostados);
		for j:=1 to naposta do
		begin
			read(valores);
			inserir(valores,apostados);
			intersecao(sorteados,apostados,acerto);
			nacertos:=cardinalidade(acerto);
		end;
                intersecao(sorteados,apostados,acerto);
                nacertos:=cardinalidade(acerto);
                if (nacertos = 6) then
			writeln('MEGA SENA')
                else if (nacertos = 5) then
			writeln('QUINA')
                else if (nacertos = 4) then
                        writeln('QUADRA')
                else if (nacertos < 4) then
                        writeln('NADA');
	end;
end.
