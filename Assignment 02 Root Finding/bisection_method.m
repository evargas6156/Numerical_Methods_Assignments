function [c,n,err] = bisection_method(f,a,b,tol,N)
%function to solve the root-finding problem f(x) = 0 over [a,b] using bisection
% INPUTS:
% f function at hand
% a,b bounds of the interval
% tol: error tolerance
% N: maximum number of iterations
% Condition: f(a) and f(b) have different signs, f is continuous on 
% the interval [a,b]
%OUTPUS:
% c the root
% n the number of iterations made
% err the error

%initialize error to infinity, n to 1
err = Inf;
n = 0;

%check for conditions, if met proceed, otherwise return failure
if ((f(a) < 0 && f(b) > 0) || (f(a) > 0 && f(b) < 0))
    %iterate until conditions satisfied
    while (err > tol && n < N)
        %find the midpoint
        c = (a + b)/2;
        %update the error
        err = (b - a)/ 2;
        %update iterations
        n = n + 1;
        %check how to appropriately update the interval
        if (f(c) < 0 && f(b) < 0) || (f(c) > 0 && f(b) > 0)
            b = c;
        else
            a = c;
        end
    end
else
    %as failure return these conditions
    c = [];
    err = Inf;
    n = 0;
end

end