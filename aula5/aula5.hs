-- 2.1. Obter os primeiros múltiplos de 7
multiplos7 :: Int -> [Int]
multiplos7 n = [ x*7 | x <- [0..n]]

-- 2.2. Obter os primeiros cubos
cubos :: Int -> [Int]
cubos n = [ x^3 | x <- [0..n]]

-- 2.3. Obter tuplas com números de uma lista e seu cubo
tuplasCubos :: [Int] -> [(Int, Int)]
tuplasCubos lst = [(x, x^3) | x <- lst]

-- 2.4. Obter a tabuada de 0 a 9 de um número
tabuada :: Int -> [(Int, Int, Int)]
tabuada n = [(y, n, y*n) | y <- [0..9]]

-- 2.5. Apresentar uma lista de tuplas com os índices das 
--  celulas de uma matriz com m linhas e n colunas. As tuplas 
--  devem ser apresentadas seguindo a ordenação por linha.
matLin :: Int -> Int -> [(Int, Int)]
matLin n m = [ y | x <- [0..n-1], y <- col x m]
            where
                col i m = [(i, y) | y <- [0..m-1]]

-- 2.6. Apresentar uma lista de tuplas com os índices das 
--  celulas de uma matriz com m linhas e n colunas. As tuplas 
--  devem ser apresentadas seguindo a ordenação por coluna.
matCol :: Int -> Int -> [(Int, Int)]
matCol n m = [ y | x <- [0..m-1], y <- lin x n]
            where
                lin i m = [(y, i) | y <- [0..m-1]]

-- 2.7. Apresentar uma lista de tuplas com os índices das celulas de uma matriz tridimensional.
indMat3D :: Int -> Int -> Int -> [(Int, Int, Int)]
indMat3D n m z = [ y | x <- [0..n-1], y <- aux x m z]
                where
                    aux i m z = [(i, fst(x), snd(x)) | x <- matLin m z]

-- 2.8. Obter as tabuadas dos n primeiros numeros não negativos
tabuadas :: Int-> [(Int, Int, Int)]
tabuadas n = [ y | x <- [0..n], y <- tabuada x]

-- 2.9. Refazer o item 2.9 retornando uma lista de listas, na qual cada lista componente é a tabuada de um número.
tabuadasLL :: Int -> [[(Int, Int, Int)]]
tabuadasLL n = [ tabuada x | x <- [0..n] ]

-- 2.10. Obter as tabuadas a partir de duas listas de números inteiros
tabuadasCL :: [Int] -> [Int] -> [(Int, Int, Int)]
tabuadasCL lst1 lst2 = [ (x, y, x*y) | x <- lst1, y <- lst2 ]

-- 2.11. Apresentar uma lista de pares com os indices de posições 
--  da matriz triangular superior de uma matriz de n linhas e m colunas, linha a linha.
indTriSup :: Int -> Int -> [(Int, Int)]
indTriSup n m = [(x, y) | x <- [0..n-1], y <- [0..m-1], x <= y ]

-- 2.12. Apresentar uma lista de pares com os indices de posições da matriz triangular 
--  inferior de uma matriz de n linhas e m colunas, linha a linha.
indTriInf :: Int -> Int -> [(Int, Int)]
indTriInf n m = [(x, y) | x <- [0..n-1], y <- [0..m-1], x >= y ]

-- 2.13. Concatenar uma lista de listas
concatena :: [[a]] -> [a]
concatena lst = [ y | x <- lst, y <- x]

-- 2.14. Apresentar uma lista de triplas contendo as combinações de valores 
--  inteiros não maiores que um número não negativo que podem formar um triângulo 
--  retângulo, ou seja, a combinação de valores nos quais vale o teorema de pitágoras
pitagoras :: Int -> [(Int, Int, Int)]
pitagoras n = [(x, y, z) | x <- [1..n], y <- [1..n], z <- [1..n], x^2 == y^2 + z^2]

pitagoras2 :: Int -> [(Int, Int, Int)]
pitagoras2 n = [(x, y, z) | x <- [1..n], y <- [1..x], z <- [1..y], x^2 == y^2 + z^2]

-- 2.15. Apresentar os fatores de um número inteiro positivo, isto é, os valores pelos quais o número é divisível
fatores :: Int -> [Int]
fatores n = [x | x <- [1..div n 2] ++ [n], mod n x == 0 ]

-- 2.16. Obter os números primos não maiores que um número inteiro positivo
primos :: Int -> [Int]
primos n = [x | x <- [2..n], primo x]

primo 1 = False
primo 2 = True
primo n = not (length [x | x <- [2 .. n-1], mod n x == 0] > 0)

-- 2.17. Obter os números perfeitos não maiores que um número inteiro positivo. 
--  Um número inteiro positivo é perfeito se ele é igual a soma de seus fatores excluindo o próprio número.
perfeitos :: Int -> [Int]
perfeitos n = [x | x <- [1..n], x == perfeito x]
            where
                perfeito = sum . init . fatores

-- 2.18. Contar o número de vezes que um elemento está presente em uma lista
contaElem :: (Eq a) => a -> [a] -> Int
contaElem elem lst = length (posicoes elem lst)

-- 2.19. Verificar se uma lista está ordenada.
ordem :: (Ord a) => [a] -> Bool
ordem lst = [ lst!!(i - 1) | i <- [1..length lst - 1], lst!!(i - 1) < lst!!i ] ++ [last lst] == lst

-- 2.20. Calcular o produto escalar de dois vetores de mesma dimensão
escalar :: (Num a) => [a] -> [a] -> a
escalar vec1 vec2 = sum [(vec1!!i)*(vec2!!i) | i <- [0..length vec1 - 1]]

-- 2.21. Obter as posições em que um elemento é encontrado numa lista. 
posicoes :: (Eq a) => a -> [a] -> [Int]
posicoes elem lst = [i | i <- [0..length lst - 1], lst!!i == elem]

-- 2.22. Gerar uma lista contendo os primeiros números primos
nPrimosLazy :: Int -> [Int]
nPrimosLazy n = take 10 [x | x <- [0..], primo x]