{-- Aula 2
        Aula síncrona: 17 de setembro de 2020

        Assunto: Tipos de Dados
    2. Crie um arquivo texto aula2.hs na pasta ~/prog1 usando seu editor de programas preferido
        2.1. Coloque os seguintes comentários nas primeiras linhas de aula2.hs
            -- isto é um comentário de uma linha

            {- isto é 
               um comentário
               de múltiplas linhas -}

        2.2. Definir a função dobro em aula2.hs
            dobro = 2*x
        2.3. Carregue aula2.hs no ghci e execute
            Prelude> :l aula2.hs
            *Main> dobro 4
            *Main> dobro 4.3
            É recomendado sempre definir o tipo da função antes de implementá-la. Escreva a função triplo da seguinte maneira:
            triplo :: Int -> Int
            triplo x = 3*x
        2.4. Recarregue aula2.hs no ghci e execute
            *Main> :r aula2.hs
            *Main> triplo 4
        2.5. Além de ajudar na documentação e no projeto da função, o tipo restringe os valores que podem ser usados, aumentando a confiabilidade no uso das funções
            *Main> triplo 4.3
        2.6. Funções podem receber e/ou retornar tuplas e listas. Defina em aula2.hs 
            2.6.1. Uma função chamada soma1 que receba uma tupla com um par de inteiros e retorne a soma deles.
                *Main> soma1 (2, 3)
                5
            2.6.2. Uma função chamada umA que receba um inteiro n e retorne a lista formada pelos números de 1 a n.
                *Main> umA 15
                [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
            2.6.3. Uma função chamada pares que receba um inteiro n e retorne a lista formada pelos pelos pares entre 0 e n.
                *Main> pares 21
                [0,2,4,6,8,10,12,14,16,18,20]
            2.6.4. Uma função chamada impares que receba um inteiro n e retorne a lista formada pelos pelos ímpares entre 0 e n.
                *Main> impares 21
                [1,3,5,7,9,11,13,15,17,19,21]
            2.6.5. Uma função chamada multiplos7 que receba um inteiro n e retorne a lista formada pelos pelos múltiplos de 7 entre 1 e n.
                *Main> multiplos7 50
                [7,14,21,28,35,42,49]
            2.6.6. Recarregue aula2.hs e testes as funções definidas. 
            2.6.7. Obtenha os tipos das funções. Redefina-as para aceitar apenas inteiros caso não tenha declarado o tipo da função em aula2.hs.
        2.7. Currying possibilita a criação de funções que recebem vários parâmetros.
            2.7.1. Defina em aula2.hs uma função chamada soma2 que receba um par de inteiros e retorne a soma deles.
                *Main> soma2 3 5
                8
            2.7.2. Defina em aula2.hs uma função chamada mult que receba três inteiros e retorne a multiplicação deles.
                *Main> mult 2 3 5
                30
            2.7.3. Recarregue aula2.hs e teste as funções definidas.
            2.7.4. Obtenha os tipos das funções. Redefina-as para aceitar apenas inteiros caso não tenha declarado o tipo da função em aula2.hs.
            2.7.5. Currying também permite a definição de novas funções a partir da aplicação parcial de funções com múltiplos parâmetros
                *Main> mult6 = mult 2 3
                *Main> mult6 5
                *Main> pega3 = take 3
                *Main> pega3 [5..10]
                *Main> :t mult
                *Main> :t mult6
                *Main> :t pega3
                *Main> :t take 3
                *Main> :t drop 3
                2.7.5.1. Defina em aula2.hs uma função chamada sucessor que retorna o número sucessor de um inteiro. Use a função soma2 para fazer isso.
                    *Main> sucessor 87
                    88
                2.7.5.2. Recarregue aula2.hs e teste a função definida.
                2.7.5.3. Identifique o que ocorre quando faz:
                    *Main> incrementa = soma1 1
    6. Defina uma função em aula2.hs para calcular a média de uma lista de números. Recarregue aula2.hs e veja o que ocorre. Corrija, recarregue e teste a função com lista de inteiros e lista de fracionários.
        *Main> media [3.1, 4.3, 5.2]
        4.2
--}

-- isto é um comentário de uma linha

{- isto é 
   um comentário
   de múltiplas linhas -}

-- 2.2
dobro x = 2 * x

-- 2.3
triplo :: Int -> Int
triplo x = 3*x

-- 2.6.1
soma1 :: (Int, Int) -> Int
soma1 (x, y) = x + y

-- 2.6.2
umA :: Int -> [Int]
umA n = [1..n]

-- 2.6.3
pares :: Int -> [Int]
pares n = [ x | x <- [0..n], even x]

-- 2.6.4
impares :: Int -> [Int]
impares n = [ x | x <- [0..n], odd x]

-- 2.6.5
multiplos7 :: Int -> [Int]
multiplos7 n = [ x | x <- [0..n], mod x 7 == 0]

-- 2.7.1
soma2 :: Int -> Int -> Int
soma2 x y = x + y

-- 2.7.2
mult :: Int -> Int -> Int -> Int
mult x y z = x * y * z

-- 2.7.5.1
sucessor :: Int -> Int
sucessor x = soma2 x 1

-- 6
media :: Fractional a => [a] -> a
media lst = (somalista lst)/(fromIntegral $ length lst)
            where
                somalista [] = 0
                somalista (x:xs) = x + somalista xs