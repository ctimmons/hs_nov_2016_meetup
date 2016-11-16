@echo off
%1 1e7 +RTS -hc -p
hp2ps -e8in -g -c %1.hp
move %1.ps %1_cost_centers.ps
