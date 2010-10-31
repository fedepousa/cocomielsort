-- Test Tp Funcional

module Test where

import List
import Equiv
import Expr
import HUnit

test = do runTestTT tests1
          runTestTT tests2
          runTestTT tests3



testPrueba = TestCase (assertEqual "Test de prueba" (foldl (+) 0 [1..10]) 55)

--Ejercicio 1

test1 = TestCase (assertEqual "Ejercicio 1 Test 1" (dominio (C [1..3] (\x -> if x `elem` [1..3] then [id x] else []))) [1,2,3]) 
test2 = TestCase (assertEqual "Ejercicio 1 Test 2" (take 5 (dominio (C [0..] (\x -> if x `elem` [0..] then [id x] else [])))) [0..4]) 
test3 = TestCase (assertEqual "Ejercicio 1 Test 3" (dominio (C [2, 4..10] (\x -> if x `elem` [2, 4..10] then [id x] else []))) [2,4,6,8,10]) 
test4 = TestCase (assertEqual "Ejercicio 1 Test 4" (dominio (C [1..10] (\x -> if x `elem` [1..10] then [id x] else []))) [1,2,3,4,5,6,7,8,9,10]) 

tests1 = TestList [TestLabel "TestPrueba" testPrueba, TestLabel "Test1" test1, TestLabel "Test2" test2, TestLabel "Test3" test3, TestLabel "Test4" test4]

--Ejercicio 2

test5 = TestCase (assertEqual "Ejercicio 2 Test 1" (clase (C [1..3] (\x -> if x `elem` [1..3] then [id x] else [])) 2) [2])
test6 = TestCase (assertEqual "Ejercicio 2 Test 2" (clase (C [1..3] (\x -> if x `elem` [1..3] then [id x] else [])) 11) [])
test7 = TestCase (assertEqual "Ejercicio 2 Test 3" (take 5 (clase (C [0..] (\x -> if x < 0 then [] else if x `rem` 2 == 0 then [0,2..] else [1,3..])) 4)) [0,2,4,6,8])
test8 = TestCase (assertEqual "Ejercicio 2 Test 4" (take 5 (clase (C [0..] (\x -> if x < 0 then [] else if x `rem` 2 == 0 then [0,2..] else [1,3..])) 11)) [1,3,5,7,9])

tests2 = TestList [TestLabel "Test5" test5, TestLabel "Test6" test6, TestLabel "Test7" test7, TestLabel "Test8" test8]


--Ejercicio 3

test9 = TestCase (assertEqual "Ejercicio 3 Test 1" (dominio (todos_iguales [2,4..10])) [2,4,6,8,10])
test10 = TestCase (assertEqual "Ejercicio 3 Test 2" (clase (todos_iguales [2,4..10]) 4) [2,4,6,8,10])
test11 = TestCase (assertEqual "Ejercicio 3 Test 3" (dominio (todos_iguales [1,3..9])) [1,3,5,7,9])
test12 = TestCase (assertEqual "Ejercicio 3 Test 4" (clase (todos_iguales [1,3..9]) 4) [])

tests3 = TestList [TestLabel "Test9" test9, TestLabel "Test10" test10, TestLabel "Test11" test11, TestLabel "Test12" test12]

--Ejercicio 4


--Ejercicio 5
--Ejercicio 6
--Ejercicio 7
--Ejercicio 8
--Ejercicio 9
--Ejercicio 10
--Ejercicio 11
--Ejercicio 12
--Ejercicio 13
--Ejercicio 14




