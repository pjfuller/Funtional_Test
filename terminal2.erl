-module(terminal2).
-export([maxThree/3, howManyEqual/3,perimeter/1,fib/1,fib2/1,sum_to/1, sum_range/2, addFractions/2, multiplyFractions/2, isFirstBigger/2, pieces/1]).

%MAX OF THREE, REGULAR AND USING BUILT IN MAX FUNCTION
%maxThree(X,Y,Z) -> 
%    if 
%        X>Y andalso X>Z-> X;
%        Y>X andalso Y>Z-> Y;
%        true -> Z
%end.

maxThree(X,Y,Z) ->
    max(X,max(Y,Z)).


%HOW MANY EQUAL
howManyEqual(A,A,A) ->
    3;
howManyEqual(A,A,_) ->
    2;
howManyEqual(A,_,A) ->
    2;
howManyEqual(_,A,A) ->
    2;
howManyEqual(_,_,_) ->
    0.

%DEFINING SHAPES
perimeter({circle, {X,Y}, R}) ->
 math:pi()*2*R;
perimeter({rectangle, {X,Y}, H, W}) ->
 2*(H+W). 
%FOR A TRIANGLE WE WOULD NEED THE LENGTH OF THE 3 SIDES AND THE HEIGHT OF THE TRIANGLE TO COMPUTER AREA AND PERIMETER


%todo area as well


%FIBONACCI FUNCTION
%todo only use one side, dont compute both separate 
fib2(X) ->
    io:format("{~p,~p}\n",[fib(X),fib((X+1))]).

fib(X) when X==0 ->
    0;
fib(X) when X <2 ->
    1;
fib(X) when X >= 2 ->
    fib(X-1) + fib(X-2).


%SUM OF RANGE
sum_to(N) when N==1 ->
    1;
sum_to(N) when N>=2 ->
    sum_to(N-1)+N.


sum_range(M,N) when M>N ->
    0;
sum_range(M,N) when M=/=N ->
    sum_range(M+1,N)+M;
sum_range(M,_) ->
    M.


%todo fix 
%HOW MANY PIECES
pieces(N) when N>2 ->
    (N*N)-1;
pieces(N) ->
    (N*N).


%FRACTIONS
%reduce function
addFractions({X,Y},{A,B}) when Y==B ->
    {(X+A),B};
addFractions({X,Y},{A,B}) when Y>B ->
    if 
        (Y rem B) == 0 -> addFractions({X,Y},{(A*(Y/B)),Y})
end;
addFractions({X,Y},{A,B}) when Y<B ->
    if 
        (B rem Y) == 0 -> addFractions({(B/Y)*X,B},{A,B})
end.




multiplyFractions({X,Y},{A,B}) ->
    {(X*A),(Y*B)}.




isFirstBigger({X,Y},{A,B}) when Y == B ->
    if
        X<A -> false;
        X>A -> true;
        X==A -> 'same'
    end;

isFirstBigger({X,Y},{A,B}) when Y>B ->
    if 
        (Y rem B) == 0 -> isFirstBigger({X,Y},{(A*(Y/B)),Y})
        %else -> isFirstBigger({X,Y},{A,(B*2)})
    end;

isFirstBigger({X,Y},{A,B}) when Y<B ->
    if 
            (Y rem B) == 0 -> isFirstBigger({X,Y},{(A*(Y/B)),Y})
            %else -> isFirstBigger({X,(Y*2)},{A,B})
    end.
