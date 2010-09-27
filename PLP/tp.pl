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
literal(rep1(E), A) :- literal(E, A).

% Ejemplos
% literal(choice(choice([a],[a,b]), [a,b,a]),A).


% literales(+E, -Sigma)
literales(E, Sigma) :- setof(X, literal(E,X),Sigma).

% Ejemplos
% literales(choice(choice([a],[a,b]), [a,b,a]),Sigma).


% Ejercicio 3


vacia([]).

% match(E, P) :- matchConGrupos(E, P).
% No estoy seguro sobre esto, el enunciado del tp dice que
% se evaluara "Reuso de predicados previamente definidos".
% El matchConGrupos no esta previamente definido, pero hace lo mismo,
% por ahi no entendi bien e implemente mal el matchConGrupos.



% match(+E, +Palabra)
match(Xs, P) :- esLista(Xs), P = Xs.
match(choice(E, _), P) :- match(E, P).
match(choice(E, F), P) :- not(match(E, P)), match(F, P).
% match(concat(E, F), P) :- match(E, P, _, T), match(F, T).
% la de arriba es la primera implementacion, la reemplazamos por la de abajo.
match(concat(E, F), P) :- append(A,B, P), match( E, A), match( F, B).
match(rep1(E), P) :- match(rep1(E), P, _, Tail), vacia(Tail).  


% match(+E, +S, -Matched, -Tail)
match(Xs, S, Xs, T) :- esLista(Xs), append(Xs, T, S).
match(choice(E, _), S, M, T) :- match(E, S, M, T). 
match(choice(_, F), S, M, T) :- match(F, S, M, T). 
match(concat(E, F), S, M, T) :- match(E, S, CasiM, Tail), match(F, Tail, CasiMDos, T), append(CasiM, CasiMDos, M). 
match(rep1(E), S, S, []) :- match(E,S).
match(rep1(E), S, M, T) :- not(match(E,S)), match(E, S, CasiM, Tail), match(rep1(E), Tail, CasiMDos, T), append(CasiM, CasiMDos, M). 

% Ejemplos
% match(rep1(concat([a], choice([a], [b]))), [a, b]).


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
matchExacto(K, rep1(E), P ) :-   between(1, K, Ke),
                                matchExacto(Ke, E, PrimerP),
                                Kf is K - Ke,
                                matchExacto(Kf, rep1(E), SegundoP),
                                append(PrimerP, SegundoP, P).
matchExacto(K, rep1(E), P ) :-   matchExacto(K, E, P).
% matchExacto(3,concat(choice([a,a],[b]),choice(choice([a],[a,b]), [a,b,a])),P).


% lenguajeInteligenteHasta (+K,+E,−P) 

lenguajeInteligenteHasta(K,E,P) :- between(1, K, Ke), matchExacto(Ke, E, P).


% lenguajeInteligenteHasta(3,concat(choice([a,a],[b]),choice(choice([a],[a,b]), [a,b,a])),P).


% Segunda parte

% Ejercicio 7

% matchConGrupos(+E,?Palabra) 
matchConGrupos(group(X,E),P) :- matchConGrupos(E, P), var(X), X = P. % no estoy seguro si hay que instanciarlo con P o con que.
matchConGrupos(group(X,E),P) :- matchConGrupos(E, P), nonvar(X). % no estoy seguro si hay que instanciarlo con P o con que.
% matchConGrupos

matchConGrupos(Xs, P) :- esLista(Xs), P = Xs.
matchConGrupos(choice(E, _), P) :- matchConGrupos(E, P).
matchConGrupos(choice(E, F), P) :- not(matchConGrupos(E, P)), matchConGrupos(F, P).
matchConGrupos(concat(E, F), P) :- append(A,B, P), matchConGrupos( E, A), matchConGrupos( F, B).
matchConGrupos(rep1(E), P) :- matchConGrupos(rep1(E), P, _, Tail), vacia(Tail).  



% matchConGrupos(+E, +S, -Matched, -Tail)
matchConGrupos(group(X,E) , S, M, T) :- matchConGrupos(E, S, M, T), var(X), X = M.
matchConGrupos(group(X,E) , S, M, T) :- matchConGrupos(E, S, M, T), nonvar(X).
matchConGrupos(Xs, S, Xs, T) :- esLista(Xs), append(Xs, T, S).
matchConGrupos(choice(E, _), S, M, T) :- matchConGrupos(E, S, M, T). 
matchConGrupos(choice(_, F), S, M, T) :- matchConGrupos(F, S, M, T). 
matchConGrupos(concat(E, F), S, M, T) :- matchConGrupos(E, S, CasiM, Tail), matchConGrupos(F, Tail, CasiMDos, T), append(CasiM, CasiMDos, M). 
matchConGrupos(rep1(E), S, S, []) :- matchConGrupos(E,S).
matchConGrupos(rep1(E), S, M, T) :- not(matchConGrupos(E,S)), matchConGrupos(E, S, CasiM, Tail), matchConGrupos(rep1(E), Tail, CasiMDos, T), append(CasiM, CasiMDos, M). 

% Ejemplos
% matchConGrupos(concat(group(X,rep1([a])) ,rep1([a])) ,[a,a,a,a]).
% matchConGrupos(rep1(group(X, choice([a],[b]))) ,[a,b]).
% matchConGrupos(concat(group(X, choice([a,b,a],[c,d])), [a,b,a]), [c,d,a,b,a]).
% matchConGrupos(rep1(group([a], choice([a], [b]))), [b], M, T).



% Ejercicio 8
% incluidoHasta (+K,+E1,+E2) que sea verdadero si todas las palabras de longitud entre 1 y K que
% pertenecen a L(E1), tambien pertenecen a L(E2). 

incluidoHasta(K,E1,E2) :- not(hayDiferenciaHasta(K, E1, E2)).
% Ejemplos
% incluidoHasta(2, choice( choice([a],[a,b]), [a,b,c] ), choice([a], [a,b])).
% El primer lenguaje esta incluido en el segundo hasta longitud dos, pero no mas.

% incluidoHasta(5, choice([a,b,b,b,c], [a,a,a,b,c]),concat(rep1([a]), concat(rep1([b]), rep1([c])))).
% incluidoHasta(4, choice([a,b,b,b,c], [a,a,a,b,c]),concat(rep1([a]), concat(rep1([b]), rep1([c])))).
% incluidoHasta(6, choice([a,b,b,b,c], [a,a,a,b,c]),concat(rep1([a]), concat(rep1([b]), rep1([c])))).
% El primer lenguaje esta incluido en el segundo hasta cualquier longitud.



% hayDiferenciaHasta(+K,+E1,+E2) que sea verdadero si existe alguna
% palabra de longitud entre 1 y K que pertenezca a L(E1) y no a L(E2).


hayDiferenciaHasta(K, E1, E2) :- lenguajeInteligenteHasta(K,E1,P), not(match(E2, P)).

% Ejemplos
% hayDiferenciaHasta( 2, choice( [a,b], [c,c,c]), concat([a],[b])).
% hayDiferenciaHasta( 3, choice( [a,b], [c,c,c]), concat([a],[b])).
% "ab" esta en el segundo lenguajes, mientras que "ccc" no, por lo tanto 
% no hay diferencia hasta 2, pero si hasta 3.


% Ejercicio 9
% igualesHasta(+K,+E1,+E2)
igualesHasta(K,E1,E2) :- incluidoHasta(K, E1, E2), incluidoHasta(K, E2, E1).


% Ejemplos
% concat(choice([a],choice([a,a], choice([a,a,a], choice([a,a,a,a], choice([a,a,a,a,a], choice([a,a,a,a,a,a], [a,a,a,a,a,a,a])))))), [b,c])
% concat(rep1([a]), concat([b],[c]))
% igualesHasta(9, concat(choice([a],choice([a,a], choice([a,a,a], choice([a,a,a,a], choice([a,a,a,a,a], choice([a,a,a,a,a,a], [a,a,a,a,a,a,a])))))), [b,c]), concat(rep1([a]), concat([b],[c]))).
% Son iguales hasta el nueve ya que el primer lenguaje es concatenacion de hasta 7 'a' con "bc".
