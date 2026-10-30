/* ==========================================================================
   EX.NO: 03
   TITLE: TEMPERATURE CONVERSION
   AIM: To write predicates where one converts centigrade temperature to 
        Fahrenheit, and the other checks if a temperature is below freezing.
   ========================================================================== */

% Formula: F = C * 9 / 5 + 32
% ctof(Centigrade, Fahrenheit)
ctof(C, F) :- 
    F is C * 9 / 5 + 32.

% freezing(Fahrenheit): checks if temperature is at or below freezing (32 deg F)
freezing(F) :- 
    F =< 32.

/* ==========================================================================
   SAMPLE QUERIES & EXPECTED OUTPUT:
   --------------------------------------------------------------------------
   ?- ctof(100, F).
   F = 212.

   ?- freezing(20).
   true.

   ?- freezing(40).
   false.
   ========================================================================== */
