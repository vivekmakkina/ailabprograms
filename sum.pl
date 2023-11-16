sum_integers(0, 0).

sum_integers(N, Sum) :-
    N > 0,
    Prev is N - 1,
    sum_integers(Prev, PrevSum),
    Sum is N + PrevSum.
