
minimo :: [Int] -> Int
minimo [] = 0
minimo [x] = x
minimo (x:xs)
    | x < minimo xs = x
    | otherwise = minimo xs


removeMinimo :: [Int] -> [Int]
removeMinimo [] = []
removeMinimo [x] = []
removeMinimo (x:xs)
    | x == minimo (x:xs) = xs
    | otherwise = x : removeMinimo xs


ordena :: [Int] -> [Int]
ordena [] = []
ordena [x] = [x]
ordena (x: xs) = minimo (x:xs) : ordena ( removeMinimo (x:xs) )


ordenaECompacta :: Int -> Int -> Int -> Int -> (Int, Int, Int, Int)
ordenaECompacta a b c d = ( head(ordena([a]++[b]++[c]++[d])), head(tail(ordena([a]++[b]++[c]++[d]))), head(tail(tail(ordena([a]++[b]++[c]++[d])))), head(tail(tail(tail(ordena([a]++[b]++[c]++[d]))))))
