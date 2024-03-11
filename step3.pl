% Définition de l'état initial
state_initial(state(e, e, e, e)). % Tous les éléments sont initialement sur la rive est
% Définition de l'état final
state_final(state(oe, oe, oe, oe)). % Tous les éléments sont finalement sur la rive oe

% Loup mange mouton
unsafe(state(e, oe, oe, _)).
unsafe(state(oe, e, e, _)).

% Mouton mange chou
unsafe(state(e, _, oe, oe)).
unsafe(state(oe, _, e, e)).

% cross Sides
cross(oe, e).
cross(e, oe).

% est-ce que le mouvement est valide
move(state(X, X, chevre, chou), state(Y, Y, chevre, chou)) :-
    cross(X, Y),
    \+unsafe(state(Y, Y, chevre, chou)).

move(state(X, loup, X, chou), state(Y, loup, Y, chou)) :-
    cross(X, Y),
    \+unsafe(state(Y, loup, Y, chou)).

move(state(X, loup, chevre, X), state(Y, loup, chevre, Y)) :-
    cross(X, Y),
    \+unsafe(state(Y, loup, chevre, Y)).

move(state(X, loup, chevre, chou), state(Y, loup, chevre, chou)) :-
    cross(X, Y),
    \+unsafe(state(Y, loup, chevre, chou)).

% Verifie si l'etat est different
not_seen(State, Log) :-
    \+member(State, Log).

% trouve le chemfin vers l'etat final est le parcour a l'envers pour l'afficher
path(State, State, Log) :-
    reverse(Log, RLog),
    maplist(term_to_atom, RLog, LogAtoms),
    atomic_list_concat(LogAtoms, ' -> ', Solution),
    length(Log, Length),
    format("Solution of length ~d: ~q\n", [Length, Solution]).

% trouve le chemin du prochain coup en recursif pour trouver le chemin final
path(Current, Goal, Log) :-
    move(Current, Next),
    not_seen(Next, Log),
    path(Next, Goal, [Next | Log]).

% solution
solution :-
    state_initial(Start),
    state_final(Goal),
    path(Start, Goal, [Start]).

