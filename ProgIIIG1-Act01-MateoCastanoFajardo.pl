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
