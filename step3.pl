% Définition de l'état initial
state_initial(state(e, e, e, e)). % Tous les éléments sont initialement sur la rive est
% Définition de l'état final
state_final(state(w, w, w, w)). % Tous les éléments sont finalement sur la rive ouest

% Loup mange mouton
unsafe(state(e, w, w, _)).
unsafe(state(w, e, e, _)).

% Mouton mange chou
unsafe(state(e, _, w, w)).
unsafe(state(w, _, e, e)).

% cross Sides
cross(w, e).
cross(e, w).

% Valid Moves
move(state(X, X, Chevre, Chou), state(Y, Y, Chevre, Chou)) :-
    cross(X, Y),
    \+unsafe(state(Y, Y, Chevre, Chou)).

move(state(X, Loup, X, Chou), state(Y, Loup, Y, Chou)) :-
    cross(X, Y),
    \+unsafe(state(Y, Loup, Y, Chou)).

move(state(X, Loup, Chevre, X), state(Y, Loup, Chevre, Y)) :-
    cross(X, Y),
    \+unsafe(state(Y, Loup, Chevre, Y)).

move(state(X, Loup, Chevre, Chou), state(Y, Loup, Chevre, Chou)) :-
    cross(X, Y),
    \+unsafe(state(Y, Loup, Chevre, Chou)).

% Regarde si l'etat a deja ete vu
not_seen(State, Log) :-
    \+member(State, Log).

% regarde le dernier chemin et imprime les logs en reverse
path(State, State, Log) :-
    reverse(Log, RLog),
    maplist(term_to_atom, RLog, LogAtoms),
    atomic_list_concat(LogAtoms, ' -> ', Solution),
    length(Log, Length),
    format("Solution of length ~d: ~q\n", [Length, Solution]).

% trouve le chemin de mainere recursive en regardant si le coup a deja ete fait
path(Current, Goal, Log) :-
    move(Current, Next),
    not_seen(Next, Log),
    path(Next, Goal, [Next | Log]).

% Objective
solution :-
    state_initial(Start),
    state_final(Goal),
    path(Start, Goal, [Start]).

