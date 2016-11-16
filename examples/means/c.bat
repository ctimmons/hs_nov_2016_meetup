@echo off
ghc --make -O2 %1 -prof -auto-all -caf-all -fforce-recomp -rtsopts
