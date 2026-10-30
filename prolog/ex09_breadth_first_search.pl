/* ==========================================================================
   EX.NO: 09
   TITLE: BREADTH FIRST SEARCH (BFS)
   AIM: To write a Prolog program to implement Breadth First Search.
   ========================================================================== */

% Graph transitions: s(Parent, Child)
s(a, b).
s(a, c).
s(b, d).
s(b, e).
s(c, f).
s(c, g).
s(d, h).
s(e, i).
s(e, j).
s(f, k).

% Goal states
goal(f).
goal(j).

% Entry point
solve(Start, Solution) :-
    bfs([[Start]], Solution).

% Base case: When the first path in the queue reaches a goal node
bfs([[Node | Path] | _], [Node | Path]) :-
    goal(Node).

% Recursive BFS step: extend current path and append newly generated paths to the queue
bfs([Path | Paths], Solution) :-
    extend(Path, NewPaths),
    write(NewPaths),
    nl,
    conc(Paths, NewPaths, Paths1),
    bfs(Paths1, Solution).

% Extend path by finding all valid successor states
extend([Node | Path], NewPaths) :-
    bagof([NewNode, Node | Path], (s(Node, NewNode), \+ member(NewNode, [Node | Path])), NewPaths),
    !.
extend(_, []).

% Concatenation with trace print as required by lab output
conc([], L, L).
conc([X | L1], L2, [X | L3]) :-
    nl, write('conc'), write(X), write(' '), write(L1), write(L2),
    conc(L1, L2, L3).

/* ==========================================================================
   SAMPLE QUERIES & EXPECTED OUTPUT:
   --------------------------------------------------------------------------
   ?- solve(a, S).
   [[b,a],[c,a]]
   [[d,b,a],[e,b,a]]
   conc[c,a] [][[d,b,a],[e,b,a]][[f,c,a],[g,c,a]]
   conc[d,b,a] [[e,b,a]][[f,c,a],[g,c,a]]
   conc[e,b,a] [][[f,c,a],[g,c,a]][[h,d,b,a]]
   conc[e,b,a] [[f,c,a],[g,c,a]][[h,d,b,a]]
   conc[f,c,a] [[g,c,a]][[h,d,b,a]]
   conc[g,c,a] [][[h,d,b,a]][[i,e,b,a],[j,e,b,a]]
   conc[f,c,a] [[g,c,a],[h,d,b,a]][[i,e,b,a],[j,e,b,a]]
   conc[g,c,a] [[h,d,b,a]][[i,e,b,a],[j,e,b,a]]
   conc[h,d,b,a] [][[i,e,b,a],[j,e,b,a]]
   S = [f, c, a] ;
   ========================================================================== */
