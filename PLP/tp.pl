
% Tp Programacion logica
% Grupo: Cocomiel Sort
% Segundo Cuatrimestre 2010

%%%%%%%%%% Ejercicio 1
% esLista(+X)

esLista([]).
esLista([_ | Xs]) :- esLista(Xs).


%%%%%%%%%% Ejercicio 2

% literal(+E, -A)
% Si la expresion regular es una lista, se fija si es miembro de la lista. 
% Si no, busca recursivamente en las expresiones regulares.
% Devuelve repetidos, que seran filtrados luego en la definicion de literales.

literal(Xs, A) :- esLista(Xs), member(A, Xs).
literal(choice(E, _), A) :- literal(E, A).
literal(choice(_, F), A) :- literal(F, A).
literal(concat(E, _), A) :- literal(E, A).
literal(concat(_, F), A) :- literal(F, A).
literal(rep1(E), A) :- literal(E, A).

% Ejemplos
% literal(choice(choice([a],[a,b]), [a,b,a]),A).
% A = a;
% A = a;
% A = b;
% A = a;
% A = b;
% A = a;


% literales(+E, -Sigma)
% Instancia en sigma el conjunto de X que cumplen con literal.

literales(E, Sigma) :- setof(X, literal(E,X),Sigma).

% Ejemplos
% literales(choice(choice([a],[a,b]), [a,b,a]),Sigma).
% A = [a,b].
% literales(concat([a,b,c,d,b], choice([a], [g])), Sigma).
% Sigma = [a, b, c, d, g].


%%%%%%%%% Ejercicio 3

% Predicado auxiliar para ver si una lista es vacia.
vacia([]).

% match(E, P) :- matchConGrupos(E, P).
% No estoy seguro sobre esto, el enunciado del tp dice que
% se evaluara "Reuso de predicados previamente definidos".
% El matchConGrupos no esta previamente definido, pero hace lo mismo,
% por ahi no entendi bien e implemente mal el matchConGrupos.



% match(+E, +Palabra)
% Este predicado dice si una palabra es parte del lenguaje dado por una expresion regular
% En el caso de que la ER sea una lista, solamente se fija si es la misma lista.
% En el caso de que la ER sea un choice se fija si matchea con alguna de las dos opciones.
% En el caso de que la ER sea un concat, se usa la reversibilidad de append para ir devolvido los prefijos y sufijos de
% la palabra y viendo si el prefijo matchea con la primer ER del concat, y el sufijo con la segunda ER.
% En el caso de que la ER sea un rep, se usa el predicado match/4 para resolverlo.


match(Xs, P) :- esLista(Xs), P = Xs.
match(choice(E, _), P) :- match(E, P).
match(choice(E, F), P) :- not(match(E, P)), match(F, P).
% match(concat(E, F), P) :- match(E, P, _, T), match(F, T).
% la de arriba es la primera implementacion, la reemplazamos por la de abajo.
match(concat(E, F), P) :- append(A,B, P), match( E, A), match( F, B).
match(rep1(E), P) :- match(rep1(E), P, _, Tail), vacia(Tail).  


% match(+E, +S, -Matched, -Tail)
% Dada una ER y una palabra S, instancia Matched en un prefijo que de S que este en E, y luego instancia Tail en lo que le falta
% a Matched para ser S.
% Si la ER es una lista, la unica opcion es matchear con la lista.
% Si la ER es un choice, sirve matchear con cualquiera de las dos opciones.
% Si la ER es un concat, Instancia un pedazo de Matched en la primera ER y lo restante en la segunda ER.
% Si la ER es un rep1(E), o bien la palabra entera ya esta en E, o sino un pedacito esta en E y se busca lo que falta en rep1(E), ya que es infinito.

match(Xs, S, Xs, T) :- esLista(Xs), append(Xs, T, S).
match(choice(E, _), S, M, T) :- match(E, S, M, T). 
match(choice(_, F), S, M, T) :- match(F, S, M, T). 
match(concat(E, F), S, M, T) :- match(E, S, CasiM, Tail), match(F, Tail, CasiMDos, T), append(CasiM, CasiMDos, M). 
match(rep1(E), S, S, []) :- match(E,S).
match(rep1(E), S, M, T) :- not(match(E,S)), match(E, S, CasiM, Tail), match(rep1(E), Tail, CasiMDos, T), append(CasiM, CasiMDos, M). 


% Ejemplos Match/4
% match(concat([a,b], [c]), [a,b,c,d], M, T).
% M = [a, b, c],
% T = [d].






% Ejemplos
% match(rep1(concat([a], choice([a], [b]))), [a, b]).
% true.
% match(concat(rep1([a]), [b]), [b]).
% false.
% match(concat(rep1([a]), [b]), [a, b]).
% true.
% match(concat(rep1([a]), [b]), [a, a, b]).
% true.
% match(concat(rep1([a]), [b]), [a, a, b, b]).
% false.





%%%%%%%%%% Ejercicio 4

% instanciarConPre(+Xs, +Ys, ?Y) es verdadero cuando Y es una lista con
% alguno de los elementos de Xs seguido de Ys.
instanciarConPre([X | _] , Y, [ X | Y ]) :- esLista(Y).
instanciarConPre([_ | Xs] , Y, P) :- esLista(Y), instanciarConPre(Xs, Y, P).


% palabrasExacto(+K, +Sigma, -P)
% Va instanciando en P en cada una de las palabras de longitud K formadas mediante los literales dados en Sigma.
% Cuando la longitud es 0 solo devuelve la lista vacia.
% Cuando la lista de literales es vacia, tambien se devuelve una lista vacia.
% En el caso general, se va instanciado en CasiP las palabras de longitud k-1 y luego se le va adhiriendo adelante todos los literales
% diferentes

palabrasExacto(0, _, []).
palabrasExacto(K, [], []) :- K \= 0. 
palabrasExacto(K, [X | Xs], P) :- K > 0, AntK is K-1, palabrasExacto(AntK, [X | Xs], CasiP), instanciarConPre([X | Xs], CasiP, P). 

% palabrasHasta(+K, +Sigma, -P)
% Devuelve las palabras que se forman con los literales de Sigma de longitud 1 hasta K.
% Se utiliza palabrasExacto/3 para ir instanciado las de longitud K, y luego se baja la longitud en uno y se sigue.
palabrasHasta(0, Sigma, P) :- palabrasExacto(0, Sigma, P).
palabrasHasta(K, Sigma, P) :- K > 0, palabrasExacto(K, Sigma, P).
palabrasHasta(K, Sigma, P) :- K > 0, AntK is K-1, palabrasHasta(AntK, Sigma, P).


% Ejemplos palabrasExacto/3
% palabrasExacto(3, [a,b], P).
% P = [a, a, a] ;
% P = [b, a, a] ;
% P = [a, b, a] ;
% P = [b, b, a] ;
% P = [a, a, b] ;
% P = [b, a, b] ;
% P = [a, b, b] ;
% P = [b, b, b] ;
% false.

% palabrasExacto(2, [a,c], P).
% P = [a, a] ;
% P = [c, a] ;
% P = [a, c] ;
% P = [c, c] ;
% false.


% Ejemplos palabrasHasta/3
% palabrasHasta(2, [a,c], P).
% P = [a, a] ;
% P = [c, a] ;
% P = [a, c] ;
% P = [c, c] ;
% P = [a] ;
% P = [c] ;
% P = [] ;
% false.

% palabrasHasta(3, [a], P).
% P = [a, a, a] ;
% P = [a, a] ;
% P = [a] ;
% P = [] ;
% false.





%%%%%%%%% Ejercicio 5

% lenguajeSimpleHasta(+K, +E, -P)
% Se hace mediante la tecnica Generate & Test, se van generando las palabras candidatas y luego se testea si pertenecen
% al lenguaje generado por la expresion regular dada.

lenguajeSimpleHasta(K, E, P) :- literales(E, Sigma), palabrasHasta(K, Sigma, P), match(E, P).

% Ejemplos
% lenguajeSimpleHasta(3, concat(rep1(choice([a], [b])), [c]), P).
% P = [a, a, c] ;
% P = [b, a, c] ;
% P = [a, b, c] ;
% P = [b, b, c] ;
% P = [a, c] ;
% P = [b, c] ;
% false.

% lenguajeSimpleHasta(7, rep1(concat([a], [b])), P).
% P = [a, b, a, b, a, b] ;
% P = [a, b, a, b] ;
% P = [a, b] ;
% false.






%%%%%%%%%% Ejercicio 6

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
% P = [b, a, b] ;
% P = [a, a, a] ;
% false.


% lenguajeInteligenteHasta (+K,+E,−P)
% Simplemente va instanciando los numeros entre 1 y K y va utilizando la definicion de matchExacto para instanciar las palabras.

lenguajeInteligenteHasta(K,E,P) :- between(1, K, Ke), matchExacto(Ke, E, P).


% lenguajeInteligenteHasta(3,concat(choice([a,a],[b]),choice(choice([a],[a,b]), [a,b,a])),P).
% P = [b, a] ;
% P = [b, a, b] ;
% P = [a, a, a] ;
% false.



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Segunda parte  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%% Ejercicio 7

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
% matchConGrupos(concat([n,o,m,b,r,e,:] , group(X, rep1(choice([a], [b])))), [n, o, m, b, r, e, :, b, a, b, a]).
% X = [b, a, b, a] ;
% false.

% matchConGrupos(concat(group(X,rep1([a])) ,rep1([a])) ,[a,a,a,a]).
% X = [a] ;
% X = [a, a] ;
% X = [a, a, a] ;
% false.




%%%%%%%%%%%%%%% Ejercicio 8
% incluidoHasta (+K,+E1,+E2) que sea verdadero si todas las palabras de longitud entre 1 y K que
% pertenecen a L(E1), tambien pertenecen a L(E2). 
% Este predicado se hizo bien si hay diferencia entre lo que genera E1 y lo que genera E2, con todas las palabras de longitud
% hasta K.

incluidoHasta(K,E1,E2) :- not(hayDiferenciaHasta(K, E1, E2)).



% Ejemplos
% incluidoHasta(2, choice( choice([a],[a,b]), [a,b,c] ), choice([a], [a,b])).
% true.
% incluidoHasta(3, choice( choice([a],[a,b]), [a,b,c] ), choice([a], [a,b])).
% false.
% El primer lenguaje esta incluido en el segundo hasta longitud dos, pero no mas.

% incluidoHasta(5, choice([a,b,b,b,c], [a,a,a,b,c]),concat(rep1([a]), concat(rep1([b]), rep1([c])))).
% true.
% incluidoHasta(4, choice([a,b,b,b,c], [a,a,a,b,c]),concat(rep1([a]), concat(rep1([b]), rep1([c])))).
% true.
% incluidoHasta(6, choice([a,b,b,b,c], [a,a,a,b,c]),concat(rep1([a]), concat(rep1([b]), rep1([c])))).
% true.
% El primer lenguaje esta incluido en el segundo hasta cualquier longitud.



% hayDiferenciaHasta(+K,+E1,+E2) que sea verdadero si existe alguna
% palabra de longitud entre 1 y K que pertenezca a L(E1) y no a L(E2).
% Este predicado tambien se hizo con la estrategia Generate and Test, se van generando las palabras pertenencientes al
% lenguaje generado por E1 y se va testeando si no esta en el lenguaje generado por E2.

hayDiferenciaHasta(K, E1, E2) :- lenguajeInteligenteHasta(K,E1,P), not(match(E2, P)).

% Ejemplos
% hayDiferenciaHasta( 2, choice( [a,b], [c,c,c]), concat([a],[b])).
% false.
% hayDiferenciaHasta( 3, choice( [a,b], [c,c,c]), concat([a],[b])).
% true.
% "ab" esta en el segundo lenguajes, mientras que "ccc" no, por lo tanto 
% no hay diferencia hasta 2, pero si hasta 3.


%%%%%%%%%%%%%% Ejercicio 9
% igualesHasta(+K,+E1,+E2)
% Dos lenguajes son iguales si uno esta incluido en el otro y viceversa. De esta forma esta implementando el predicado
% reutilizando lo anterior


igualesHasta(K,E1,E2) :- incluidoHasta(K, E1, E2), incluidoHasta(K, E2, E1).


% Ejemplos
% igualesHasta(9, concat(choice([a],choice([a,a], choice([a,a,a], choice([a,a,a,a], choice([a,a,a,a,a], choice([a,a,a,a,a,a], [a,a,a,a,a,a,a])))))), [b,c]), concat(rep1([a]), concat([b],[c]))).
% true.
% igualesHasta(10, concat(choice([a],choice([a,a], choice([a,a,a], choice([a,a,a,a], choice([a,a,a,a,a], choice([a,a,a,a,a,a], [a,a,a,a,a,a,a])))))), [b,c]), concat(rep1([a]), concat([b],[c]))).
% false.
% Son iguales hasta el nueve ya que el primer lenguaje es concatenacion de hasta 7 'a' con "bc".
