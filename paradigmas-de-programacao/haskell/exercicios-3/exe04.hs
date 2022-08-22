somaPar :: [Int] -> Int
somaPar [] = 0
somaPar (a:x) 
    | mod a 2 == 1 = somaPar x
    | otherwise = a + somaPar x