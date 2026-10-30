/* ==========================================================================
   EX.NO: 07
   TITLE: WATER JUG PROBLEM
   AIM: To write a Prolog program to solve the Water Jug problem (4-Gallon & 3-Gallon).
   Goal: Measure exactly 2 gallons of water in the 4-gallon jug: state (2, 0).
   ========================================================================== */

% Goal state reached
fill(2, 0) :-
    nl,
    write('Goal State is Reached....'),
    nl, !.

% Rule 1: Fill 4-gallon jug if empty and Y <= 1
fill(X, Y) :-
    X =:= 0,
    Y =< 1,
    nl,
    write('Fill the 4-Gallon Jug:(4,'), write(Y), write(')'),
    fill(4, Y).

% Rule 2: Fill 3-gallon jug if empty and X >= 3
fill(X, Y) :-
    Y =:= 0,
    X >= 3,
    nl,
    write('Fill the 3-Gallon Jug:('), write(X), write(',3)'),
    fill(X, 3).

% Rule 3: Pour water from 3-gallon into 4-gallon until 4-gallon is full
fill(X, Y) :-
    X + Y >= 4,
    Y =:= 3,
    X =:= 3,
    Y1 is Y - (4 - X),
    nl,
    write('Pour water from 3-Gallon Jug to 4-Gallon until is full:(4,'),
    write(Y1), write(')'),
    fill(4, Y1).

% Rule 4: Pour water from 4-gallon into 3-gallon until 3-gallon is full
fill(X, Y) :-
    X + Y >= 3,
    X =:= 4,
    Y =< 1,
    X1 is X - (3 - Y),
    nl,
    write('Pour water from 4-Gallon Jug to 3-Gallon until is full:('),
    write(X1), write(',3)'),
    fill(X1, 3).

% Rule 5: Pour all water from 3-gallon jug into 4-gallon jug
fill(X, Y) :-
    X + Y =< 4,
    X =:= 0,
    Y > 1,
    X1 is X + Y,
    nl,
    write('pour all the water from 3-Gallon Jug to 4-Gallon:('),
    write(X1), write(',0)'),
    fill(X1, 0).

% Rule 6: Pour all water from 4-gallon jug into 3-gallon jug
fill(X, Y) :-
    X + Y < 3,
    Y =:= 0,
    Y1 is X + Y,
    nl,
    write('Pour all the water from 4-Gallon Jug too 3-Gallon:(0,'),
    write(Y1), write(')'),
    fill(0, Y1).

% Rule 7: Empty 4-gallon jug on ground
fill(X, Y) :-
    Y >= 2,
    X =:= 4,
    nl,
    write('Empty the 4-Gallon Jug on Ground:(0,'), write(Y), write(')'),
    fill(0, Y).

% Rule 8: Empty 3-gallon jug on ground
fill(X, Y) :-
    Y =:= 3,
    X >= 1,
    nl,
    write('Empty the 3-Gallon Jug on Ground:('), write(X), write(',0)'),
    fill(X, 0).

% Overflow checks
fill(X, Y) :- X > 4, Y < 3, write('4L Jug Overflowed.'), nl.
fill(X, Y) :- X < 4, Y > 3, write('3L Jug Overflowed.'), nl.
fill(X, Y) :- X > 4, Y > 3, write('4L3L Jug Overflowed.'), nl.

/* ==========================================================================
   SAMPLE QUERIES & EXPECTED OUTPUT:
   --------------------------------------------------------------------------
   ?- fill(4, 0).

   Fill the 3-Gallon Jug:(4,3)
   Empty the 4-Gallon Jug on Ground:(0,3)
   pour all the water from 3-Gallon Jug to 4-Gallon:(3,0)
   Fill the 3-Gallon Jug:(3,3)
   Pour water from 3-Gallon Jug to 4-Gallon until is full:(4,2)
   Empty the 4-Gallon Jug on Ground:(0,2)
   pour all the water from 3-Gallon Jug to 4-Gallon:(2,0)
   Goal State is Reached....
   ========================================================================== */
