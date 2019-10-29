program exer39;
var
	n1,n2,exp:integer;
	flag:boolean;
begin	
	read(n1,n2);
	flag:=true;
	exp:=1;
	while (flag) do
	begin
		exp:=exp*n1;
		if (n2 mod exp <> 0) then
			flag:=false;
	end;
	writeln(exp div n1);
end.

//EXERCICIO 2:
//Dados dois numeros inteiros positivos (n1, n2), determinar o valor da maior 
//potencia de n1 que divide n2.  Se n1 nao divide n2, a maior potencia e' 
//definido como sendo igual a 1.  Por exemplo, a maior potencia de 3 que 
//divide 45 e' 9.
//Exemplo de entrada:
//3 45
//Exemplo de saida:
//9
