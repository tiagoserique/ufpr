Aluno: Tiago Serique Valadares - GRR20195138

//------------------------------------------------------------------------------
grafo decompoe(grafo g);

são usadas duas dfs, uma para empilhar os vertices em pós-ordem, e outra para 
efetivamente decompor o grafo e achar suas componentes. Após isso, cada 
componente é registrada em um subgrafo do grafo original, retornando assim, o 
grafo original e suas componentes.