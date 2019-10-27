program exer18;
var
	media,n1,n2:real;
begin
	read(n1,n2);
	media := (n1 + n2)/2;
	
	if (media >= 7) then
		writeln('aprovado')
	else if (media < 3) then
		writeln('reprovado')
	else
		writeln('exame');
end.
//EXERCICIO:
//Escreva um programa em Pascal que leia as duas notas bimestrais 
//de um aluno e determine a sua media. A partir da media, o programa 
//deve imprimir a seguinte mensagem: APROVADO, REPROVADO ou EXAME.  
//A media e' 7 para Aprovacao, menor que 3 para Reprovacao e as demais em Exame.
//Exemplos:
//3.1
//2.5
//REPROVADO
//3
//3
//EXAME
//10
//0
//EXAME
//6
//8
//APROVADO
//10
//10
//APROVADO
