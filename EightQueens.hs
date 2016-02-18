module EightQueens where

import Test.HUnit


-- Data Structure
-- A list of Ints which represet queens where the index represents the column
-- and the Int at an index represents the row. E.g. [3,5,7] represents a
-- partial solution where three queens are place on the board at (7,7), (6,5),
-- and (5,3). The right-most index always represents the right-most column of
-- the chess board. Indices are 0..7.
--
--                    0 1 2 3 4 5 6 7
-- Example solution: [3,5,7,1,6,0,2,4]

solve :: [Int] -> [Int]
solve xs = xs

-- It's ok to add a queen when no other queens are in the row.
okToAddLevel :: Int -> [Int] -> Bool
okToAddLevel x xs = not $ elem x xs

-- It's ok to add a queen of no queen occupies the upward diagonal.
okToAddUp :: Int -> Int -> [Int] -> Bool
okToAddUp _ _ [] = True
okToAddUp 0 x partialSolution = True
okToAddUp n 0 partialSolution = True
okToAddUp n x partialSolution
                | current /= next = okToAddUp (n - 1) next (tail partialSolution)
                | current == next = False
                    where  current = x - 1
                           next = head partialSolution

-- It's ok to add a queen of no queen occupies the downward diagonal.
okToAddDown ::  Int -> Int -> [Int] -> Bool
okToAddDown _ _ [] = True
okToAddDown 0 x partialSolution = True
okToAddDown n 7 partialSolution = True
okToAddDown n x partialSolution
                | current /= next = okToAddDown (n - 1) next (tail partialSolution)
                | current == next = False
                    where  current = x + 1
                           next = head partialSolution

runEightQueens = do
    solve []  -- The starting empty solution

-- Tests
t1 = TestCase (assertEqual "0 [0]" False (okToAddLevel 0 [0]))
t2 = TestCase (assertEqual "0 [1,2,3,4,5,6,7]" True (okToAddLevel 0 [1,2,3,4,5,6,7]))
t3 = TestCase (assertEqual "7 []" True (okToAddLevel 7 []))
t4 = TestCase (assertEqual "" True (okToAddUp 0 3 []))
t5 = TestCase (assertEqual "" False (okToAddUp 7 7 [6,5,4,3,2,1,0]))
t6 = TestCase (assertEqual "" True (okToAddUp 3 4 [0,2,4]))
t7 = TestCase (assertEqual "" True (okToAddUp 2 0 [2,1]))
t8 = TestCase (assertEqual "" True (okToAddDown 2 7 [2,1]))
t9 = TestCase (assertEqual "" True (okToAddDown 3 4 [0,2,5]))
t10 = TestCase (assertEqual "" False (okToAddDown 7 0 [1,2,3,4,5,6,7]))
t11 = TestCase (assertEqual "" True (okToAddDown 0 6 []))

tests = TestList [
            TestLabel "Cannot add queen if queen occupies row" t1,
            TestLabel "Can add queen if no other queen occupies row" t2,
            TestLabel "Can always add queen to empty solution" t3,
            TestLabel "Can always add queen to empty solution" t4,
            TestLabel "Can't add queen if upwards diagonal is occupied" t5,
            TestLabel "Can add queen if upwards diagonal isn't occupied" t6,
            TestLabel "Can add queen if upwards diagonal isn't occupied" t7,
            TestLabel "Can add queen if downwards diagonal isn't occupied" t8,
            TestLabel "Can add queen if downwards diagonal isn't occupied" t9,
            TestLabel "Can't add queen if downwards diagonal isn occupied" t10,
            TestLabel "Can add queen to an empty solution" t11
        ]

runTests = do
    print "Eight Queens Puzzle"
    runTestTT tests

-- Main just runs tests for now
main = runTests
