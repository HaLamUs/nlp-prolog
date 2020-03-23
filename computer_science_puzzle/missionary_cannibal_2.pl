%[3, 3, 1, 0, 0] -> [1, 3, 0, 2, 0]
goal([0, 0, right, 3, 3]). % state - done 
% operations: [m, m], [c, c], [m], [c], [m, c], [c, m]?
move([ML1, CL, left, MR1, CR], [ML2, CL, right, MR2, CR]) :-
    ML2 is ML1-2,
    MR2 is MR1+2.
move([ML1, CL, right, MR1, CR], [ML2, CL, left, MR2, CR]) :-
    ML2 is ML1+2,
    MR2 is MR1-2.
move([ML, CL1, left, MR, CR1], [ML, CL2, right, MR, CR2]) :- 
    CL2 is CL1 - 2, 
    CR2 is CR1 + 2.
move([ML, CL1, right, MR, CR1], [ML, CL2, left, MR, CR2]) :- 
    CL2 is CL1 + 2, 
    CR2 is CR1 - 2.
move([ML1, CL, left, MR1, CR], [ML2, CL, right, MR2, CR]) :- 
    ML2 is ML1 - 1, 
    MR2 is MR1 + 1.
move([ML1, CL, right, MR1, CR], [ML2, CL, left, MR2, CR]) :- 
    ML2 is ML1 + 1, 
    MR2 is MR1 - 1.
move([ML, CL1, left, MR, CR1], [ML, CL2, right, MR, CR2]) :- 
    CL2 is CL1 - 1, 
    CR2 is CR1 + 1.
move([ML, CL1, right, MR, CR1], [ML, CL2, left, MR, CR2]) :- 
    CL2 is CL1 + 1, 
    CR2 is CR1 - 1.
move([ML1, CL1, left, MR1, CR1], [ML2, CL2, right, MR2, CR2]) :- 
    ML2 is ML1 - 1, 
    MR2 is MR1 + 1,
    CL2 is CL1 - 1, 
    CR2 is CR1 + 1.
move([ML1, CL1, right, MR1, CR1], [ML2, CL2, left, MR2, CR2]) :-
    ML2 is ML1 + 1,
    MR2 is MR1 - 1,
    CL2 is CL1 + 1,
    CR2 is CR1 - 1.
% transit(X, Y) :- move(X, Y).

valid([ML, CL, _,MR, CR]) :- 
    ML>=0, CL>=0, MR>=0, CR>=0,
	(ML>=CL ; ML=0),
	(MR>=CR ; MR=0).

dfs(F, L, [F|L]) :- goal(F).
dfs(F, L, FullPath) :- move(F, N), valid(N), \+ member(N, L), dfs(N, [N|L], FullPath).