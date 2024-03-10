%rive droite
rivedroite([PEON ,LOUP, CHOU, CHEVRE]).
%rive gauche
rivegauche([SANSPEON, SANSLOUP, SANSCHOU, SANSCHEVRE]).
% changement
cross(A, B).
cross(B, A).
% move
move(rivedroite, 1, rivegauche) :-  cross(PEON, SANSPEON),
                                    cross(LOUP, SANSLOUP).
move(rivedroite, 2, rivegauche) :-  cross(PEON, SANSPEON),
                                    cross(CHOU, SANSCHOU).
move(rivedroite, 3, rivegauche) :-  cross(PEON, SANSPEON),
                                    cross(CHEVRE, SANSCHEVRE).
move(rivedroite, 4, rivegauche) :-  cross(PEON, SANSPEON).
% Verification de possiblibite
tests(X, X, _).
tests(X, _, X).
viable([PEON, LOUP, CHEVRE, CHOU]) :-   tests(PEON, CHEVRE, LOUP),
                                        tests(PEON, CHEVRE, CHOU).









