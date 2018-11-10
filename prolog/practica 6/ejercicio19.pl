sumatoria([], 0).
sumatoria([E|Ls], X) :- sumatoria(Ls, Y), X is E + Y. 

corteMasParejo(L,L1,L2) :- append(L1, L2, L),  diff(L1, L2, Diff), not(hayDifMenor(L, Diff)).

diff(L1, L2, Diff) :- sumatoria(L1, S1), sumatoria(L2, S2), R is S1 - S2, abs(R, Diff).

hayDifMenor(L, Diff1) :- append(L1, L2, L),  diff(L1, L2, Diff2), Diff2 < Diff1.