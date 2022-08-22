inverteLista :: [Int] -> [Int]
inverteLista [] = []
inverteLista [a] = [a]
inverteLista (a:x) = inverteLista (x) ++ [a]  
