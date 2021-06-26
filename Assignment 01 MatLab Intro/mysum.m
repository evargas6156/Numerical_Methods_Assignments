function y = mysum(n)
% MYSUM is a function that takes in as input n and returns the value y which is
% equivalent to the sum of the integers from 1 to n.

%initialize output
y = 0;

%if input is negative print error and return -1
if n < 0
    disp('cannot input a negative number')
    y = -1;
%otherwise calculate the sum and update return
else
    for i = 1:n
        y = y + i;
    end
end


end