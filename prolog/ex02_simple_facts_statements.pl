/* ==========================================================================
   EX.NO: 02
   TITLE: SIMPLE FACT FOR THE STATEMENTS
   AIM: To write simple fact for the statements using Prolog
   ========================================================================== */

/* --- Facts from Statements ---
   1. The Cakes are delicious.
   2. The Pickles are delicious.
   3. The Pickles are spicy.
   4. Priya relishes coffee.
*/
delicious(cakes).
delicious(pickles).
spicy(pickles).
relishes(priya, coffee).

/* --- Rules from Statements ---
   5. Priya likes food if they are delicious.
   6. Prakash likes food if they are spicy and delicious.
*/
likes(priya, Food) :- 
    delicious(Food).

likes(prakash, Food) :- 
    spicy(Food), 
    delicious(Food).

/* --- Additional Facts & Rules (from record notes) --- */
father_of(joe, paul).
father_of(joe, mary).
mother_of(jane, paul).
mother_of(jane, mary).
male(paul).
male(joe).
female(mary).
female(jane).

% Friends, haters, and enemies rules
friends(X, Y) :- 
    likes(X, Y), 
    likes(Y, X).

hates(X, Y) :- 
    \+ likes(X, Y).

enemies(X, Y) :- 
    \+ likes(X, Y), 
    \+ likes(Y, X).

/* ==========================================================================
   SAMPLE QUERIES & EXPECTED OUTPUT:
   --------------------------------------------------------------------------
   ?- delicious(pickles).
   true.

   ?- spicy(pickles).
   true.

   ?- relishes(priya, coffee).
   true.

   ?- delicious(Food).
   Food = cakes ;
   Food = pickles.

   ?- likes(priya, Food).
   Food = cakes ;
   Food = pickles.

   ?- likes(prakash, Food).
   Food = pickles.
   ========================================================================== */
