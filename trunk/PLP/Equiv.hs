module Equiv where
import List
-- Definición del tipo de datos

data Ce a = C [a] (a -> [a]) 


 


-- Ejercicio 1
{-
Devuelve el dominio de la clase 
-}
dominio :: Ce a -> [a]
dominio (C ls funcion) = ls

-- Ejercicio 2
{-
Devuelve la clase de un elemento dado, aplicando la funcion de particion
-}
clase :: Ce a -> a -> [a]
clase (C ls f) a = f a


-- Ejercicio 3
{-
Genera la clase haciendo que el dominio sea la lista pasada por parametro
y luego la funcion devuelve la misma lista para todo elemento perteneciente a ella
-}
todos_iguales :: Eq a => [a] -> Ce a
todos_iguales ls = C ls (\x ->  if x `elem` ls then ls else [])

-- Ejercicio 4
{-
Genera la clase haciendo que el dominio sea la lista pasada por parametro
y luego la funcion devuelve una lista con cada elemento por separado
-}
todos_distintos :: Eq a => [a] -> Ce a
todos_distintos ls = C ls (\x -> if x `elem` ls then [id x] else [])

-- Ejercicio 5
{-
Devuelve una clase de equivalencia donde el dominio son todos los numeros naturales
y la funcion de particion filtra del dominio a los que tienen el mismo modulo que el elemento dado.
-}
modulo::Integer->Ce Integer
modulo n = C [1..] (\x-> if x>0 then  (filter (\y-> (mod y n == mod x n)) [1..]) else [])



-- Ejercicio 6
{-
La funcion union_disjunta hace la union de las dos clases siguiendo la sugerencia del enunciado
Para el dominio se mezclaron los dos dominios utilizando la lista intermedia sugerida en el enunciado
Para definir la nueva funcion de particion se usa fuertemente que la union es disjunta, de esta manera
si dado un elemento, al aplicarle la funcion de particion de la primera clase de la union da una lista vacia
entonces el elemento pertenecia a la segunda clase y por ende se aplica la segunda funcion. Se hace de forma analoga
para el caso contrario.
-}
maybear::[a]->[Maybe a]
maybear lista = map (Just) lista

infNothing::[Maybe a]
infNothing = [Nothing | x<-[1..]]

isJust                 :: Maybe a -> Bool
isJust (Just a)        =  True
isJust Nothing         =  False

fromJust               :: Maybe a -> a
fromJust (Just a)      =  a
fromJust Nothing       =  error "Maybe.fromJust: Nothing"


union_disjunta:: Eq a => Ce a->Ce a->Ce a
union_disjunta (C dom1 f1) (C dom2 f2) = (C (map (fromJust) (filter isJust (concat superDom)) ) (\x-> (if ((null(take 1 (f1 x))) && (null(take 1 (f2 x))) ) then [] else ( if  (null(take 1 (f1 x))) then  (f2 x) else (f1 x)))))
                                                where superDom = [ [fst x,snd x]  | x<- ( fst(break (\x -> (fst x == Nothing) && (snd x == Nothing))(zip ((maybear dom1) ++ infNothing) ((maybear dom2) ++ infNothing))))]




-- Ejercicio 7 
{-
Se genera una nueva clase donde el dominio es el mismo y la funcion nueva es simplemente aplicar la segunda
funcion de particion al resultado dado por la primera
-}
separar :: Eq b => Ce a -> (a -> b) -> Ce a
separar (C dom fun) fnueva = C dom (\x -> filter (\e -> fnueva x == fnueva e) (fun x))




-- Ejercicio 8
{-
Se generan todas las clases de equivalencia aplicando la funcion clase a todos los elementos del dominio
y luego se extraen las listas repetidas.
-}
clases :: Eq a => Ce a -> [[a]]
clases (C dom fun) = nubBy (\xs ys -> xs \\ ys == []) (map f dom) 
                                                where f a = clase (C dom fun) a

