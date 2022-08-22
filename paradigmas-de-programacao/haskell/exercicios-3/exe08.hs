eliminaDuplicata :: [Int] -> [Int]
eliminaDuplicata [] = []
eliminaDuplicata [a] = [a]
eliminaDuplicata (a:b:list)
    | a == b = eliminaDuplicata (b:list)
    | otherwise = a : eliminaDuplicata (b:list)
