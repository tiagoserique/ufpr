tipoTriangulo :: Int -> Int -> Int -> Int
tipoTriangulo a b c 
    | ( a == b ) && ( a == c ) = 1
    | ( a /= b ) && ( a /= c ) && ( b /= c ) = 3
    | otherwise = 2
