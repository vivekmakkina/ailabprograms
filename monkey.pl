% Initial state: monkey is at the door, box is in the middle of the room, banana is hanging from the ceiling.
at(monkey, door).
at(box, middle).
at(banana, ceiling).

% Monkey can walk.
walk(X) :-
    at(monkey, X),
    write('Monkey walks to '), write(X), nl,
    retract(at(monkey, door)),
    assert(at(monkey, X)).

% Monkey can climb the box.
climb :-
    at(monkey, middle),
    at(box, middle),
    write('Monkey climbs the box.'), nl,
    retract(at(monkey, middle)),
    assert(at(monkey, box)).

% Monkey can push the box.
push(X) :-
    at(monkey, X),
    at(box, X),
    write('Monkey pushes the box from '), write(X), nl,
    retract(at(box, X)),
    assert(at(box, Y)),
    retract(at(monkey, X)),
    assert(at(monkey, Y)).

% Monkey can grasp the banana if it is on the box.
grasp :-
    at(monkey, box),
    at(banana, box),
    write('Monkey grasps the banana!'), nl.

% Rules to solve the problem
solve :-
    walk(middle),
    push(middle),
    climb,
    grasp.

