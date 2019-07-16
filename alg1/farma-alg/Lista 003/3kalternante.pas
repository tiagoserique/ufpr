(* ENUNCIADO
Dizemos que uma sequência de inteiros é k-alternante se for composta alternadamente por segmentos de 
números pares de tamanho k e segmentos de números ímpares de tamanho k. Exemplos:

A sequência 1 3 6 8 9 11 2 4 1 7 6 8 é 2-alternante.
A sequência 2 1 4 7 8 9 é 1-alternante.
A sequência 4 2 3 1 6 4 2 9 não é alternante.
A sequência 1 3 5 é 3-alternante.

Fazer um programa em Free Pascal capaz de ler os seguintes valores de entrada:

a) um número inteiro k positivo que representa o tamanho do seguimento alternante que será usado para testar a sequência;
b) uma sequência de números inteiros positivos terminada por zero (o zero não faz parte da sequência).

O programa deve determinar se a sequência de números lidos é k-alternante. 
Se for, o programa deve imprimir "Sim eh k-alternante". 
Caso contrário, deve ser impressa a mensagem "Nao eh k-alternante".

Nos casos de teste o tamanho da sequência a ser lida sempre será múltipla de k. 
Logo se o valor de k for 2, por exemplo, o tamanho da sequência fornecida será múltipla de 2 
(desconsiderando o valor 0 que encerra a leitura).

Exemplos de entrada e saída são:

Exemplo de entrada 1:
2
1 3 6 8 9 11 2 4 1 7 6 8 0
Saída esperada para a entrada acima:
Sim eh k-alternante

Exemplo de entrada 2:
3
4 2 8 3 1 7 6 4 6 2 9 7 0
Saída esperada para a entrada acima:
Nao eh k-alternante
*)

program 3kalternante;
var
val , k , par , imp : integer;
con : boolean;
begin
val := 1;
par := 0;
imp := 0;
k := 0;
con := true;
read(k);
while (val <> 0) do
begin
	    read(val);
	    if (((val mod 2 = 0) and (val <> 0)) or (imp = k)) then
	    begin
		    par:=par+1;
		    imp:=0;
	    end
	    else if (((val mod 2 = 1) and (val <> 0)) or (par = k)) then
	    	begin
				imp:=imp+1;
				par:=0;
	    	end;
	   if (par > k) then
			con := false;
	    if (imp > k) then
			con := false;
end;
if (con = true) then
writeln('Sim eh k-alternante')
else if (con = false) then
writeln('Nao eh k-alternante');
end.
