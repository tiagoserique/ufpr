
type MeuTipo = (String, String, Char)

base :: Float -> MeuTipo
base x
    |x == 1 = ("joao", "mestre", 'm')
    |x == 2 = ("jonas", "doutor", 'm')
    |x == 3 = ("joice", "mestre", 'f')
    |x == 4 = ("janete", "doutor", 'f')
    |x == 5 = ("jocileide", "doutor", 'f')
    |otherwise = ("ninguem", "", 'x')


profissao :: MeuTipo -> String
profissao (a, b, c) = b


contaDoutores :: Float -> Float -> Float
contaDoutores 0 cont = cont
contaDoutores n cont
    | profissao ( base n ) == "doutor" = contaDoutores (n-1) (cont+1)
    | otherwise = contaDoutores (n-1) cont
