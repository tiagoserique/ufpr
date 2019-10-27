(* 
ENUNCIADO
Fazer um programa em Pascal para ler do teclado um número inteiro m e em seguida ler uma sequência de m pares de números 
(N1, P1), (N2, P2), ... (Nm, Pm), onde Ni, 1 <= i <= m são números reais e Pi, 1 <= i <= m são números inteiros, 
imprimir o cálculo da média ponderada deles. Isto é, calcular:
// MP= (N1*P1 + N2*P2 + ... + Nm*Pm)/(P1 + P2 + ... + Pm)
Seu programa deve imprimir a mensagem "divisao por zero" caso o denominador seja zero. 
Caso isso não ocorra seu programa irá abortar neste caso, o que não é correto.
Exemplos de entrada e saída:
Exemplo de entrada 1:
3
0 1
3 2
10 3
Saída esperada :
6.0000000000000000E+000
Exemplo de entrada 2:
3
0 0
3 2
10 -2
Saída esperada :
divisao por zero
Exemplo de entrada 3:
0
Saída esperada :
divisao por zero
*)

program 2mediaponderada;
var
	m,i:integer;
	num,den:real;
	p: real;
	n: real;
begin
i:=0;
m:=0;
read(m);
	while (i<m) do
		begin
		read(n);
		read(p);
		num:=num+(n*p);
		den:=den+p;
		i:=i+1;
		end;

	if (den = 0) then
		writeln('divisao por zero')
	else
		begin
		writeln(num/den);
		end;

end.
