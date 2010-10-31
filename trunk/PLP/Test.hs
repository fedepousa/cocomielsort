-- Test Tp Funcional

module Test where

import List
import Equiv
import Expr
import HUnit

--Ejercicio 1

test1 = TestCase (assertEqual "Un Test " (foldl (+) 0 [1..10]) 55)

correr = do runTestTT test1
