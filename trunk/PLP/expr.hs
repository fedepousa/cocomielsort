module Expr where
-- import Equiv
import List

-- Definicion del tipo de datos

data Exp = Cte Integer | Suma Exp Exp | Mult Exp Exp | Var String | Let String Exp Exp deriving (Eq, Show)

type Contexto = [(String, Integer)]


-- Ejercicio 9
fold::(Integer->b)->(b->b->b)->(b->b->b)->(String->b)->(String->Exp->Exp->b)->Exp->b
fold f_cte f_suma f_mult f_var f_let (Cte int) = f_cte int
fold f_cte f_suma f_mult f_var f_let (Suma exp1 exp2) = f_suma (fold f_cte f_suma f_mult f_var f_let exp1) (fold f_cte f_suma f_mult f_var f_let exp2)
fold f_cte f_suma f_mult f_var f_let (Mult exp1 exp2) = f_mult (fold f_cte f_suma f_mult f_var f_let exp1) (fold f_cte f_suma f_mult f_var f_let exp2)
fold f_cte f_suma f_mult f_var f_let (Var str) = f_var str
fold f_cte f_suma f_mult f_var f_let (Let str exp1 exp2) = f_let str exp1 exp2  -- CREO Q LA ESTOY CAGANDO, NO ESTOY SEGURO

-- Ejercicio 10
agregar::Contexto->String->Integer->Contexto
agregar c n v = (n,v) : filter (\x-> (fst x /= n ) )  c

-- Ejercicio 11
evaluar::Exp->Integer
evaluar exp = evaluarPrima exp []

evaluarPrima::Exp->Contexto->Integer
evaluarPrima exp contexto = fold f_cte f_suma f_mult f_var f_let exp
				where 
					f_cte = id
					f_suma = (+)
					f_mult = (*)
					f_var = \str			-> snd (head ( filter (\x-> ( fst x == str)) contexto))
					f_let = \str exp1 exp2  -> evaluarPrima exp2 ( agregar contexto str (evaluarPrima exp1 contexto) )   --WARNING: ESTO ES RECURCION EXPLICITA?

-- Ejercicio 12
evaluar_prudentePrima:: Exp -> Contexto -> Maybe Integer
evaluar_prudentePrima exp contexto = fold f_cteP f_sumaP f_multP f_varP f_letP exp
	where 
	f_varP str =  if  (length ( ( filter (\x-> ( fst x == str)) contexto)) >0) then Just (snd (head ( filter (\x-> ( fst x == str)) contexto))) 
				   else Nothing
	f_letP = \str exp1 exp2 -> (if ( (evaluar_prudentePrima exp1 contexto)==Nothing) then Nothing 	 --WARNING: ESTO ES RECURCION EXPLICITA?
								else evaluar_prudentePrima exp2 ( agregar contexto str (evaluarPrima exp1 contexto))) 
	f_cteP x= Just x
	f_sumaP (Just x) (Just y) = Just (x + y)
	f_sumaP Nothing _ = Nothing
	f_sumaP _ _ = Nothing
	f_multP (Just x) (Just y) = Just (x * y)
	f_multP Nothing _ = Nothing
	f_multP _ _ = Nothing
	
						
-- Ejercicio 13

--TODO: VERSION CORRECTA PERO NO ENTREGABLE PORQUE TIENE RECURSION EXPLICITA
generar::Integer->Integer->[Exp]
generar k h =  [ (Cte n) | n<-[0..k] ]  ++ nub (generarPrima k h)

generarPrima::Integer->Integer->[Exp]
generarPrima k 1 =  [ (Cte n) | n<-[0..k] ] 
generarPrima k h =  nub (concat[  [(Suma izq der) , (Mult izq der)] |  izqH<-[1..h-1] , derH <-[1..h-1]  , izq<-(generar k izqH) , der<-(generar k derH)] )

-- Ejercicio 14
--TODO
