/* ==========================================================================
   EX.NO: 06
   TITLE: N-QUEEN PROBLEM (8-QUEENS)
   AIM: To write a Prolog program to solve the N-Queens problem.
   ========================================================================== */

% Solution base case: empty list of queens is safe
solution([]).

% Recursive solution: place queen at X/Y, ensure remaining queens are safe
% and that X/Y does not attack any of the others
solution([X/Y | Others]) :- 
    solution(Others),
    mem(Y, [1, 2, 3, 4, 5, 6, 7, 8]),
    noattack(X/Y, Others).

% A queen does not attack an empty list of queens
noattack(_, []).

% Check that queen at X/Y does not attack queen at X1/Y1 (same row or diagonal)
noattack(X/Y, [X1/Y1 | Others]) :- 
    Y =\= Y1,
    Y1 - Y =\= X1 - X,
    Y1 - Y =\= X - X1,
    noattack(X/Y, Others).

% Member check
mem(X, [X | _]).
mem(X, [_ | T]) :- 
    mem(X, T).

% 8-Queens template representation (column 1 to 8)
template([1/Y1, 2/Y2, 3/Y3, 4/Y4, 5/Y5, 6/Y6, 7/Y7, 8/Y8]).

/* Helper predicate to run and print solution */
solve_8_queens(S) :-
    template(S),
    solution(S).

/* ==========================================================================
   SAMPLE QUERIES & EXPECTED OUTPUT:
   --------------------------------------------------------------------------
   ?- template(S), solution(S).
   S = [1/4, 2/2, 3/7, 4/3, 5/6, 6/8, 7/5, 8/1] ;
   S = [1/5, 2/2, 3/4, 4/7, 5/3, 6/8, 7/6, 8/1] .
   ========================================================================== */
