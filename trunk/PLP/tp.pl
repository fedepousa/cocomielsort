hombre(platon).
hombre(socrates).
hombre(X) :- X = doc.

% Arranca el TP!!!!!!!

% Ejercicio 1

esLista([]).
esLista([X | Xs]) :- esLista(Xs).


% Ejercicio 2
% No usamos literal

literal(Xs, A) :- esLista(Xs), member(A, Xs).
literal(choice(E, F), A) :- literal(E, A).
literal(choice(E, F), A) :- literal(F, A).
literal(concat(E, F), A) :- literal(E, A).
literal(concat(E, F), A) :- literal(F, A).
literal(rep(E), A) :- literal(E, A).



literales2([], []).
literales2([X | Xs], Ls) :- literales2(Xs, CasiLs), append([X], CasiLs, Ls).
literales2(choice(E, F), Ls) :- literales2(E, CasiLs), literales2(F, CasiLss), append(CasiLs, CasiLss, Ls).
literales2(concat(E, F), Ls) :- literales2(E, CasiLs), literales2(F, CasiLss), append(CasiLs, CasiLss, Ls).
literales2(rep(E), Ls) :- literales2(E, Ls).

literales(E, Sigma) :- literales2(E, CasiSigma), filtrarRepetidos(CasiSigma, Sigma).

filtrarRepetidos([], []).
filtrarRepetidos([X | Xs], Ls) :- member(X, Xs), filtrarRepetidos(Xs, Ls).
filtrarRepetidos([X | Xs], Ls) :- not(member(X, Xs)), filtrarRepetidos(Xs, CasiLs), append([X], CasiLs, Ls).


% Ejercicio 3


vacia([]).

match(Xs, P) :- esLista(Xs), P = Xs.
match(choice(E, F), P) :- match(E, P).
match(choice(E, F), P) :- not(match(E, P)), match(F, P).
match(concat(E, F), P) :- match(E, P, M, T), match(F, T).
match(rep(E), P) :- match(rep(E), P, CasiP, Tail), vacia(Tail).  


match(Xs, S, Xs, T) :- esLista(Xs), append(Xs, T, S).
match(choice(E, F), S, M, T) :- match(E, S, M, T). 
match(choice(E, F), S, M, T) :- match(F, S, M, T). 
match(concat(E, F), S, M, T) :- match(E, S, CasiM, Tail), match(F, Tail, CasiMDos, T), append(CasiM, CasiMDos, M). 
match(rep(E), S, S, []) :- match(E,S).
match(rep(E), S, M, T) :- not(match(E,S)), match(E, S, CasiM, Tail), match(rep(E), Tail, CasiMDos, T), append(CasiM, CasiMDos, M). 

% match(rep(concat([a], choice([a], [b]))), [a, b]).


% Ejercicio 4


agregarPre(X, [],[]).
agregarPre(X, [Y], [[X|Y]]) :- esLista(Y).
agregarPre(X, [Y|Ys], Ls) :- not(vacia(Ys)), agregarPre(X, Ys, CasiLs), append([X], Y, Aux), append([Aux], CasiLs, Ls).

agregarPreLista([], P, P).
agregarPreLista([X], Ls, P) :- agregarPre(X, Ls, P).
agregarPreLista([X | [Y | Xs]], Ls, P) :- agregarPreLista([Y | Xs], Ls, CasiP), agregarPre(X, Ls, OtroP), append(CasiP, OtroP, P). 

palabrasExacto(0, Sigma, []).
palabrasExacto(1, [X | Xs], P) :- palabrasExacto(1, Xs, CasiP), append([[X]], CasiP, P).
palabrasExacto(K, [], []) :- K \= 0. 
palabrasExacto(K, [X | Xs], P) :- K > 1, AntK is K-1, palabrasExacto(AntK, [X | Xs], CasiP), agregarPreLista([X | Xs], CasiP, P). 

palabrasHasta(1, Sigma, P) :- palabrasExacto(1, Sigma, P).
palabrasHasta(K, Sigma, P) :- K > 1, palabrasExacto(K, Sigma, CasiP), AntK is K-1, palabrasHasta(AntK, Sigma, AuxP), append(CasiP, AuxP, P).


% Ejercicio 5









