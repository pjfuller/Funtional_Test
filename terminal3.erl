-module(terminal3).
-export([mult/1, maximum/1, member/2, greater/2, greater_f/2,reverse/1,index/2, indexHelp/3,build/2,merge/2,mergeSort/2,mergeHelp/3,mergeHelp2/1,mergeSort2/1]).


%MULTIPLIES TOGETHER THE NUMBERS IN A LIST (AND RETURNS 1 IN THE CASE OF AN EMPTY LIST)
mult([]) -> 1;
mult([X|Xs]) -> X*mult(Xs).

%GIVE THE MAXIMUM OF THE NUMBERS (AND 0 IN THE CASE OF AN EMPTY LIST)
maximum([]) -> 0;
maximum([X]) -> X;
maximum([X|Xs]) -> max(X, maximum(Xs)).

%FINDS OUT WHETHER A GIVEN NUMBER APPEARS IN A LIST
member(_,[]) -> false;
member(Y,[X|_]) when Y==X-> true;
member(Y, [_|Xs]) -> member(Y,Xs).

%GIVEN A NUMBER N IN THE FIRST ARGUMENT, SELECT ONLY NUMBERS GREATER THAN N IN THE LIST
greater(_,[]) -> [];
greater(Y, [X|Xs]) when X>Y -> [X|greater(Y,Xs)];
greater(Y, [_|Xs]) -> greater(Y,Xs).

%GIVEN A NUMBER N IN THE FIRST ARGUMENT, SELECT THE FIRST NUMBER GREATER THAN N IN THE LIST
greater_f(_,[]) -> [];
greater_f(Y, [X|_]) when X>Y -> X;
greater_f(Y, [_|Xs]) -> greater_f(Y,Xs).

%REVERESES A LIST OF NUMBERS
reverse([])->[];
reverse([X|Xs])->reverse(Xs)++[X].

%JOINING TWO LISTS TOGETHER - COMPLETE THE DEFINITION OF A FUNCTION ++ THAT JOINS TOGETHER TWO LISTS
%append([],Ys) -> Ys;
%append([X|Xs], Ys) -> append([Xs|Ys]).

%INDEXING INTO A LIST
index(_,[]) -> false;
index(Y,[X|Xs]) when length([X|Xs])<Y -> false;
index(Y,[X|Xs]) -> indexHelp(Y,[X|Xs],0).

indexHelp(_,[],_)->false;
indexHelp(Y,[X|_],C) when Y==C->X;
indexHelp(Y,[_|Xs],C) ->indexHelp(Y,Xs,C+1). 

%BUILDING LISTS
build(X,Y) when X>Y -> [];
build(X,Y) -> [X]++build(X+1,Y).

%MERGING ORDERED LISTS
merge([X|Xs],[Y|Ys]) when X<Y-> [X|merge(Xs,[Y|Ys])];
merge([X|Xs],[Y|Ys]) when Y<X -> [Y|merge([X|Xs],Ys)];
%Y instead of [Y|Ys] and return Y instead of [Y|Ys]
merge([],[Y|Ys])-> [Y|Ys];
merge([X|Xs],[])-> [X|Xs];
merge([],[])->[];
merge([X|Xs],[Y|Ys]) -> [X|[Y|merge(Xs,Ys)]].

%SORTING LISTS
mergeSort2([X|Xs])->mergeHelp2(lists:split(2,[X|Xs])).

mergeHelp2({[X|Xs],[Y|Ys]})->merge(lists:sort([X|Xs]),lists:sort([Y|Ys])).






mergeSort(Y,[X|Xs])->mergeHelp(Y,Xs,[X]).

mergeHelp(_,[],[C|Cs])->[C|Cs];
mergeHelp(Y,[X|Xs],[C|Cs]) when length([C|Cs])<Y->mergeHelp(Y,Xs,[C|Cs]++[X]);
mergeHelp(_,[X|Xs],[C|Cs])-> merge(lists:sort([C|Cs]),lists:sort([X|Xs])).

