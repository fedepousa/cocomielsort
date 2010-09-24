hombre(platon).
hombre(socrates).
hombre(X) :- X = doc.

% Arranca el TP!!!!!!!

% Ejercicio 1
% esLista(+X)

esLista([]).
esLista([_ | _]).


% Ejercicio 2

% literal(+E, -A)
literal(Xs, A) :- esLista(Xs), member(A, Xs).
literal(choice(E, _), A) :- literal(E, A).
literal(choice(_, F), A) :- literal(F, A).
literal(concat(E, _), A) :- literal(E, A).
literal(concat(_, F), A) :- literal(F, A).
literal(rep(E), A) :- literal(E, A).

% Ejemplos
% literal(choice(choice([a],[a,b]), [a,b,a]),A).


% literales(+E, -Sigma)
literales(E, Sigma) :- setof(X, literal(E,X),Sigma).

% Ejemplos
% literales(choice(choice([a],[a,b]), [a,b,a]),Sigma).


% Ejercicio 3


vacia([]).

% match(+E, +Palabra)
match(Xs, P) :- esLista(Xs), P = Xs.
match(choice(E, _), P) :- match(E, P).
match(choice(E, F), P) :- not(match(E, P)), match(F, P).
% match(concat(E, F), P) :- match(E, P, _, T), match(F, T).
% la de arriba es la primera implementacion, la reemplazamos por la de abajo.
match(concat(E, F), P) :- append(A,B, P), match(A, E), match(B, F).
match(rep(E), P) :- match(rep(E), P, _, Tail), vacia(Tail).  


% match(+E, +S, -Matched, -Tail)
match(Xs, S, Xs, T) :- esLista(Xs), append(Xs, T, S).
match(choice(E, _), S, M, T) :- match(E, S, M, T). 
match(choice(_, F), S, M, T) :- match(F, S, M, T). 
match(concat(E, F), S, M, T) :- match(E, S, CasiM, Tail), match(F, Tail, CasiMDos, T), append(CasiM, CasiMDos, M). 
match(rep(E), S, S, []) :- match(E,S).
match(rep(E), S, M, T) :- not(match(E,S)), match(E, S, CasiM, Tail), match(rep(E), Tail, CasiMDos, T), append(CasiM, CasiMDos, M). 

% Ejemplos
% match(rep(concat([a], choice([a], [b]))), [a, b]).


% Ejercicio 4

% instanciarConPre(+Xs, +Ys, ?Y) es verdadero cando Y es una lista con
% alguno de los elementos de Xs seguido de Ys.
instanciarConPre([X | _] , Y, [ X | Y ]) :- esLista(Y).
instanciarConPre([_ | Xs] , Y, P) :- esLista(Y), instanciarConPre(Xs, Y, P).


% palabrasExacto(+K, +Sigma, -P)

palabrasExacto(0, _, []).
palabrasExacto(K, [], []) :- K \= 0. 
palabrasExacto(K, [X | Xs], P) :- K > 0, AntK is K-1, palabrasExacto(AntK, [X | Xs], CasiP), instanciarConPre([X | Xs], CasiP, P). 

% palabrasHasta(+K, +Sigma, -P)
palabrasHasta(0, Sigma, P) :- palabrasExacto(0, Sigma, P).
palabrasHasta(K, Sigma, P) :- K > 0, palabrasExacto(K, Sigma, P).
palabrasHasta(K, Sigma, P) :- K > 0, AntK is K-1, palabrasHasta(AntK, Sigma, P).


% Ejercicio 5

% lenguajeSimpleHasta(+K, +E, -P)
% Hay que preguntar si el 4 tiene que devolver una lista con todas las palabras o si tiene que ir listando de a una, porque asi queda
% consistente con lo que pide en el 5 para hacer generate and test

lenguajeSimpleHasta(K, E, P) :- literales(E, Sigma), palabrasHasta(K, Sigma, P), match(E, P).

% Ejemplos
% lenguajeSimpleHasta(3,choice(choice([a],[a,b]), [a,b,a]),P).
% literales(choice(choice([a],[a,b]), [a,b,a]),Sigma).





% Ejercicio 6

% longitud(?K, +E) dada una lista E, longitud(K, E) es verdadero 
% cuando K es la longitud de la lista.
longitud(0, []).
longitud(K, [_ | Xs]) :- longitud(AntK, Xs), K is AntK+1.


% matchExacto(+K, +E,-P) enumero todas las palabras de longitud K
% que pertenecen a L(E), aprovechando la estructura de E.

matchExacto(K, E, P ) :- esLista(E), longitud(K, E), P = E.
matchExacto(K, choice(E,_), P ) :- matchExacto(K, E, P).
matchExacto(K, choice(_,F), P ) :- matchExacto(K, F, P).
matchExacto(K, concat(E,F), P ) :-  between(1, K, Ke),
                                    matchExacto(Ke, E, PrimerP),
                                    Kf is K - Ke,
                                    matchExacto(Kf, F, SegundoP),
                                    append(PrimerP,SegundoP,P).
matchExacto(K, rep(E), P ) :-   between(1, K, Ke),
                                matchExacto(Ke, E, PrimerP),
                                Kf is K - Ke,
                                matchExacto(Kf, rep(E), SegundoP),
                                append(PrimerP, SegundoP, P).
matchExacto(K, rep(E), P ) :-   matchExacto(K, E, P).
% matchExacto(3,concat(choice([a,a],[b]),choice(choice([a],[a,b]), [a,b,a])),P).
