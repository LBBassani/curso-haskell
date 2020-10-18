-- 4. Fazer um programa interativo chamado notas.hs para ler de um arquivo texto as 
--  notas de um aluno e salvar em outro arquivo as medias desses alunos
main :: IO ()
main = do   putStrLn ("Qual o nome do arquivo?")
            nome <- getLine
            conteudo <- readFile nome
            writeFile "medias.txt" $ medias $ lines conteudo

medias :: [String] -> String
medias [] = []
medias (x:xs) = show (media notas) ++ "\n" ++ medias xs
                where
                    notas = map (read::String->Double) (words x)


media :: Fractional a => [a] -> a
media lst = (somalista lst)/(fromIntegral $ length lst)
            where
                somalista [] = 0
                somalista (x:xs) = x + somalista xs