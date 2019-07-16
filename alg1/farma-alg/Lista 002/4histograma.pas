(* ENUNCIADO
Um histograma, também conhecido por distribuição de frequência, é uma ferramenta utilizada em estatística para verificar a distribuição dos dados sobre um conjunto de classes. Sua representação visual segue um modelo como o apresentado a seguir:
// Devia ter um grafico aqui
Onde o eixo x (base) representa as classes da análise e o eixo y (altura) representa as frequências. 
Cada classe possui um intervalo de valores que define a base de cada retângulo e a altura de cada retângulo 
representa a frequência de dados para determinada classe. 
Computacionalmente é possível representar um histograma através da definição de classes e do total de exemplos 
que se enquadram em determinada classe.
Fazer um programa em Free Pascal que leia a idade de várias pessoas até que o valor lido seja zero. 
Imprima a quantidade de pessoas menores que 20 anos de idade, entre 20 e 40 anos e maiores que 40 anos. 
Além disso, pessoas com idades múltiplas de 5 não devem ser consideradas na contagem.
Exemplo de entrada 1:
21 14 49 31 36 0
Saída esperada para a entrada acima:
menores que 20: 1
entre 20 e 40: 3
maiores que 40: 1
Exemplo de entrada 2:
30 10 49 31 63 0
Saída esperada para a entrada acima:
menores que 20: 0
entre 20 e 40: 1
maiores que 40: 2
*)

program 4histograma;
var 
i,x,y,z : integer;

begin
i:=1;
x:=0;
y:=0;
z:=0;

while i <>0 do 
begin
read(i);
if (i<20) and (i mod 5 <>0) then
x:=x+1
else if (i>20) and (i<40) and (i mod 5 <> 0) then
y:=y+1
else if (i>60) and (i mod 5 <>0) then
z:=z+1;
end;
writeln('menores que 20: ',x);
writeln('entre 20 e 40: ',y);
writeln('maiores que 60: ',z);
end.
