-- 4. Crie uma função sinal em aula3guard.hs usando equações guardadas que recebe um número e retorna o inteiro -1, se o número é negativo, 1, se é positivo e 0, se o número é 0.
sinal :: Int -> Int
sinal a | a > 0 = 1
        | a < 0 = -1
        | a == 0 = 0

-- 5. Refaça a mesma função do item 4 usando otherwise.
sinalother :: Int -> Int
sinalother a | a > 0 = 1
             | a < 0 = -1
             | otherwise = 0

-- 6. Refaça a mesma função do item 5 usando True no lugar de otherwise.
sinalTrue :: Int -> Int
sinalTrue a | a > 0 = 1
            | a < 0 = -1
            | True = 0

