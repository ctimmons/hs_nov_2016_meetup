@echo off
%1 1e7 +RTS -hy -p
hp2ps -e8in -g -c %1.hp
move %1.ps %1_types.ps
