-- penultimo :: [a] -> a -> a -> a
-- penultimo [] a _ = a

achaPenultimo :: [a] -> [a]
achaPenultimo []  = []
achaPenultimo [a] = [a]
achaPenultimo (a:list) = achaPenultimo list
