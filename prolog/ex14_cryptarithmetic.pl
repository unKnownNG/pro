/* ==========================================================================
   EX.NO: 14
   TITLE: CRYPT ARITHMETIC PROBLEM
   AIM: To write a Prolog program to solve the Crypt Arithmetic Problem:
          S E N D
        + M O R E
        ---------
        M O N E Y
        ---------
   ========================================================================== */

% Solve SEND + MORE = MONEY assigning unique digits 0-9 to distinct letters
% S and M cannot be 0 (leading digits of multi-digit numbers)
alpha1(S, E, N, D, M, O, R, Y, [S, E, N, D, M, O, R, E, M, O, N, E, Y]) :-
    between(1, 9, S),
    between(0, 9, E),
    E \= S,
    between(0, 9, N),
    N \= E, N \= S,
    between(0, 9, D),
    D \= N, D \= E, D \= S,
    between(1, 9, M),
    M \= D, M \= N, M \= E, M \= S,
    between(0, 9, O),
    O \= M, O \= D, O \= N, O \= E, O \= S,
    between(0, 9, R),
    R \= O, R \= M, R \= D, R \= N, R \= E, R \= S,
    between(0, 9, Y),
    Y \= R, Y \= O, Y \= M, Y \= D, Y \= N, Y \= E, Y \= S,
    Send is S*1000 + E*100 + N*10 + D,
    More is M*1000 + O*100 + R*10 + E,
    Money is M*10000 + O*1000 + N*100 + E*10 + Y,
    Money =:= Send + More.

% User-friendly helper predicate to display the formatted sum
solve_crypt :-
    alpha1(S, E, N, D, M, O, R, Y, _),
    format('  ~w ~w ~w ~w~n', [S, E, N, D]),
    format('+ ~w ~w ~w ~w~n', [M, O, R, E]),
    format('----------~n', []),
    format('~w ~w ~w ~w ~w~n', [M, O, N, E, Y]), !.

/* ==========================================================================
   SAMPLE QUERIES & EXPECTED OUTPUT:
   --------------------------------------------------------------------------
   ?- alpha1(S, E, N, D, M, O, R, Y, Sol).
   S = 9,
   E = 5,
   N = 6,
   D = 7,
   M = 1,
   O = 0,
   R = 8,
   Y = 2,
   Sol = [9, 5, 6, 7, 1, 0, 8, 5, 1, 0, 6, 5, 2] ;
   ========================================================================== */
