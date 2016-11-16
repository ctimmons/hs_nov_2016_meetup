@echo off
ghc -O2 -rtsopts -threaded -eventlog sudoku2
sudoku2 sudoku17.1000.txt +RTS -N2 -s -l

ghc -O2 -rtsopts -threaded -eventlog sudoku3
sudoku3 sudoku17.1000.txt +RTS -N2 -s -l
