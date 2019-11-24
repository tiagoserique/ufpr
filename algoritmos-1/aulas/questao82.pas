program questao82;
uses tadpilha;

var
	pilha:Tpilha;
	n: integer;
begin
	read(n);
	while (n <> 0) and (not pilhaCheia(pilha)) do
	begin
		push(pilha,n);
		read(n);
	end;
	
	while (not pilhavazia(pilha)) do
		write(pop(pilha),' ');
	writeln(' ');
end.
//Ex1: 
// Escrever um programa que le uma sequencia de inteiros terminada por zero e
//escrever os inteiros na ordem inversa.  A sequencia tem no maximo 1000
//elementos.  Usar o TAD Pilha.
