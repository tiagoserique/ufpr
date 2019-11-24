program questao83;
uses tadpilha;

var
	pilha:Tpilha;
	n:integer;
	break:boolean;
begin
	read(n);
	break:=false;
	while (n <> 0) and (not break)do
	begin
		if (n > 0) then
			push(pilha,n)
		else if (n + pop(pilha) = 0) then
			n:=pop(pilha)
		else if (n + pop(pilha) <> 0) then
			break:=true;		
		read(n);
	end;
	
	if (pilhaVazia(pilha)) then
		writeln('Sim')
	else
		writeln('Nao');
end.
//Ex2:
//  Implemente um programa em Pascal que receba como entrada uma lista de numeros
//  inteiros terminada em zero. O zero nao deve ser processado e apenas indica
//  que a entrada de dados terminou. Seu programa deve imprimir SIM caso a lista
//  de numeros tenha pares bem formados de numeros de mesmo valor absoluto,
//  sendo que o positivo ocorre sempre antes do seu respectivo negativo. Seu
//  programa deve imprimir NAO em caso contrario. Apenas a titulo de exemplo,
//  caso os numeros fossem todos 1 e -1, isto poderia ser visto como parenteses
//  abertos (1) e parenteses fechados (-1), representando uma expressao de
//  parenteses corretamente balanceada.  Por exemplo, a sequencia de numeros:
//     1 2 3 -3 -2 4 -4 -1
//  Pode ser interpretada como representando a expressao
//     ( [ {  } ]  <  > )
//  Utilize o TAD Pilha. 

//Exemplo 1:
//1 2 3 4 -4 -3 5 6 -6 -5 -2 -1 0
//SIM

//Exemplo 2:
//1 2 3 -1 -2 -3 0
//NAO

