module Main where

import Control.DeepSeq
import Debug.Trace (traceShow)

quicksort :: (Ord a, Show a) => [a] -> [a]  
quicksort [] = []  
quicksort (x:xs) =   
    let smallerSorted = quicksort [a | a <- xs, a <= x]  
        biggerSorted = quicksort [a | a <- xs, a > x]  
    in  traceShow x $ smallerSorted ++ [x] ++ biggerSorted

do_qs_lazy = do
  putStrLn $ show $ take 5 s
  where
    s = quicksort [2, 1, 4, 3, 6, 5, 8, 7, 10, 9, 12, 11, 14, 13, 16, 15, 18, 17, 20, 19]
  
do_qs_strict = do
  --s <- return $!! ((quicksort [2, 1, 4, 3, 6, 5, 8, 7, 10, 9, 12, 11, 14, 13, 16, 15, 18, 17, 20, 19]) :: [Int])
  putStrLn $ show $ take 5 s
  where
    s = force ((quicksort [2, 1, 4, 3, 6, 5, 8, 7, 10, 9, 12, 11, 14, 13, 16, 15, 18, 17, 20, 19]) :: [Int])

main =
  do_qs_lazy >> do_qs_strict


