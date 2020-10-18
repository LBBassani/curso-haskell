fatorial:: Int -> Int
fatorial = fix (\f n -> if n == 0 then 1 else n*(f ( n - 1 ) ) )
         where
            fix f = f (fix f)

pares:: Int -> [Int]
pares n = filter (\ x -> even x) [1..n]

impares:: [Int] -> [Bool]
impares xs = map (\x -> odd x) xs

inverso:: Double -> Double
inverso = (1/)

dobro:: (Num a) => a -> a
dobro = (2*)

metade:: Double -> Double
metade = (/2)

cubo:: Double -> Double
cubo = (**3)

quinto:: Double -> Double
quinto = (/5)

potencia10:: Int -> Int
potencia10 = (10^)

antecessor:: Int -> Int
antecessor = (subtract 1)

multiplos3:: Int -> [Int]
multiplos3 n = map (\x -> x*3) [1..n]
