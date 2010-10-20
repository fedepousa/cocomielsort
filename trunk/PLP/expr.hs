module Expr where
import Equiv
import List

-- Definicion del tipo de datos

data Exp = Cte Integer | Suma Exp Exp | Mult Exp Exp | Var String | Let String Exp Exp deriving (Eq, Show)

type Contexto = [(String, Integer)]


-- Ejercicio 9
--TODO

-- Ejercicio 10
--TODO

-- Ejercicio 11
--TODO

-- Ejercicio 12
--TODO

-- Ejercicio 13
--TODO

-- Ejercicio 14
--TODO
