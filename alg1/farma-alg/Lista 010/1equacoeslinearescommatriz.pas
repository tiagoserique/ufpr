(* 
ENUNCIADO
Um vetor real X com n elementos é apresentado como resultado de um sistema de equações lineares Ax = B cujos 
coeficientes são representados em uma matriz real A(m×n) e os lados direitos das equações (os resultados de cada equação) 
em um vetor real B de m elementos. Criar um programa em Free Pascal que verifique se o vetor X é realmente solução do 
sistema dado, imprimindo "sim" caso o vetor informado seja solução do sistema de equações, ou imprimindo "não" caso contrário.

Dica: Comparações entre números reais pode ser um problema dependendo da arquitetura da máquina a ser utilizada. 
Para solucionar este problema um método a ser utilizado é a comparação por margem de erro.

Exemplo de entrada:
3 3 #tamanho da matriz
1 3 2 #resultado informado
2 1 -3 #Matriz
-1 3 2
3 1 -3
-1 12 0 #lado direito
Saída esperada:
sim
*)

program 1equacoeslinearescommatriz;
const
	max = 100;
type
	Tsist = record
			res: array [1 .. max] of real;
			lad: array [1 .. max] of real;
			mat: array [1 .. max,1 .. max] of real;
		end;
	Tcoord = record
			x,y:longint;
			end;


function verif(equacao:Tsist; indice:Tcoord):boolean;
var
	i,j:longint;
	soma:real;
begin
	verif:=true;
	i:=0;
	while (i<indice.x)and (verif=true) do
	begin
		i:=i+1;	
		soma:=0;
		for j:=1 to indice.y do 
			soma:=soma+((equacao.mat[i,j])*(equacao.res[j]));
		
		if soma <> equacao.lad[i] then
			verif:=false;
		
	end;

end;


procedure ler(var equacao:Tsist; indice:Tcoord);
var
	i,j:longint;
begin
	
	for i:=1 to indice.y do
		read(equacao.res[i]);
	
	for i:=1 to indice.x do
		for j:=1 to indice.y do
			read(equacao.mat[i,j]);	

	for i:=1 to indice.y do
		read(equacao.lad[i]);

end;

var
	equacao: Tsist;
	indice:Tcoord;
	conf:boolean;
begin
	read(indice.x , indice.y);
	ler(equacao,indice);
	conf:=verif(equacao,indice);

	if conf=true then
		writeln('sim')
	else
		writeln('não');

end.
