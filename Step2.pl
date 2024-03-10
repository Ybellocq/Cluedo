maisons([
    maison(_,_,_,_,_) ,
    maison(_,_,_,_,_) ,
    maison(_,_,_,_,_) ,
    maison(_,_,_,_,_) ,
    maison(_,_,_,_,_)
]).

% maison(couleur, nationalité, boisson, cigare, animal).

% Les faits.
maison(rouge, anglais, _, _, _).
maison(_, suédois, _, _, chien).
maison(_, danois, thé, _, _).
maison(verte, _, café, _, _).
maison(_, _, _, pall_mall, oiseaux).
maison(jaune, _, _, dunhill, _).
maison(_, _, lait, _, _).
maison(_, norvégien, _, _, _).
maison(_, _, _, blend, chats).
maison(_, _, _, dunhill, cheval).
maison(_, _, bière, blue_master, _).
maison(_, allemand, _, prince, _).
maison(bleue, _, _, _, _).
maison(_, _, eau, _, _).
maison(_, _, poisson, _, _).

% Les règles.

% Afficher une liste.
afficher_liste([]).
afficher_liste([Maison|Reste]) :- writeln(Maison), afficher_liste(Reste).


appartient_à(X,[X|_]).
appartient_à(X,[_|L]) :- appartient_à(X,L).

% Vérifier si A est à gauche de B dans une liste.
est_à_gauche_de(A, B, [A, B|_]).
est_à_gauche_de(A, B, [_|Y]) :- est_à_gauche_de(A, B, Y).

% Vérifier si A est à côté de B dans une liste.
est_à_côté_de(A, B, [A, B|_]).
est_à_côté_de(A, B, [B, A|_]).
est_à_côté_de(A, B, [_|Y]) :- est_à_côté_de(A, B, Y).


resoudre :-
    maisons(MAISONS),
    appartient_à(maison(rouge, anglais, _, _, _), MAISONS),
    appartient_à(maison(_, suédois, _, _, chien), MAISONS),
    appartient_à(maison(_, danois, thé, _, _), MAISONS),
    est_à_gauche_de(maison(verte, _, café, _, _), maison(blanche, _, _, _, _), MAISONS),
    appartient_à(maison(verte, _, café, _, _), MAISONS),
    appartient_à(maison(_, _, _, pall_mall, oiseaux), MAISONS),
    appartient_à(maison(jaune, _, _, dunhill, _), MAISONS),
    MAISONS = [_, _, maison(_, _, lait, _, _), _, _],
    MAISONS = [maison(_, norvégien, _, _, _)|_],
    est_à_côté_de(maison(_, _, _, blend, _), maison(_, _, chats, _, _), MAISONS),
    est_à_côté_de(maison(_, _, dunhill, _, cheval), maison(_, _, _, _, dunhill), MAISONS),
    appartient_à(maison(_, _, bière, blue_master, _), MAISONS),
    appartient_à(maison(_, allemand, _, prince, _), MAISONS),
    est_à_côté_de(maison(_, norvégien, _, _, _), maison(bleue, _, _, _, _), MAISONS),
    est_à_côté_de(maison(_, _, _, blend, _), maison(_, _, _, eau, _), MAISONS),

    appartient_à(maison(_, _, poisson, _, _), MAISONS),

    afficher_liste(MAISONS).



%- L’Anglais vit dans la maison rouge.
%- Le Suédois a des chiens.
%- Le Danois boit du thé.
%- La maison verte est à gauche de la maison blanche.
%- Le propriétaire de la maison verte boit du café.
%- La personne qui fume des Pall Mall a des oiseaux.
%- Le propriétaire de la maison jaune fume des Dunhill.
%- La personne qui vit dans la maison du centre boit du lait.
%- Le Norvégien habite dans la première maison.
%- L’homme qui fume des Blend vit à côté de celui qui a des chats.
%- L’homme qui a un cheval est le voisin de celui qui fume des Dunhill.
%- Le propriétaire qui fume des Blue Master boit de la bière.
%- L’Allemand fume des prince.
%- Le Norvégien vit juste à côté de la maison bleue.
%- L’homme qui fume des Blend a un voisin qui boit de l’eau.