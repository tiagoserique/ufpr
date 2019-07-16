(* 
ENUNCIADO
Considere que o usuário digite no teclado um número inteiro com exatamente 9 dígitos. 
Suponha que o último dígito seja o "dígito verificador'' do número formado pelos 8 primeiros. 
Faça um programa em Free Pascal que leia uma massa de dados terminada por 0 (zero) e que imprima "SIM'' 
se o número é bem formado, isto é, se o digito verificador é válido, e que imprima "NAO'' em caso contrário.

Implemente o seguinte algoritmo para gerar o dígito verificador:

Conforme o esquema abaixo, cada dígito do número de 8 dígitos, já desconsiderando o mais a direita, 
começando da direita para a esquerda (menos significativo para o mais significativo) é multiplicado, na ordem, 
por 2, depois 3, depois 4, depois 5 e assim sucessivamente.

Primeiramente, some todas estas multiplicações.

Veja o exemplo:
Número exemplo: 231533446

Separar os 8 primeiros dígitos do último: 23153344 - 6

Para os 8 primeiros: 
4x2 + 4x3 + 3x4 + 3x5 + 5x6 + 1x7 + 3x8 + 2x9 = 126

Dica: Um modo de separar os dígitos de um número inteiro é aplicar operações sucessivas por 10, 
utilizando tanto o quociente da divisão inteira quanto o módulo (ou resto) da divisão.

Uma vez obtida esta soma, obter o resto da divisão por 10, no caso do exemplo 126 mod 10 resulta em 6. 
Este valor deve ser comparado com o número mais a direita (o menos significativo) e se for igual o dígito 
verificador confere, como no caso do exemplo acima. Caso contrário não confere.

Algums exemplos de entrada e saída:

Exemplo de entrada 1:
231533446
Saída esperada para a entrada acima:
SIM

Exemplo de entrada 2:
231533449
Saída esperada para a entrada acima:
NAO
*)

program 4digitoverificador;
var
gva, dve,val,x,y,som, z:longint;
begin
dve:=0;
val:=1;
x:=0;
y:=0;
som:=0;
z:=1;
gva:=1;

while (gva <> 0) do
begin
    read(val);
if (val = 0) then
    gva:=val
else
begin
    dve:=val mod 10;
    val:=val div 10;
	while (y<8) do
		begin
		y:=y+1;
		z:=z+1;
		x:=val mod 10;
		som:=som+(x*(y+1));
        val:=val div 10;
		end;
    som:=som mod 10;
    if (som = dve) then
    	writeln('SIM')
    else if (som <> dve) then
    	writeln('NAO');
end;
end;
end.
