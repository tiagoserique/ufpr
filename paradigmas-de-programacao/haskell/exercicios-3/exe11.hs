giraLista :: Int -> [Int] -> [Int]
giraLista _ [] = []
giraLista 0 lista = lista
giraLista n (a:lista) = giraLista (n - 1) (lista ++ [a])
