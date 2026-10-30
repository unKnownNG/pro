/* ==========================================================================
   EX.NO: 10
   TITLE: MISSIONARIES AND CANNIBALS PROBLEM
   AIM: To write a Prolog program to solve the Missionaries and Cannibals Problem.
   ========================================================================== */

% State representation: [CL, ML, BoatPosition, CR, MR]
% CL: Cannibals on Left, ML: Missionaries on Left
% CR: Cannibals on Right, MR: Missionaries on Right
% BoatPosition: left or right

start([3, 3, left, 0, 0]).
goal([0, 0, right, 3, 3]).

% Validity check: Missionaries must never be outnumbered on either bank
legal(CL, ML, CR, MR) :-
    ML >= 0, CL >= 0, MR >= 0, CR >= 0,
    (ML >= CL ; ML =:= 0),
    (MR >= CR ; MR =:= 0).

/* --- Moves from Left to Right --- */

% Two missionaries cross left to right
move([CL, ML, left, CR, MR], [CL, ML2, right, CR, MR2]) :-
    MR2 is MR + 2,
    ML2 is ML - 2,
    legal(CL, ML2, CR, MR2).

% Two cannibals cross left to right
move([CL, ML, left, CR, MR], [CL2, ML, right, CR2, MR]) :-
    CR2 is CR + 2,
    CL2 is CL - 2,
    legal(CL2, ML, CR2, MR).

% One missionary and one cannibal cross left to right
move([CL, ML, left, CR, MR], [CL2, ML2, right, CR2, MR2]) :-
    CR2 is CR + 1,
    CL2 is CL - 1,
    MR2 is MR + 1,
    ML2 is ML - 1,
    legal(CL2, ML2, CR2, MR2).

% One missionary crosses left to right
move([CL, ML, left, CR, MR], [CL, ML2, right, CR, MR2]) :-
    MR2 is MR + 1,
    ML2 is ML - 1,
    legal(CL, ML2, CR, MR2).

% One cannibal crosses left to right
move([CL, ML, left, CR, MR], [CL2, ML, right, CR2, MR]) :-
    CR2 is CR + 1,
    CL2 is CL - 1,
    legal(CL2, ML, CR2, MR).

/* --- Moves from Right to Left --- */

% Two missionaries cross right to left
move([CL, ML, right, CR, MR], [CL, ML2, left, CR, MR2]) :-
    MR2 is MR - 2,
    ML2 is ML + 2,
    legal(CL, ML2, CR, MR2).

% Two cannibals cross right to left
move([CL, ML, right, CR, MR], [CL2, ML, left, CR2, MR]) :-
    CR2 is CR - 2,
    CL2 is CL + 2,
    legal(CL2, ML, CR2, MR).

% One missionary and one cannibal cross right to left
move([CL, ML, right, CR, MR], [CL2, ML2, left, CR2, MR2]) :-
    CR2 is CR - 1,
    CL2 is CL + 1,
    MR2 is MR - 1,
    ML2 is ML + 1,
    legal(CL2, ML2, CR2, MR2).

% One missionary crosses right to left
move([CL, ML, right, CR, MR], [CL, ML2, left, CR, MR2]) :-
    MR2 is MR - 1,
    ML2 is ML + 1,
    legal(CL, ML2, CR, MR2).

% One cannibal crosses right to left
move([CL, ML, right, CR, MR], [CL2, ML, left, CR2, MR]) :-
    CR2 is CR - 1,
    CL2 is CL + 1,
    legal(CL2, ML, CR2, MR).

/* --- Recursive Search --- */

% Base case: reached goal state
path([CL, ML, B, CR, MR], [CL, ML, B, CR, MR], _, MovesList) :-
    output(MovesList).

% Recursive step
path([CL1, ML1, B1, CR1, MR1], [CL2, ML2, B2, CR2, MR2], Explored, MovesList) :-
    move([CL1, ML1, B1, CR1, MR1], [CL3, ML3, B3, CR3, MR3]),
    \+ member([CL3, ML3, B3, CR3, MR3], Explored),
    path([CL3, ML3, B3, CR3, MR3], [CL2, ML2, B2, CR2, MR2],
         [[CL3, ML3, B3, CR3, MR3] | Explored],
         [[[CL3, ML3, B3, CR3, MR3], [CL1, ML1, B1, CR1, MR1]] | MovesList]).

/* --- Printing Output --- */
output([]) :- nl.
output([[A, B] | MovesList]) :-
    output(MovesList),
    write(B), write(' -> '), write(A), nl.

% Predicate to find and print the solution
find :-
    path([3, 3, left, 0, 0], [0, 0, right, 3, 3], [[3, 3, left, 0, 0]], []).

/* ==========================================================================
   SAMPLE QUERIES & EXPECTED OUTPUT:
   --------------------------------------------------------------------------
   ?- find.

   [3,3,left,0,0] -> [1,3,right,2,0]
   [1,3,right,2,0] -> [2,3,left,1,0]
   [2,3,left,1,0] -> [0,3,right,3,0]
   [0,3,right,3,0] -> [1,3,left,2,0]
   [1,3,left,2,0] -> [1,1,right,2,2]
   [1,1,right,2,2] -> [2,2,left,1,1]
   [2,2,left,1,1] -> [2,0,right,1,3]
   [2,0,right,1,3] -> [3,0,left,0,3]
   [3,0,left,0,3] -> [1,0,right,2,3]
   [1,0,right,2,3] -> [1,1,left,2,2]
   [1,1,left,2,2] -> [0,0,right,3,3]
   ========================================================================== */
