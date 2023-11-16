hanoi(1, From, To, _) :-
    write('Move disk 1 from '), write(From), write(' to '), writeln(To).

hanoi(N, From, To, Via) :-
    N > 1,
    M is N - 1,
    hanoi(M, From, Via, To),
    write('Move disk '), write(N), write(' from '), write(From), write(' to '), writeln(To),
    hanoi(M, Via, To, From).

% Predicate to initiate the Towers of Hanoi and display each move
towers_of_hanoi(N) :-
    hanoi(N, 'A', 'C', 'B').

% Example usage: towers_of_hanoi(3).
