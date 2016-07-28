The Difference Between Object Oriented Programming and Functional Programming
=============================================================================

*27 July 2016*
--------------

From what I can tell, the main difference between object oriented programming and functional programming is how they try to solve the problem of global mutable state.
They both seem to take issue with, and fix the problems associated with, parts of that phrase.
OOP takes issue with "global", and solves that with encapsulation and everything else OOP is known for.
FP takes issue with "global mutable state", and solves it with an emphasis on pure functions that don't mutate anything outside their own scope - and often not even things inside.
