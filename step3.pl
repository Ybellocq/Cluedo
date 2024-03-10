switch(gauche, droite).
switch(droite, gauche).
deplacement([X, Loup, X, Chou], chevre,[Y, Loup, Y, Chou]) :- switch(X, Y).
deplacement([X, X, Chevre, Chou], loup, [Y, Y, Chevre, Chou]) :- switch(X, Y).
deplacement([X, Loup, Chevre, X], chou,[Y, Loup, Chevre, Y]) :- switch(X, Y).
deplacement([X, Loup, Chevre, Chou], peon_seul, [Y, Loup, Chevre, Chou]) :-
	switch(X, Y).
tests(X, X, _).
tests(X, _, X).
viable([Peon, Loup, Chevre, Chou]) :- tests(Peon, Chevre, Loup),
	tests(Peon, Chevre, Chou).

etapes([droite, droite, droite, droite], []).
etapes(Berge, [Deplacement | ProchainDeplacements]) :-
	deplacement(Berge, Deplacement, ProchainMouvement),
	viable(ProchainMouvement),
	etapes(ProchainMouvement, ProchainDeplacements).

solution :- length(Deplacements,7),
	etapes([gauche, gauche, gauche, gauche], Deplacements),
	write(Deplacements), !.