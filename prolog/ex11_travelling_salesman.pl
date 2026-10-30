/* ==========================================================================
   EX.NO: 11
   TITLE: TRAVELLING SALESMAN PROBLEM (TSP)
   AIM: To write a Prolog program to solve the Travelling Salesman Problem.
   ========================================================================== */

/* --- Graph Edges with Costs --- */
edge(a, b, 3).
edge(a, c, 5).
edge(a, d, 7).
edge(a, e, 8).
edge(b, c, 9).
edge(b, d, 10).
edge(b, e, 3).
edge(c, d, 5).
edge(c, e, 8).
edge(d, e, 6).

edge(b, a, 3).
edge(c, a, 4).
edge(d, a, 2).
edge(e, a, 7).
edge(c, b, 4).
edge(d, b, 6).
edge(e, b, 3).
edge(d, c, 5).
edge(e, c, 8).
edge(e, d, 6).

edge(a, h, 2).
edge(h, d, 1).

/* --- Length of list --- */
len([], 0).
len([_ | T], N) :- 
    len(T, X), 
    N is X + 1.

/* Best path starting and ending at node 'a' */
best_path(Visited, Total) :- 
    path(a, a, Visited, Total).

/* Initialize path search: current path starts with [Start], initial cost 0 */
path(Start, Fin, Visited, Total) :- 
    path(Start, Fin, [Start], Visited, 0, Total).

/* Recursive step: explore unvisited neighbor */
path(Start, Fin, CurrentLoc, Visited, Costn, Total) :-
    edge(Start, StopLoc, Distance),
    NewCostn is Costn + Distance,
    \+ member(StopLoc, CurrentLoc),
    path(StopLoc, Fin, [StopLoc | CurrentLoc], Visited, NewCostn, Total).

/* Base case: reached Fin back from Start, check if all 6 unique nodes visited (length = 7) */
path(Start, Fin, CurrentLoc, Visited, Costn, Total) :-
    edge(Start, Fin, Distance),
    reverse([Fin | CurrentLoc], Visited),
    len(Visited, Q),
    (Q \= 7 -> Total is 100000 ; Total is Costn + Distance).

/* Find the shortest path using setof and pick */
shortest_path(Path) :-
    setof(Cost-Path, best_path(Path, Cost), Holder),
    pick(Holder, Path).

/* Compare two solutions and choose the one with minimum cost */
best(Cost-Holder, Bcost-_, Cost-Holder) :- 
    Cost < Bcost, 
    !.
best(_, X, X).

/* Recursively select best path from candidate list */
pick([X], X) :- !.
pick([Cost-Holder | R], X) :- 
    pick(R, Bcost-Bholder),
    best(Cost-Holder, Bcost-Bholder, X),
    !.

/* ==========================================================================
   SAMPLE QUERIES & EXPECTED OUTPUT:
   --------------------------------------------------------------------------
   ?- shortest_path(Path).
   Path = 22-[a, h, d, c, e, b, a].
   ========================================================================== */
