converteBinario :: Int -> Int
converteBinario 0 = 0
converteBinario n = converteBinario (div n 2) * 10 + mod n 2  