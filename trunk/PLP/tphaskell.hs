module Equiv where

-- Definición del tipo de datos

data Ce a = C [a] (a -> [a])


-- Ejercicio 1
dominio :: Ce a -> [a]
dominio (C ls funcion) = ls

-- Ejercicio 2
clase :: Ce a -> a -> [a]
clase (C ls f) a = f a


-- Ejercicio 3
todos_iguales :: [a] -> Ce a
todos_iguales ls = C ls (\x -> ls)

-- Ejercicio 4
todos_distintos :: [a] -> Ce a
todos_distintos ls = C ls (\x -> [id x])

-- Ejercicio 5
modulo :: Integer -> Ce Integer
modulo n = C [1..] (\x -> [ y | y <- [1..], y `mod` n == x `mod` n]) 

-- Ejercicio 6


-- Ejercicio 7 
separar :: Eq b => Ce a -> (a -> b) -> Ce a
separar (C dom fun) fnueva = C dom (\x -> filter (\e -> fnueva x == fnueva e) (fun x))