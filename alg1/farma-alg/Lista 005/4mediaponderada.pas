(*
ENUNCIADO
Considere que um professor tem N alunos em sua turma de Algoritmos e Estruturas de Dados I. 
Este professor calcula a média final dos alunos após a aplicação de três provas Prova1, Prova2 e Prova3 
com pesos para as provas respectivamente de 1, 2 e 3. 
A média final é o resultado da média ponderada (Prova1 + 2 x Prova2 + 3 x Prova3)/6.

Faça um programa em Free Pascal que leia N, 0 <= N <= 100 do teclado (não precisa testar se o valor lido está 
fora desta faixa) e em seguida leia três listas de notas para os N alunos. 
As notas sempre são de 0 a 100, não precisa testar isso. 
Considere que no lugar dos nomes os alunos são numerados de 1 até N. 
Seu programa deve imprimir a média final dos N alunos (com duas casas decimais) e, para cada aluno, 
indicar se foi aprovado (média maior ou igual a 70), se deve fazer a prova final (média maior ou igual a 40 e menor que 70) 
ou se foi reprovado (média inferior a 40).

Exemplo de entrada: // Observacões
5 // a turma tem 5 alunos
50 30 10 80 85 // notas da prova 1 para os 5 alunos
40 40 60 55 75 // notas da prova 2 para os 5 alunos
80 35 90 20 95 // notas da prova 3 para os 5 alunos

Saída esperada:
Aluno 1: 61.67 Final
Aluno 2: 35.83 Reprovado
Aluno 3: 66.67 Final
Aluno 4: 41.67 Final
Aluno 5: 86.67 Aprovado
*)

program 4mediaponderada;
type
	meuvetor = array [1 .. 100] of real;

procedure ler(n:integer; var lista:meuvetor);
var 
	cont:integer;
begin
	for cont:=1 to n do
	read(lista[cont]);
end;

var
	lista1,lista2,lista3: meuvetor;
	cont,n:integer;
	media:real;
begin
	read(n);
	ler(n,lista1);
	ler(n,lista2);
	ler(n,lista3);

	for cont:=1 to n do
	begin
		media:=(lista1[cont] + lista2[cont]*2 + lista3[cont]*3)/6;
		write('Aluno ', cont,': ', media:0:2);
		if (media >= 70) then
			write(' Aprovado')
		else if (media<70) and (media>=40) then 
			write(' Final')
		else
			write(' Reprovado');
	writeln(' ');
	end;
end.
