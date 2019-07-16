(* 
ENUNCIADO
Fazer um programa em Pascal para ler uma massa de dados contendo a definição de várias equações do
segundo grau da forma ax2 + bx + c = 0. 

Cada linha de dados contém a definição de uma equação por meio dos valores de a, b e c do conjunto dos números reais. 
A última linha informada ao sistema contém 3 (três) valores zero (exemplo 0.0 0.0 0.0). 

Após a leitura de cada linha o programa deve calcular as duas raízes da equação e imprimir na tela, em cada linha,
uma das seguintes possibilidades:

As duas raízes reais (duas casas decimais), caso existam duas diferentes;
ou a única raiz real (duas casas decimais), caso seja este o caso;
ou a mensagem "nao existem raizes reais", se for o caso.
ou a mensagem "nao eh equacao do segundo grau", se for o caso.

Exemplo de entrada:
1 4 1
1 2 1
1 0 10
0 1 2
0 0 0

Saída esperada para a entrada acima:
-3.73 -0.27
-1.00
nao tem raizes reais
nao eh equacao do segundo grau
*)

program 3equacoes;
var
z, w, x , y , b , a , c : real;
begin
a:=1;
b:=1;
c:=1;
x:=0;
y:=0;
w:=0;
z:=0;

while ((a<>0)or(b<>0)or(c<>0)) do
begin
	read(a);
	read(b);
	read(c);
    if ((a = 0)and(b<>0)and(c<>0)) then
		writeln('nao eh equacao do segundo grau')
	else if (a<>0) then
	begin
        z:=(b*b)-(4*a*c);
    
        if((z = 0)or(a = 0))then
            begin
            w :=0;
            x:= ((-b + w)/ 2*a);
	        y:= ((-b - w)/ 2*a);
	            if (x=y) then
		            writeln(x:0:2)
                else if (x<>y) then
                begin
	    	        write(y:0:2, ' ');
	    	        writeln(x:0:2);
		        end
	        end
        else if ((z>0)or(a = 0)) then
	        begin
    	    w:= exp (1/2 * ln(z));
    	    x:= ((-b + w)/ 2*a);
    	    y:= ((-b - w)/ 2*a);
                if (x=y) then
		            writeln(x:0:2)
                else if (x<>y) then
                    begin
	    	        write(y:0:2, ' ');
	    	        writeln(x:0:2);
		        end;
        end
        else if (z<0) then
            writeln('nao tem raizes reais');
    end;
end;
end.
