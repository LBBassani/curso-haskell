-- 3. Fazer um programa interativo chamado calculadora.hs para a realização das operações aritméticas básicas
main :: IO ()
main = do   op <- getOption
            if op == 0 then return ()
            else do calcula op
                    main

getOption :: IO Int
getOption = do  putStrLn ("Qual a sua opcao?")
                putStrLn ("0: SAIR")
                putStrLn ("1: SOMAR")
                putStrLn ("2: SUBTRAIR")
                putStrLn ("3: MULTIPLICAR")
                putStrLn ("4: DIVIDIR")
                op <- leOpt
                return (op)
                
leNum :: IO Double
leNum = do  num <- getLine
            return (read num :: Double)

leOpt :: IO Int
leOpt = do  opt <- getLine
            return (read opt :: Int)

calcula :: (Eq a, Num a) => a -> IO ()
calcula op = do putStr ("Primeiro Operando: ")
                x <- leNum
                putStr ("Segundo Operando: ")
                y <- leNum
                putStrLn ("Resultado da " ++ operacao ++ ": " ++ show (resp x y) )

                where
                    operacao    | op == 1 = "Soma"
                                | op == 2 = "Subtracao"
                                | op == 3 = "Multiplicacao"
                                | op == 4 = "Divisao"
                                | otherwise = "Op Invalida"
                    resp x y    | op == 1 = x + y
                                | op == 2 = x - y
                                | op == 3 = x*y
                                | op == 4 = x/y
                                | otherwise = x