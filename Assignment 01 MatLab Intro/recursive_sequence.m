function y = recursive_sequence(n)
% for_sequence is a function that takes in as input n and outputs the nth term of
% the sequence given by
%                 an+1=1/2*(an^2-n^2)
% with a_0=1 using recursion.
%base case, when n is 1 y must be one
if n == 1
    y = 1;
else
   %otherwise calcuate the appropriate y recursively
    y = ( (recursive_sequence(n - 1))^2 - (n - 1)^2 ) / 2;
end

end
