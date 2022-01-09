# IMPLEMENTAÇÃO DE ÁRVORE BINÁRIA A, com chave definida por uma ÁRVORE BINÁRIA B

Autores: Tiago Serique Valadares

O trabalho foi feito com base nos codigos disponibilizados pelo professor no  
repositorio do github com os notebooks de cada tipo de arvore.

Os dois tipos de arvores (arvore A e arvore B) sao BST, com suas funcoes  
adaptadas para funcionar de acordo com o que foi pedido.

Para facilitar o desenvolvimento, foi escolhido criar dois tipos de nos (tNoA e  
tNoB) e as funcoes de cada tipo de arvore possuem a letra respectiva para  
indicar, por exemplo (preordemA e preordemB), minimizando a confusao na leitura  
do codigo.

As funcoes que funcionariam em uma BST normal foram adaptadas para funcionar com
os dois tipos. No caso, onde eram feitas as operacoes com chaves da arvore A  
houveram adaptacoes para que funcionassem recebendo uma arvore do tipo B. Para
as arvores tipo B as funcoes foram feitas como se fosse uma BST normal.

Para a saida da arvore A (arvore principal) foram usados colchetes alinhados  
e para as arvores B foram usados parenteses alinhados.

Para o programa funcionar basta executar um desses comandos.  

```bash  
busca < teste.in > teste_stdin.out

ou

busca teste.in > teste_arq.out
```

(obs: me desculpe pela falta de acentuacao, meu teclado nao os tem e por isso  
a leitura ficou complicada)
