cortaFim :: Int -> [Int] -> [Int]
cortaFim _ [] = []
cortaFim 0 _ = []
cortaFim fim (a:lista) = a : cortaFim(fim - 1) lista

cortaInicio :: Int -> [Int] -> [Int]
cortaInicio _ [] = []
cortaInicio 1 lista = lista
cortaInicio inicio (a:lista) = cortaInicio (inicio-1) lista

fatiaLista :: Int -> Int -> [Int] -> [Int]

fatiaLista i j lista
    | i > length lista = []
    | j < i = []
    | otherwise = cortaFim (j - i + 1) ( cortaInicio i lista )