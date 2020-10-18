
-- 2.1. Encontrar o maior de dois números
maior :: (Num a, Ord a) => a -> a -> a 
maior a b = if a > b then a else b

-- 2.2. Calcular a média das notas de um aluno
media :: (Num a, Fractional a) => [a] -> a
media lst = (soma lst)/(fromIntegral $ length lst)

soma :: Num a => [a] -> a
soma lst = if null lst then 0 else (head lst) + (soma $ tail lst)

-- 2.3. Verificar se um aluno passou direto (média das notas superior a 7.0). Retorne o resultado usando um booleano.
aprovacaoB :: (Ord a, Fractional a) => [a] -> Bool
aprovacaoB notas = media notas >= 7

-- 2.4. Verificar se um aluno passou direto (média das notas superior a 7.0). Use a função do item 2.3 e retorne o resultado usando uma string.
aprovacaoS :: (Ord a, Fractional a) => [a] -> [Char]
aprovacaoS notas = if aprovacaoB notas then "aprovado" else "reprovado"

-- 2.5. Indicar se dois números estão em ordem crescente, decrescente ou são iguais
ordem :: Ord a => a -> a -> [Char]
ordem a b | a > b = "decrescente"
          | a == b = "iguais"
          | a < b = "crescente"

-- 2.6. Achar o maior de 3 números
maior3 :: (Num a, Ord a) => a -> a -> a -> a
maior3 a b c = maior c $ maior a b

-- 2.7. Verificar se três números podem formar um triângulo e, em caso positivo, qual tipo de triângulo formariam (escaleno, isósceles ou equilátero)
triangulo a b c = if not $ ehtriangulo a b c
                    then "Nao eh triangulo"
                    else if a == b && b == c 
                            then "equilatero"
                            else if a == b || a == c || b == c
                                    then "isosceles"
                                    else "escaleno"

                 where
                    ehtriangulo a b c = a + b > c && a + c > b && b + c > a

-- 2.8. Calcular o fatorial de um número inteiro
fatorial :: (Ord a, Num a) => a -> a
fatorial a = if a > 0 then a*(fatorial $ a - 1) else 1

-- 2.9. Calcular o máximo divisor comum de dois números inteiros
mdc :: Int -> Int -> Int
mdc a b = if b == 0 then a else mdc b $ mod a b

-- 2.10. Contar o número de dígitos de um número inteiro
digitos :: Int -> Int
digitos a = if div a 10 > 0 then 1 + (digitos $ div a 10) else 1

-- 2.11. Determinar se um número inteiro é palíndromo
palindromo :: Int -> Bool
palindromo a = a == reverseInt a
            where
                reverseInt = read . reverse . show

palindromoCondicional :: Int -> Bool
palindromoCondicional a = a == reverseInt a 0
            where
                reverseInt a b = if a == 0 then b
                                           else reverseInt (div a 10) $ b*10 + (mod a 10)

-- 2.12. Converter um número inteiro formado por dígitos binários para sua representação decimal; 2.13. Converter um número inteiro decimal em um número inteiro formado por dígitos binários com sua representação binária
convert2base :: Int -> Int -> Int -> Int -- funciona de base 2 até base 10
convert2base a old new = funcaux a 0 1 
            where
                -- onde a é a variável de consumo, b a construção da resposta e c o modificador de chamada
                funcaux a b c = if a == 0 then b
                                          else funcaux (div a new) (b + mod a new * c) (c*old)

binPdec :: Int -> Int
binPdec a = convert2base a 2 10

decPbin :: Int -> Int
decPbin a = convert2base a 10 2

-- 2.14. Criar uma função safetail que realiza a função tail sem que ocorra exceção quando aplicada a lista vazia.
safetail :: [a] -> [a]
safetail lst = if null lst then [] else tail lst