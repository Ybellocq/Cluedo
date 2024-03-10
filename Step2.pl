est_a_droite_de(X, Y) :- X is Y+1.
est_a_gauche_de(X, Y) :- est_a_droite_de(Y, X).

next_to(X, Y) :- est_a_droite_de(X, Y).
next_to(X, Y) :- est_a_gauche_de(X, Y).

solution(Houses, FishOwner) :-
	Houses = [
        maison(1, _, _, _, _, _),
        maison(2, _, _, _, _, _),
        maison(3, _, _, _, _, _),
        maison(4, _, _, _, _, _),
        maison(5, _, _, _, _, _)
    ],
    member(maison(_, anglais, rouge, _, _, _), Houses),
	member(maison(_, suedois, _, chien, _, _), Houses),
	member(maison(_, danois, _, _, the, _), Houses),
	member(maison(VE, _, verte, _, _, _), Houses),
	member(maison(BL, _, blanche, _, _, _), Houses),
	est_a_gauche_de(VE, BL),
	member(maison(_, _, verte, _, cafe, _), Houses),
	member(maison(_, _, _, oiseau, _, pall_hall), Houses),
	member(maison(DUN, _, jaune, _, _, dunhill), Houses),
	member(maison(3, _, _, _, lait, _), Houses),
	member(maison(1, norvegien, _, _, _, _), Houses),
	member(maison(BC, _, _, _, _, blend), Houses),
	member(maison(CAT, _, _, chat, _, _), Houses),
	next_to(BC, CAT),
	member(maison(CHEV, _, _, cheval, _, _), Houses),
	next_to(CHEV, DUN),
	member(maison(_, _, _, _, biere, blue_master), Houses),
	member(maison(_, allemand, _, _, _, prince), Houses),
	member(maison(2, _, bleu, _, _, _), Houses),
	member(maison(EAU, _, _, _, eau, _), Houses),
	next_to(BC, EAU),
	member(maison(_, FishOwner, _, poisson, _, _), Houses).


