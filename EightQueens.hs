module EightQueens where

import Test.HUnit


-- Tests
tests = TestList $ map TestCase
    [assertEqual "add tests here" 1 1
    ]

runTests = do
    print "Eight Queens Puzzle"
    runTestTT tests

main = runTests
