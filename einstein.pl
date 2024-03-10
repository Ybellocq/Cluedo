est_a_droite_de(X, Y) :- X is Y+1.
est_a_gauche_de(X, Y) :- est_a_droite_de(Y, X).

est_a_cote_de(X, Y) :- est_a_droite_de(X, Y).
next_to(X, Y) :- est_a_gauche_de(X, Y).

solution(Houses, FishOwner) :-
	Houses=[
           maison(1, Nationality1, Color1, Pet1, Drinks1, Smokes1),
           maison(2, Nationality2, Color2, Pet2, Drinks2, Smokes2),
           maison(3, Nationality3, Color3, Pet3, Drinks3, Smokes3),
           maison(4, Nationality4, Color4, Pet4, Drinks4, Smokes4),
           maison(5, Nationality5, Color5, Pet5, Drinks5, Smokes5)],
    member(maison(_, rouge, anglais, _, _, _), Houses),
	member(maison(_, _, suedois, _, _, chien), Houses),
	member(maison(_, _, danois, the, _, _), Houses),
	member(est_a_gauche_de(maison(_, verte, _, cafe, _, _), maison(_, blanche, _, _, _, _)), Houses),
	member(maison(_, _, _, _, pall_mall, oiseaux), Houses),
	member(maison(_, jaune, _, _, dunhill, _), Houses),
	member(maison(3, _, _, lait, _, _), Houses),
	member(next_to(maison(1, _, norvegien, _, _, _), maison(2, bleue, _, _, _, _)), Houses),
	member(maison(_, _, _, _, blend, chats), Houses),
	member(maison(_, _, _, _, dunhill, cheval), Houses),
	member(maison(_, _, _, biere, blue_master, _), Houses),
	member(maison(_, _, allemand, _, prince, _), Houses),
	member(maison(2, bleue, _, _, _, _), Houses),
	member(next_to(maison(_, _, _, eau, _, _), maison(_, _, _, _, blend, chats)),Houses),
	maison(_, FishOwner, _, poisson, _, _), Houses.

