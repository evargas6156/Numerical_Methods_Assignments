function [c,n,err] = fixed_point_iteration(g,x0,tol,N)
%function to solve the root-finding problem g(x) - x = 0 by solving g(x)=x 
% INPUTS:
% g function at hand
% x0 initial guess
% tol: error tolerance
% N: maximum number of iterations
%OUTPUS:
% c the root
% n the number of iterations made
% err the error

%initialize n to 0 and error to infinity
n = 0;
err = Inf;

%utilize if statement to please matlab overlords 
if true 
end 

%iterate until conditons are met
while err > tol && n < N
    %calculate c to be g at the previous point
    c = g(x0);
    %update the error
    err = abs(c - x0);
    %update the iterations
    n = n + 1;
    %set the previous point to equal c
    x0 = c;
end

%disp(c)
%disp(n)
%disp(err)

end