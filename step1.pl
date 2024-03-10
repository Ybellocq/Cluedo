% cluedo rush solo dimanche 10/03024
% le prédicat c'est le nom de la fonction et l'arité c'est le /n qui contient le nombre d'argument passé en parametre
% :- à gauche est une condition appelée la tête de la règle, contient l'argument principal que l'on veut définir.
% :- à droite est appelé le corps de la règle, contient les conditions ou les arguments qui doivent être vrai.
% discontiguous est une directive Prolog pour indiquer les clauses de ces prédicats qui ne sont pas contiguës.
% 
:- discontiguous mari_de/2.
:- discontiguous femme_de/2.
:- discontiguous beaupere_de/2.
:- discontiguous bellemere_de/2.
:- discontiguous ancetre_de/2.
:- discontiguous enfant_de/2.

homme(marc).
homme(luc).
homme(jean).
homme(jules).
homme(leon).
homme(loic).
homme(gerard).
homme(jacques).
homme(herve).
homme(paul).

femme(anne).
femme(betty).
femme(lisa).
femme(sylvie).
femme(eve).
femme(julie).
femme(valerie).

mari_de(anne, marc).
mari_de(betty, luc).
mari_de(lisa, jules).
mari_de(sylvie, leon).
mari_de(eve, loic).
mari_de(julie, paul).

femme_de(marc, anne).
femme_de(luc, betty).
femme_de(jules, lisa).
femme_de(leon, sylvie).
femme_de(loic, eve).
femme_de(paul, sylvie).

beaupere_de(jules, luc).
beaupere_de(leon, marc).
beaupere_de(paul, loic).
beaupere_de(marc, loic).

bellemere_de(lisa, anne).
bellemere_de(jules, betty).
bellemere_de(sylvie, anne).
bellemere_de(julie, eve).
bellemere_de(paul, sylvie).

enfant_de(anne, jean).
enfant_de(anne, jules).
enfant_de(anne, leon).
enfant_de(betty, lisa).
enfant_de(betty, loic).
enfant_de(betty, gerard).
enfant_de(lisa, jacques).
enfant_de(sylvie, herve).
enfant_de(sylvie, julie).
enfant_de(eve, paul).
enfant_de(eve, valerie).

parent_de(X, Y) :- enfant_de(Y, X).

beaupere_de(X, Y) :- enfant_de(Z, Y) , mari_de(X, Z) , homme(Y).

bellemere_de(X, Y) :- enfant_de(Z, Y) , femme_de(Z, X) , femme(Y).

enfant_de(X, Y) :- femme_de(X, Z) , enfant_de(Z, Y).

ancetre_de(X, Y) :- enfant_de(Y, X).

ancetre_de(X, Y) :- enfant_de(Y, Z) , ancetre_de(X, Z).
