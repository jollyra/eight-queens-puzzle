module EightQueens where

import Test.HUnit


solve :: [Int] -> [Int]
solve xs = xs

-- It's ok to add a queen when no other queens are in the row.
okToAddLevel :: Int -> [Int] -> Bool
okToAddLevel target ls = not $ elem target ls

okToAddUp :: [Int] -> Int -> Bool
okToAddUp = undefined

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
