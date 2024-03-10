maisons([
    maison(_,_,_,_,_) ,
    maison(_,_,_,_,_) ,
    maison(_,_,_,_,_) ,
    maison(_,_,_,_,_) ,
    maison(_,_,_,_,_)
]).
% maison(couleur, nationalite, boisson, cigare, animal).
maison(rouge, anglais, _, _, _).
maison(_, suedois, _, _, chien).
maison(_, danois, the, _, _).
maison(verte, _, cafe, _, _).
maison(_, _, _, pall_mall, oiseaux).
maison(jaune, _, _, dunhill, _).
maison(_, _, lait, _, _).
maison(_, norvegien, _, _, _).
maison(_, _, _, blend, chats).
maison(_, _, _, dunhill, cheval).
maison(_, _, biere, blue_master, _).
maison(_, allemand, _, prince, _).
maison(bleue, _, _, _, _).
maison(_, _, eau, _, _).
maison(_, _, poisson, _, _).
afficher_liste([]).
afficher_liste([Maison|Reste]) :- writeln(Maison), afficher_liste(Reste).
appartient_a(X,[X|_]).
appartient_a(X,[_|L]) :- appartient_a(X,L).
est_a_gauche_de(A, B, [A, B|_]).
est_a_gauche_de(A, B, [_|Y]) :- est_a_gauche_de(A, B, Y).
est_a_côte_de(A, B, [A, B|_]).
est_a_côte_de(A, B, [B, A|_]).
est_a_côte_de(A, B, [_|Y]) :- est_a_côte_de(A, B, Y).
resoudre :-
    maisons(MAISONS),
    appartient_a(maison(rouge, anglais, _, _, _), MAISONS),
    appartient_a(maison(_, suedois, _, _, chien), MAISONS),
    appartient_a(maison(_, danois, the, _, _), MAISONS),
    est_a_gauche_de(maison(verte, _, cafe, _, _), maison(blanche, _, _, _, _), MAISONS),
    appartient_a(maison(verte, _, cafe, _, _), MAISONS),
    appartient_a(maison(_, _, _, pall_mall, oiseaux), MAISONS),
    appartient_a(maison(jaune, _, _, dunhill, _), MAISONS),
    MAISONS = [_, _, maison(_, _, lait, _, _), _, _],
    MAISONS = [maison(_, norvegien, _, _, _)|_],
    est_a_côte_de(maison(_, _, _, blend, _), maison(_, _, chats, _, _), MAISONS),
    est_a_côte_de(maison(_, _, dunhill, _, cheval), maison(_, _, _, _, dunhill), MAISONS),
    appartient_a(maison(_, _, biere, blue_master, _), MAISONS),
    appartient_a(maison(_, allemand, _, prince, _), MAISONS),
    est_a_côte_de(maison(_, norvegien, _, _, _), maison(bleue, _, _, _, _), MAISONS),
    est_a_côte_de(maison(_, _, _, blend, _), maison(_, _, _, eau, _), MAISONS),
    appartient_a(maison(_, _, poisson, _, _), MAISONS),
    afficher_liste(MAISONS).
%- L’Anglais vit dans la maison rouge.
%- Le Suedois a des chiens.
%- Le Danois boit du the.
%- La maison verte est a gauche de la maison blanche.
%- Le proprietaire de la maison verte boit du cafe.
%- La personne qui fume des Pall Mall a des oiseaux.
%- Le proprietaire de la maison jaune fume des Dunhill.
%- La personne qui vit dans la maison du centre boit du lait.
%- Le Norvegien habite dans la première maison.
%- L’homme qui fume des Blend vit a côte de celui qui a des chats.
%- L’homme qui a un cheval est le voisin de celui qui fume des Dunhill.
%- Le proprietaire qui fume des Blue Master boit de la bière.
%- L’Allemand fume des prince.
%- Le Norvegien vit juste a côte de la maison bleue.
%- L’homme qui fume des Blend a un voisin qui boit de l’eau.