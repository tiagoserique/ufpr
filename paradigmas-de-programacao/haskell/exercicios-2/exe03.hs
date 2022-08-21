encontraMaior :: Int -> Int -> Int -> Int
encontraMaior a b c 
    | ( a > b ) && ( a > c ) = a
    | ( b > a ) && ( b > c ) = b
    | otherwise = c