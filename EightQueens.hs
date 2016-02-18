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
okToAddDown :: [Int] -> Int -> Bool
okToAddDown = undefined

runEightQueens = do
    solve []  -- The starting empty solution

-- Tests
tests = TestList $ map TestCase
    [assertEqual "add tests here" 1 1
    ]

runTests = do
    print "Eight Queens Puzzle"
    runTestTT tests

main = runTests
