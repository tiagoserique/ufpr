program exer51;

function bloco(limite:integer):integer;
var
	k,cont,par,impar:integer;
begin
	cont:=0;
	par:=0;
	impar:=0;
	while (cont < limite) do
	begin
		cont:=cont+1;
		read(k);
		if (k mod 2 = 0) then
			par:=par+1
		else
			impar:=impar+1;
	end;

	if (par = limite) then
		bloco:=0
	else if (impar = limite) then
		bloco:=1
	else
		bloco:=-1;
end;


procedure alternante();
var
	val,k,impar,par,auximpar,auxpar:integer;
	flag:boolean;
begin
	val:=1;
	read(k);
	flag:=true;
	par:=0;
	impar:=0;
	while (val <> 0) do
	begin
		read(val);
		if (val <> 0) then
		begin
			if (val mod 2 = 0) or (impar = k) then
			begin
				par:=par+1;
				auximpar:=impar;
				impar:=0;
			end
			else if (val mod 2 = 1) or (par = k) then
			begin
				impar:=impar+1;
				auxpar:=par;
				par:=0;
			end;
			
			if ((auxpar > 0) and (auxpar < k) and (impar > 0)) or 
			((auximpar > 0) and (auximpar < k) and (par > 0)) or 
			(par > k) or (impar > k) then
				flag:=false;
		end;
	end;
	if (flag) then
		writeln('Eh k-alternante')
	else
		writeln('Nao eh k-alternante');
end;

var
	val,cont,k,n:integer;
	flag:boolean;
begin
	writeln('(1) para K-alternante');
	writeln('(2) para K-alternante usando bloco');
	read(val);
	if (val = 1) then
		alternante()
	else if (val = 2) then
	begin
		read(k);
		read(n);
		cont:=0;
		flag:=true;
		if (n mod k <> 0) or (k > n) then
			flag:=false
		else
			while (cont < n) do
			begin	
				cont:=cont+k;
				if (bloco(k) = -1) then
					flag:=false;
			end;
	end;
	
	if (flag) then
		writeln('Eh k-alternante')
	else
		writeln('Nao eh k-alternante');
end.

//EXERCICIO 4:
//Uma sequencia de inteiros e' k-alternante se ela e' composta pela intercalacao 
//de k valores pares com k valores impares.  A sequencia pode comecar com um par  
//ou um impar e termina quando o numero zero for digitado.  Por exemplo, se k = 3
//  as seguintes sequencias sao k-alternantes: 
//  3 5 1 8 6 2 9 9 7 
//  10 22 32 7 9 1 6 8 10 7 5 7 2 4 2 

//(a) Escreva uma funcao chamada 'bloco', que recebe como parametro um inteiro K e 
//le K inteiros do teclado, devolvendo um dos seguintes valores:
//   0, se todos os K numeros lidos forem pares;
//   1, se todos os K numeros lidos forem impares;
//   -1, se entre os K numeros lidos hÃ¡ numeros com paridades diferentes.

//(b) Usando a funcao anterior, escreva um programa que leia o valor de K e a 
//quantidade N de valores serao digitados.  O programa deve determinar se a 
//sequencia de N numeros e' k-alternante.  Em caso afirmativo, o programa deve 
//escrever 'eh k-alternante'; caso contrario, ele deve escrever 'nao eh 
//k-alternante'.

