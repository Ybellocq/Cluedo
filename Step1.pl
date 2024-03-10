% cluedo rush solo dimanche 10/03/2024
% /1 ou /2 est le prédicat autrement dit le nombre d'argument.
% :- a gauche est une condition appelé la tête de la règle, contient l'argument principal que l'on veut définir.
% :- a droite est appelé le corps de la règle, contient les conditions ou les arguments qui doivent être vrai.
% discontiguous est une directive Prolog pour indiquer les clauses de ces prédicats qui ne sont pas contiguës.

:- discontiguous mari_de/2.
:- discontiguous femme_de/2.
:- discontiguous beaupere_de/2.
:- discontiguous bellemere_de/2.


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


mari_de(X, Y) :- homme(X), femme(Y), mari_de(Y, X).

femme_de(X, Y) :- femme(Y), homme(X), mari_de(X, Y).

beaupere_de(X, Y) :- homme(X), mari_de(X, Z), enfant_de(Y, Z).

bellemere_de(X, Y) :- femme(X), femme_de(X, Z), enfant_de(Y, Z).
