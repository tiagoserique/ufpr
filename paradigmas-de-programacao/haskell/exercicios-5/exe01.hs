import Data.Char

tiposDeChar :: Char -> (Char, Char, Int)
tiposDeChar c = (toUpper c, toLower c, ord c)
