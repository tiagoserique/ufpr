achaNPrimeiros :: [Int] -> Int -> [Int]
achaNPrimeiros [] _ = []
achaNPrimeiros _ 0 = []
achaNPrimeiros (a:lista) n = a : achaNPrimeiros lista (n - 1)

achaUltimos :: [Int] -> Int -> [Int]
achaUltimos [] _ = []
achaUltimos lista 0 = lista
achaUltimos (a:lista) n = achaUltimos lista (n - 1)

divideLista :: [Int] -> Int -> ([Int], [Int])
divideLista [] _ = ([], [])
divideLista (a:lista) n = ( achaNPrimeiros (a:lista) n, achaUltimos (a:lista) n )