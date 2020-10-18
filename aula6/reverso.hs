-- 1. Fazer um programa interativo chamado reverso.hs para obter um nome e apresentar o seu reverso.
main :: IO ()
main = do   putStrLn "Qual o nome?"
            xs <- getLine
            putStrLn("O reverso de " ++ xs ++ " eh " ++ reverse xs)
