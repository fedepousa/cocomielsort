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
modulo::Integer->Ce Integer
modulo n = C [1..] (\x-> if x>0 then  (filter (\y-> (mod y n == mod x n)) [1..]) else [])



-- Ejercicio 6
{-



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
separar :: Eq b => Ce a -> (a -> b) -> Ce a
separar (C dom fun) fnueva = C dom (\x -> filter (\e -> fnueva x == fnueva e) (fun x))


-- Ejercicio 8


-- Esta seria una idea para hacer "clase" de todos y despues sacar las listas iguales
clases :: Eq a => Ce a -> [[a]]
clases (C dom fun) = nubBy (\xs ys -> xs \\ ys == []) (map f dom) 
						where f a = clase (C dom fun) a


