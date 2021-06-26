function [c,n,err] = Newtons_method(f,fp,x0,N,tol)
%function that computes one root of f over [a,b] using bisection method
%INPUTS:
%function f
%derivative of f, fp
%bounds of interval [a,b]
%x0 initial guess
%N maximum number of iterations
%tol error tolerence
%OUTPUS:
% c the root
% n the number of iterations made
% err the error

%initialize err to infinity and iterations to 0
n = 0;
err = Inf;

%iterate until conditions are met
while n < N && err > tol
    
   %generate the current point 
   c = x0 - (f(x0) / fp(x0)); 
   
   %upsate the error
   err = abs(c - x0);
   
   %set the current point to be the previous point
   x0 = c;
   
   %increment iterations
   n = n + 1;
end


end