retiraElemento :: [Int] -> Int -> [Int]
retiraElemento [] _ = []
retiraElemento (a:lista) 0 = lista
retiraElemento (a:lista) n = a : retiraElemento lista (n - 1)
