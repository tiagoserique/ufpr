type Nome = String
type Numero = String
type Agenda = (Nome, Numero)

buscaPorNome :: [Agenda] -> Nome -> Agenda
buscaPorNome [] _ = ("", "")
buscaPorNome _ "" = ("", "")
buscaPorNome (x:xs) nome
    | nome == fst x = x
    |otherwise = buscaPorNome xs nome

buscaPorNumero :: [Agenda] -> Numero -> Agenda
buscaPorNumero [] _ = ("", "")
buscaPorNumero _ "" = ("", "")
buscaPorNumero (x:xs) numero
    | numero == snd x = x
    | otherwise = buscaPorNumero xs numero
