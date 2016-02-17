module EightQueens where

import Test.HUnit


solve :: [Int] -> [Int]
solve xs = xs

okToAddLevel :: [Int] -> Int -> Bool
okToAddLevel = undefined

okToAddUp :: [Int] -> Int -> Bool
okToAddUp = undefined

okToAddDown :: [Int] -> Int -> Bool
okToAddDown = undefined

runEightQueens = do
    solve []

-- Tests
tests = TestList $ map TestCase
    [assertEqual "add tests here" 1 1
    ]

runTests = do
    print "Eight Queens Puzzle"
    runTestTT tests

main = runTests
