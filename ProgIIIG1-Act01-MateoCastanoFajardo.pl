EJERCICIO 1

HECHOS

% Padres de Homero
padre(abraham, homero).
madre(mona, homero).

% Padres de Herbert
padre(abraham, herbert).

% Padres de Marge, Patty y Selma
padre(clancy, marge).
madre(jacqueline, marge).

padre(clancy, patty).
madre(jacqueline, patty).

padre(clancy, selma).
madre(jacqueline, selma).

% Padres de Bart, Lisa y Maggie
padre(homero, bart).
madre(marge, bart).

padre(homero, lisa).
madre(marge, lisa).

padre(homero, maggie).
madre(marge, maggie).

% Madre de Ling
madre(selma, ling).

REGLAS

hijo(X, Y) :- padre(Y, X).
hijo(X, Y) :- madre(Y, X).

hermano(X, Y) :-
    padre(P, X), padre(P, Y),
    madre(M, X), madre(M, Y),
    X \= Y.

abuelo(X, Y) :-
    padre(X, Z),
    padre(Z, Y).

abuelo(X, Y) :-
    padre(X, Z),
    madre(Z, Y).

abuela(X, Y) :-
    madre(X, Z),
    padre(Z, Y).

abuela(X, Y) :-
    madre(X, Z),
    madre(Z, Y).

tio(X, Y) :-
    hermano(X, Z),
    padre(Z, Y).

tio(X, Y) :-
    hermano(X, Z),
    madre(Z, Y).

primo(X, Y) :-
    padre(A, X),
    padre(B, Y),
    hermano(A, B).

primo(X, Y) :-
    madre(A, X),
    madre(B, Y),
    hermano(A, B).

EJEMPLOS

abuelo(abraham, bart).
hermano(lisa, bart).
tio(patty, bart).
primo(ling, bart).


EJERCICIO 2

HECHOS

% Nacionalidad
estadounidense(west).

% País
nacion(corea_del_sur).

% Enemistad
enemigo(corea_del_sur, estados_unidos).

% Misiles que posee Corea del Sur
tiene(corea_del_sur, m1).
misil(m1).

% Venta
vendio(west, m1, corea_del_sur).

REGLAS

hostil(X) :-
nacion(X),
enemigo(X, estados_unidos).

crimen(X) :-
estadounidense(X),
vendio(X, Arma, Pais),
arma(Arma),
hostil(Pais).

arma(X) :-
misil(X).

criminal(X) :-
crimen(X).

CONSULTA

?- criminal(west).
