insereEmN :: [Int] -> Int -> Int -> [Int]
insereEmN [] _ val = [val]
insereEmN list 0 val = val : list
insereEmN (a:list) n val = a : insereEmN list (n-1) val
