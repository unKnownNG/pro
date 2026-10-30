/* ==========================================================================
   EX.NO: 08
   TITLE: DEPTH FIRST SEARCH (DFS)
   AIM: To write a Prolog program to implement Depth First Search.
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

% List membership
mem(X, [X | _]).
mem(X, [_ | Tail]) :- 
    mem(X, Tail).

% Entry point
solve(Node, Solution) :-
    dfs([], Node, Solution).

% Base case: Goal reached
dfs(Path, Node, [Node | Path]) :-
    goal(Node).

% Recursive DFS with cycle prevention
dfs(Path, Node, Sol) :-
    s(Node, Node1),
    \+ mem(Node1, Path),
    dfs([Node | Path], Node1, Sol).

/* ==========================================================================
   SAMPLE QUERIES & EXPECTED OUTPUT:
   --------------------------------------------------------------------------
   ?- solve(a, S).
   S = [j, e, b, a] ;
   S = [f, c, a] .
   ========================================================================== */
