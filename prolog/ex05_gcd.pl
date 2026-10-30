/* ==========================================================================
   EX.NO: 05
   TITLE: GCD OF TWO NUMBERS
   AIM: To write a Prolog program to find the GCD of two numbers.
   ========================================================================== */

% Base case: GCD of identical numbers is the number itself
gcd(X, X, X).

% Case 1: X < Y, subtract X from Y
gcd(X, Y, D) :- 
    X < Y, 
    Y1 is Y - X, 
    gcd(X, Y1, D).

% Case 2: Y < X, subtract Y from X
gcd(X, Y, D) :- 
    Y < X, 
    X1 is X - Y, 
    gcd(X1, Y, D).

/* ==========================================================================
   SAMPLE QUERIES & EXPECTED OUTPUT:
   --------------------------------------------------------------------------
   ?- gcd(75, 30, B).
   B = 15.

   ?- gcd(15, 60, A).
   A = 15.
   ========================================================================== */
