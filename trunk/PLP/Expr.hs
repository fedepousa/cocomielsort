module Expr where
import Equiv
import List
 
-- Definicion del tipo de datos

data Exp = Cte Integer | Suma Exp Exp | Mult Exp Exp | Var String | Let String Exp Exp deriving (Eq, Show)

type Contexto = [(String, Integer)]

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Ejercicio 9
{-
El fold correspondiente al tipo.
Respetando el esquema clasico para datos de varios constructores
Cuando usamos evaluar b tipa (Contexto -> Integer )
cuando usamos evaluar_prudente b tipa (Contexto -> Maybe Integer )
-}
fold::(Integer->b)->(b->b->b)->(b->b->b)->(String->b)->(String->b->b->b)->Exp->b
fold f_cte f_suma f_mult f_var f_let (Cte int) = f_cte int
fold f_cte f_suma f_mult f_var f_let (Suma exp1 exp2) = f_suma (fold f_cte f_suma f_mult f_var f_let exp1) (fold f_cte f_suma f_mult f_var f_let exp2)
fold f_cte f_suma f_mult f_var f_let (Mult exp1 exp2) = f_mult (fold f_cte f_suma f_mult f_var f_let exp1) (fold f_cte f_suma f_mult f_var f_let exp2)
fold f_cte f_suma f_mult f_var f_let (Var str) = f_var str
fold f_cte f_suma f_mult f_var f_let (Let str exp1 exp2) = f_let str (fold f_cte f_suma f_mult f_var f_let exp1) (fold f_cte f_suma f_mult f_var f_let exp2)


--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Ejercicio 10
--Agrega al contexto el par correspondiente
agregar::Contexto->String->Integer->Contexto
agregar c n v = (n,v) : filter (\x-> (fst x /= n ) )  c

 
--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Ejercicio 11
{-La idea del cambio en este ejercicio es que el fold me devuelva en vez de valores funciones
las funciones que me devuelven son del tipo Contexto -> a, hago esto para resolver facil el caso del let
en el caso de fold que entra por un let, cuando usamos evaluar
f_let es una funcion del tipo ::String->(b)->(b)->Contexto->b
entonces cuando hace f_let str (fold f_cte f_suma f_mult f_var f_let exp1) (fold f_cte f_suma f_mult f_var f_let exp2)
te queda algo de tipo Contexto->b  (osea una funcion)
entonces cuando realmente aplico un Contexto se termina de evaluar (porque f_var usa siempre un contexto)
-}

evaluar::Exp->Integer
evaluar exp = evaluarPrima exp []

evaluarPrima::Exp->Contexto->Integer
evaluarPrima = fold f_cte f_suma f_mult f_var f_let
    where
     f_cte = \x contexto -> x
     f_suma = \x y contexto -> (x contexto) + (y contexto)
     f_mult = \x y contexto -> (x contexto) * (y contexto)
     f_var = \str contexto  -> snd (head ( filter (\x-> ( fst x == str)) contexto))
     f_let = \str exp1F exp2F contexto -> exp2F (agregar contexto  str (exp1F contexto))

  
--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Ejercicio 12
{-
Es lo mismo que la funcion anterior nada mas que chequea si la variable no esta definida devuelve un Nothing.
tanto sumap como multp si reciben algun Nothing, devuelven Nothing.

-}
evaluar_prudente::Exp->Maybe Integer
evaluar_prudente exp = evaluar_prudentePrima exp []

evaluar_prudentePrima::Exp->Contexto->Maybe Integer
evaluar_prudentePrima = fold f_cteP f_sumaP f_multP f_varP f_letP
    where
     f_cteP = \x contexto -> Just x
     f_sumaP = \x y contexto -> if (algunoEsNothing (x contexto) (y contexto) ) then Nothing
              else  ( mybeFunc (+) (x contexto) (y contexto)  )
     f_multP = \x y contexto -> if (algunoEsNothing (x contexto) (y contexto) ) then Nothing
              else  ( mybeFunc (*) (x contexto) (y contexto)  )
     f_varP = \str contexto ->  if  (length ( ( filter (\x -> ( fst x == str)) contexto)) ==0) then Nothing
              else Just (snd (head ( filter (\x-> ( fst x == str)) contexto)))
     f_letP = \str exp1F exp2F contexto -> if (algunoEsNothing (exp1F contexto) (exp1F contexto)) then Nothing
                else exp2F (agregar contexto  str (sinNothing (exp1F contexto)))

algunoEsNothing Nothing _ = True
algunoEsNothing _ Nothing = True
algunoEsNothing _ _ = False

mybeFunc f (Just x) (Just y) = Just (f x y)
sinNothing (Just x) = x


--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Ejercicio 13
{-
La idea fue usar foldr
Lista inicial tenemos [1..h-1]
Caso base tenemos la lista con las ctes definidas ( de cero a k)
Y la funcion lo que hace es tomar un elemento y la lista (ya foldeada), itera en los elementos de esa lista, y devuelve la lista original mas lo siguiente:
Toma cada elemento de la lista y lo convina con sus otros elementos usando los dos constructores binarios y asi construye los del siguiente nivel.
Esto lo va a hacer h veces dado que la lista inicial tiene esa cantidad de elementos
 -}
foldNat :: (b -> b) -> b -> Integer -> b
foldNat s z 0 = z
foldNat s z n = s (foldNat s z (n-1))

generar::Integer->Integer->[Exp]
generar k h = nub ( foldNat (\lista -> concat[[Suma e1 e2, Mult e1 e2 ] | e1<-lista, e2<-lista] ++ lista ) [Cte i | i<-[0..k]] (h-1))

 

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Ejercicio 14
{-
devuelve un Exp que el dominio es  "generar k h"  y la funcion asociada que devuele los elementos
de la partcion que se le pida, primero chequea si el elemento esta enel dominio para hacer eso
usa evaluar_prudente y le pegunta si es Nothing en ese caso devolvemos la lista vacia como corresponde
en caso que pertenezca al dominio, iteramos el dominio y con evaluar prudente chequeamos si los elementos
dan el mismo resultado y por lo tanto pertenecen a la misa clase, en se caso, lo devolvemos
-}

sinJust (Just x) = x
isNothing Nothing = True
isNothing _ = False

generar_clases::Integer->Integer->Ce Exp
generar_clases k h = ( C (generar k h) (\x ->if (isNothing (evaluar_prudente x)) then []
        else ([e | e<- (generar k h) ,   (evaluar_prudente x) ==  (evaluar_prudente e)]  ) ))

