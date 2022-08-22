removeUltimo :: [a] -> [a]
removeUltimo [] = []
removeUltimo [a] = []
removeUltimo (a:x) = a : removeUltimo x
