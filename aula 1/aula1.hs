{-- Aula 1 
        Aula síncrona: 10 de setembro de 2020

        Assunto: Introdução e Primeiros Passos

    4. Crie um arquivo texto aula1.hs na pasta ~/prog1 usando seu editor de programas preferido
        4.1. NÃO USE TABS!!!! Caracteres de tabulação podem causar problemas em Haskell porque o layout tem significado na semântica de Haskell. Como diferentes editores interpretam os caracteres de tabulação de forma distinta, o melhor para evitar problemas é não usá-los em seus programas.
        4.2. escreva a seguinte linha de código em aula1.hs
            dobro x = 2 * x
        4.3. carregue o programa aula1.hs no ghci
        Prelude> :load aula1.hs
        4.4. calcule o dobro de 7
            *Main> dobro 7
        4.5. modifique o arquivo aula1.hs criando a função quadruplo usando a definicao da funcao dobro e recarregue o arquivo no ghci
            *Main> :l aula1.hs  
        4.6. calcule o quadruplo de 15 
        4.7. crie a função fatorial de um numero em aula1.hs e recarregue o arquivo no ghci
            *Main> :reload
        4.8. calcule fatorial de 100
        4.9. Escreva as linhas abaixo no final do arquivo aula1.hs exatamente como escrito aqui e recarregue o arquivo no ghci
            N = a 'div' length xs
              where
                 a = 10
                xs = [1, 2, 3, 4, 5]
        4.10 Faça as correções em aula1.hs e recarregue no ghci
            *Main> :r
        4.11. defina uma função em aula1.hs (nao use a funcao last) que obtenha o ultimo elemento de uma lista
        4.12. defina uma função em aula1.hs (nao use a funcao last) que obtenha o ultimo elemento de uma lista de forma diferente do item 4.11
        4.13. defina uma função em aula1.hs (nao use a funcao init) para remover o ultimo elemento de uma lista
        4.14. defina uma função em aula1.hs (nao use a funcao init) para remover o ultimo elemento de uma lista de forma diferente do item 4.13
--}

-- 4.2
dobro x = 2 * x

-- 4.5
quadruplo x = dobro $ dobro x

-- 4.7
fatorial x = if x == 0 then 1 else product [1..x]

-- 4.10
n = a `div` length xs
  where
    a = 10
    xs = [1, 2, 3, 4, 5]

-- 4.11
ultimo1 lst = head $ reverse lst

-- 4.12
ultimo2 lst = lst!!(length lst - 1)

-- 4.13
primeiros1 lst = take (length lst - 1) lst

-- 4.14
primeiros2 lst = reverse $ drop 1 $ reverse lst