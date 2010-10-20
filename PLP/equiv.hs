module Equiv where
import List
-- Definición del tipo de datos

data Ce a = C [a] (a -> [a])



-- Ejercicio 1
dominio :: Ce a -> [a]
dominio (C ls funcion) = ls

-- Ejercicio 2
clase :: Ce a -> a -> [a]
clase (C ls f) a = f a


-- Ejercicio 3
todos_iguales :: Eq a => [a] -> Ce a
todos_iguales ls = C ls (\x ->  if x `elem` ls then ls else [])

-- Ejercicio 4
todos_distintos :: Eq a => [a] -> Ce a
todos_distintos ls = C ls (\x -> if x `elem` ls then [id x] else [])

-- Ejercicio 5
modulo :: Integer -> Ce Integer
modulo n = C [1..] (\x -> if x > 0 then [ y | y <- [1..], y `mod` n == x `mod` n] else []) 

-- Ejercicio 6

--TODO

-- Ejercicio 7 
separar :: Eq b => Ce a -> (a -> b) -> Ce a
separar (C dom fun) fnueva = C dom (\x -> filter (\e -> fnueva x == fnueva e) (fun x))


-- Ejercicio 8


-- Esta seria una idea para hacer "clase" de todos y despues sacar las listas iguales
clases :: Eq a => Ce a -> [[a]]
clases (C dom fun) = nubBy (\xs ys -> xs \\ ys == []) (map f dom) 
						where f a = clase (C dom fun) a




