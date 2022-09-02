
-- type MeuTipo = (String, String, Char, Int)

-- base :: Float -> MeuTipo
base x
    |x == 1 = ("joao", "mestre", 'm', 35)
    |x == 2 = ("jonas", "doutor", 'm', 37)
    |x == 3 = ("joice", "mestre", 'f', 30)
    |x == 4 = ("janete", "doutor", 'f', 38)
    |x == 5 = ("jocileide", "doutor", 'f', 50)
    |otherwise = ("ninguem", "", 'x', 0)


idade :: (String, String, Char, Float) -> Float
idade (_, _, _, i) = i

profissao :: (String, String, Char, Float) -> String
profissao (_, a, _, _) = a

somaIdade :: Float -> Float
somaIdade n 
    |n == 0 = 0
    |profissao (base n) == "doutor" = idade (base n) + somaIdade (n-1)
    |otherwise = somaIdade (n-1)

contaDoutores :: Float -> Float
contaDoutores n 
    |n == 0 = 0
    |profissao (base n) == "doutor" = 1 + contaDoutores (n-1)
    |otherwise = contaDoutores (n-1)

idadeMedia :: Float -> Float
idadeMedia n = somaIdade n / contaDoutores n

genero :: (String, String, Char, Float) -> Char
genero (_, _, a, _) = a

contaMulheresDoutoras :: Float -> Float
contaMulheresDoutoras n
    |n == 0 = 0
    |profissao (base n) == "doutor" && genero (base n) == 'f' = 1 + contaMulheresDoutoras (n-1)
    |otherwise = contaMulheresDoutoras (n-1)