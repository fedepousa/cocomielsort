-- Test Tp Funcional

module Test where

import List
import Equiv
import Expr
import HUnit

test = do runTestTT tests1
          runTestTT tests2
          runTestTT tests3
          runTestTT tests4
          runTestTT tests5
          runTestTT tests6
          runTestTT tests7
          runTestTT tests8
          runTestTT tests10
          runTestTT tests11
          runTestTT tests12
          runTestTT tests13
          runTestTT tests14



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

test13 = TestCase (assertEqual "Ejercicio 4 test 1" (dominio (todos_distintos [2,4..10])) [2,4,6,8,10])
test14 = TestCase (assertEqual "Ejercicio 4 test 2" (clase (todos_distintos [2,4..10]) 4) [4])
test15 = TestCase (assertEqual "Ejercicio 4 test 3" (dominio (todos_distintos [1,3..9])) [1,3,5,7,9])
test16 = TestCase (assertEqual "Ejercicio 4 test 4" (clase (todos_distintos [1,3..9]) 15) [])

tests4 = TestList [TestLabel "Test13" test13, TestLabel "Test14" test14, TestLabel "Test15" test15, TestLabel "Test16" test16]


--Ejercicio 5

test17 = TestCase (assertEqual "Ejercicio 5 test 1" (take 10 (dominio (modulo 3))) [1,2,3,4,5,6,7,8,9,10])
test18 = TestCase (assertEqual "Ejercicio 5 test 2" (take 10 (clase (modulo 3) 1)) [1,4,7,10,13,16,19,22,25,28])
test19 = TestCase (assertEqual "Ejercicio 5 test 3" (take 10 (clase (modulo 5) 2)) [2,7,12,17,22,27,32,37,42,47])
test20 = TestCase (assertEqual "Ejercicio 5 test 4" (clase (modulo 3) 0) [])

tests5 = TestList [TestLabel "Test17" test17, TestLabel "Test18" test18, TestLabel "Test19" test19, TestLabel "Test20" test20]

--Ejercicio 6

test21 = TestCase (assertEqual "Ejercicio 6 test 1" (dominio (union_disjunta (todos_distintos [2,4..10]) (todos_iguales [1,3..9]))) [2,1,4,3,6,5,8,7,10,9])
test22 = TestCase (assertEqual "Ejercicio 6 test 2" (clase (union_disjunta (todos_distintos [2,4..10]) (todos_iguales [1,3..9])) 2) [2])
test23 = TestCase (assertEqual "Ejercicio 6 test 3" (clase (union_disjunta (todos_distintos [2,4..10]) (todos_iguales [1,3..9])) 3) [1,3,5,7,9])
infParesModulo4 = C [2,4..]  (\x -> (if (mod x 2 /= 0 ) then [] else filter (\y-> mod y 4 == mod x 4) [2,4..]))
infImParesModulo3 = C  [1,3..]  (\x -> (if (mod x 2 ==0) then [] else (filter (\y-> mod y 3 == mod x 3) [1,3..])))
test24 = TestCase (assertEqual "Ejercicio 6 test 4" (take 10 (dominio (union_disjunta infImParesModulo3 infParesModulo4))) [1..10])
test25 = TestCase (assertEqual "Ejercicio 6 test 5" (take 10 (clase (union_disjunta infImParesModulo3 infParesModulo4) 2)) [2,6,10,14,18,22,26,30,34,38])


tests6 = TestList [TestLabel "Test21" test21, TestLabel "Test22" test22, TestLabel "Test23" test23, TestLabel "Test24" test24, TestLabel "Test25" test25]

--Ejercicio 7

test26 = TestCase (assertEqual "Ejercicio 7 test 1" (dominio (separar (todos_iguales [1,3..9]) (flip rem 3))) [1,3,5,7,9])
test27 = TestCase (assertEqual "Ejercicio 7 test 2" (clase (separar (todos_iguales [1,3..9]) (flip rem 3)) 1) [1,7])
test28 = TestCase (assertEqual "Ejercicio 7 test 3" (take 10 (dominio (separar (todos_iguales [0..]) (flip rem 2)))) [0,1,2,3,4,5,6,7,8,9])
test29 = TestCase (assertEqual "Ejercicio 7 test 4" (take 10 (clase (separar (todos_iguales [0..]) (flip rem 2)) 3)) [1,3,5,7,9,11,13,15,17,19])

tests7 = TestList [TestLabel "Test26" test26, TestLabel "Test27" test27, TestLabel "Test28" test28, TestLabel "Test29" test29]

--Ejercicio 8

test30 = TestCase (assertEqual "Ejercicio 8 test 1" (clases (todos_distintos [1..5])) [[1],[2],[3],[4],[5]])
test31 = TestCase (assertEqual "Ejercicio 8 test 2" (clases (todos_iguales [1..5])) [[1,2,3,4,5]])

tests8 = TestList [TestLabel "Test30" test30, TestLabel "Test31" test31]

--Ejercicio 9


--Ejercicio 10

test33 = TestCase (assertEqual "Ejercicio 10 test 1" (agregar [] "A" 3) [("A", 3)])
test34 = TestCase (assertEqual "Ejercicio 10 test 2" (agregar [("B", 4)] "A" 3) [("A", 3), ("B",4)])
test35 = TestCase (assertEqual "Ejercicio 10 test 3" (agregar [("A", 7), ("B", 4), ("A", 8)] "A" 3) [("A", 3), ("B",4)])

tests10 = TestList [TestLabel "Test33" test33, TestLabel "Test34" test34, TestLabel "Test35" test35]

--Ejercicio 11
test36 = TestCase (assertEqual "Ejercicio 11 test 1" (evaluar (Suma (Cte 1) (Cte 2))) 3)
test37 = TestCase (assertEqual "Ejercicio 11 test 2" (evaluar (Mult (Suma (Cte 3) (Cte 4)) (Cte 2))) 14)
test38 = TestCase (assertEqual "Ejercicio 11 test 3" (evaluar (Mult (Suma (Cte 3) (Cte 4)) (Let "X" (Cte 2) (Var "X")))) 14)

tests11 = TestList [TestLabel "Test36" test36, TestLabel "Test37" test37, TestLabel "Test38" test38]

--Ejercicio 12

test39 = TestCase (assertEqual "Ejercicio 12 test 1" (evaluar_prudente (Suma (Cte 1) (Cte 2))) (Just 3))
test40 = TestCase (assertEqual "Ejercicio 12 test 2" (evaluar_prudente (Mult (Suma (Cte 3) (Cte 4)) (Let "X" (Cte 2) (Var "X")))) (Just 14))
test41 = TestCase (assertEqual "Ejercicio 12 test 3" (evaluar_prudente (Var "X")) Nothing)
test42 = TestCase (assertEqual "Ejercicio 12 test 4" (evaluar_prudente (Mult (Suma (Cte 3) (Var "Y")) (Let "X" (Cte 2) (Var "X")))) Nothing)

tests12 = TestList [TestLabel "Test39" test39, TestLabel "Test40" test40, TestLabel "Test41" test41, TestLabel "Test42" test42]

--Ejercicio 13

test43 = TestCase (assertEqual "Ejercicio 13 test 1" (generar 0 1) [Cte 0])
test44 = TestCase (assertEqual "Ejercicio 13 test 2" (generar 0 2) [Suma (Cte 0) (Cte 0), Mult (Cte 0) (Cte 0), (Cte 0)])
test45 = TestCase (assertEqual "Ejercicio 13 test 3" (length (generar 0 3)) 19)
test46 = TestCase (assertEqual "Ejercicio 13 test 4" (generar 4 1) [Cte 0, Cte 1, Cte 2, Cte 3, Cte 4])
test47 = TestCase (assertEqual "Ejercicio 13 test 5" (length (generar 4 2)) 55)

tests13 = TestList [TestLabel "Test43" test43, TestLabel "Test44" test44, TestLabel "Test45" test45, TestLabel "Test46" test46, TestLabel "Test47" test47]

--Ejercicio 14

test48 = TestCase (assertEqual "Ejercicio 14 test 1" (dominio (generar_clases 0 3)) (generar 0 3))
test49 = TestCase (assertEqual "Ejercicio 14 test 2" (clase (generar_clases 1 2) (Suma (Cte 0) (Cte 1))) [Suma (Cte 0) (Cte 1), Suma (Cte 1) (Cte 0), Mult (Cte 1) (Cte 1), Cte 1])
test50 = TestCase (assertEqual "Ejercicio 14 test 3" (clase (generar_clases 1 2) (Suma (Cte 4) (Cte 1))) [])

tests14 = TestList [TestLabel "Test48" test48, TestLabel "Test49" test49, TestLabel "Test50" test50] 






