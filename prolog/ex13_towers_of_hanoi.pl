/* ==========================================================================
   EX.NO: 13
   TITLE: TOWERS OF HANOI
   AIM: To write a Prolog program to solve the Towers of Hanoi puzzle.
   ========================================================================== */

% Base case: Moving 1 disk directly from source peg X to destination peg Y
move(1, X, Y, _) :-
    write('Move disk from '),
    write(X),
    write(' to '),
    write(Y),
    nl.

% Recursive case: Moving N disks from X to Y using auxiliary peg Z
move(N, X, Y, Z) :-
    N > 1,
    M is N - 1,
    move(M, X, Z, Y),
    move(1, X, Y, _),
    move(M, Z, Y, X).

% Entry predicate: Solve Towers of Hanoi with N disks (pegs: left, right, center)
stoh(N) :-
    move(N, left, right, center).

/* ==========================================================================
   SAMPLE QUERIES & EXPECTED OUTPUT:
   --------------------------------------------------------------------------
   ?- stoh(3).
   Move disk from left to right
   Move disk from left to center
   Move disk from right to center
   Move disk from left to right
   Move disk from center to left
   Move disk from center to right
   Move disk from left to right
   true .
   ========================================================================== */
