ehPalindromo :: String -> Bool
ehPalindromo [] = True
ehPalindromo [x] = True
ehPalindromo (x:xs) = x == last xs && ehPalindromo (init xs)
