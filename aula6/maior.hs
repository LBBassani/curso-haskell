-- 2. Fazer um programa interativo chamado maior.hs para obter uma lista de números e apresentar o maior desses numeros.
main :: IO ()
main = do   putStrLn ("Forneça a lista de numeros:")
            xs <- getLine
            putStrLn $ show $ maior $ map (read::String->Double) (words xs)

maior:: (Ord a) => [a] -> a
maior (x:xs)    | xs == []       = x
                | (maior xs) > x = maior xs
                | otherwise      = x