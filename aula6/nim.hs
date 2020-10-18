-- 5. Fazer um programa interativo chamado nim.hs para se jogar uma variante do jogo nim. 
--  O tabuleiro é composto por 5 linhas numeradas com asteriscos, iniciadas da seguinte forma:
import Data.List

tabuleiro :: [[Char]]
tabuleiro = ["*****", "****", "***", "**", "*"]

main :: IO ()
main = do   putStrLn $ imprimeTabuleiro tabuleiro
            rodaJogo tabuleiro

rodaJogo :: [[Char]] -> IO ()
rodaJogo tabuleiro = do tabIntermediario <- jogada 1 tabuleiro
                        putStrLn $ imprimeTabuleiro tabIntermediario
                        if checkVencedor tabIntermediario then do   putStrLn ("\nJogador 1 venceu!!")
                                                                    return ()
                        else do novoTabuleiro <- jogada 2 tabIntermediario
                                putStrLn $ imprimeTabuleiro novoTabuleiro
                                if checkVencedor novoTabuleiro then do  putStrLn ("\nJogador 2 venceu!!")
                                                                        return ()
                                else do rodaJogo novoTabuleiro

jogada :: Int ->  [[Char]] -> IO [[Char]]
jogada jogador tabuleiro = do   putStrLn("\nJogador" ++ show jogador)
                                putStr ("Entre o numero da linha: ")
                                l <- leNum
                                putStr ("Numero de asteriscos a serem removidos: ")
                                n <- leNum
                                return (removeAsteriscos l n tabuleiro)

checkVencedor :: [[a]] -> Bool
checkVencedor tabuleiro = all null tabuleiro

leNum :: IO Int
leNum = do  num <- getLine
            return (read num :: Int)

imprimeTabuleiro :: [[Char]] -> [Char]
imprimeTabuleiro xs = imprimeLinhasTabuleiro 1 ( map (intersperse ' ' ) xs )

imprimeLinhasTabuleiro :: Int -> [[Char]] -> [Char]
imprimeLinhasTabuleiro l [] = []
imprimeLinhasTabuleiro l (x:xs) = "\n" ++ show l ++ ": " ++ x ++ imprimeLinhasTabuleiro (l+1) xs

removeAsteriscos :: Int -> Int -> [[Char]] -> [[Char]]
removeAsteriscos l n tabuleiro = replace (l-1) (drop n (tabuleiro!!(l-1))) tabuleiro

replace :: Int -> a -> [a] -> [a]
replace pos newVal list = take pos list ++ newVal : drop (pos+1) list
