fatorial:: Int -> Int
fatorial 0 = 1
fatorial x = x*fatorial (x - 1)

fibonacci:: Int -> Int
fibonacci 1 = 1
fibonacci 2 = 1
fibonacci x = fibonacci (x-1) + fibonacci (x-2)

primeiro:: [a] -> a
primeiro (x:_) = x

resto:: [a] -> [a]
resto (_:xs) = xs

ultimo:: [a] -> a
ultimo xs = primeiro $ reverse xs

inicio:: [a] -> [a]
inicio xs = reverse $ resto $ reverse xs

xor:: Bool -> Bool -> Bool
xor = (/=)

infix 3 |*|
a |*| b = xor a b