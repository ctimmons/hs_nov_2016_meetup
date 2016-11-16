module Main where

import Debug.Trace (traceShow)
import System.IO


main1 = do
  -- hGetLine is strict
  h <- openFile "jabberwocky.txt" ReadMode
  contents <- hGetLine h
  hClose h
  putStrLn contents

main2 = do
  -- hGetContents is lazy
  h <- openFile "jabberwocky.txt" ReadMode
  contents <- hGetContents h
  hClose h
  putStrLn contents

main3 = do
  -- Another I/O w/ laziness bug
  fileData <- withFile "jabberwocky.txt" ReadMode hGetContents
  putStrLn fileData

main4 = do
  -- Bug-free Lazy I/O
  withFile "jabberwocky.txt" ReadMode $ \handle -> do
    fileData <- hGetContents handle
    putStrLn fileData

main5 = do
  -- This works.
  fileData <- readFile "jabberwocky.txt"
  putStrLn fileData

main6 = do
  -- But this doesn't.
  fileData <- readFile "jabberwocky.txt"
  let x = traceShow fileData ""
  return ""

main = do
  putStrLn ""