somaPosicaoPar :: [Int] -> Int
somaPosicaoPar [] = 0
somaPosicaoPar [a] = 0
somaPosicaoPar (a:b:x) = b + somaPosicaoPar x
