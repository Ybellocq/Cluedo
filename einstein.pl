est_a_droite_de(X, Y) :- X is Y+1.
est_a_gauche_de(X, Y) :- est_a_droite_de(Y, X).

est_a_cote_de(X, Y) :- est_a_droite_de(X, Y).
next_to(X, Y) :- est_a_gauche_de(X, Y).

solution(Houses, FishOwner) :-
    lenght(Houses, 5),

