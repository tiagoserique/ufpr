
media :: Int -> Int -> Int -> Int
media a b c
    | 3 * a > ( a + b + c ) = 1
    | otherwise = 0

acimaDaMedia :: Int -> Int -> Int -> Int
acimaDaMedia a b c = media a b c + media b a c + media c b a
