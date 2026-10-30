/* ==========================================================================
   EX.NO: 01
   TITLE: STUDY OF PROLOG
   AIM: To Study about Prolog (Syntax, Facts, Rules, Questions, Relations)
   ========================================================================== */

/* --- 1. Facts: The Family Tree --- */
parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

/* --- 2. Unary Relations: Gender --- */
female(pam).
male(tom).
male(bob).
female(liz).
female(pat).
female(ann).
male(jim).

/* --- 3. Rules: Kinship Relations --- */
% Y is a child of X if X is a parent of Y
child(Y, X) :- 
    parent(X, Y).

% X is mother of Y if X is a parent of Y and X is female
mother(X, Y) :- 
    parent(X, Y), 
    female(X).

% X is a grandparent of Y if X is parent of Z and Z is parent of Y
grandparent(X, Y) :- 
    parent(X, Z), 
    parent(Z, Y).

% X is a sister of Y
sister(X, Y) :- 
    female(X), 
    parent(Z, X), 
    parent(Z, Y), 
    X \= Y.

% Everybody who has a child is happy
has_child(X) :- 
    parent(X, _).

happy(X) :- 
    has_child(X).

% Grandchild relation
grandchild(X, Y) :- 
    parent(Y, Z), 
    parent(Z, X).

% Aunt relation
aunt(X, Y) :- 
    sister(X, Z), 
    parent(Z, Y).

/* --- 4. Recursive Rule: Predecessor --- */
predecessor(X, Z) :- 
    parent(X, Z).

predecessor(X, Z) :- 
    parent(X, Y), 
    predecessor(Y, Z).

/* --- 5. Geometric Structures & Pattern Matching --- */
% Point: point(X, Y)
% Segment: seg(Point1, Point2)

vertical(seg(point(X, _), point(X, _))).
horizontal(seg(point(_, Y), point(_, Y))).

/* ==========================================================================
   SAMPLE QUERIES & EXPECTED OUTPUT:
   --------------------------------------------------------------------------
   ?- parent(liz, pat).
   false.

   ?- parent(bob, pat).
   true.

   ?- grandparent(pam, pat).
   true.

   ?- mother(pam, bob).
   true.

   ?- child(liz, tom).
   true.

   ?- vertical(seg(point(1, 4), point(1, 5))).
   true.

   ?- horizontal(seg(point(2, 10), point(10, 10))).
   true.
   ========================================================================== */
