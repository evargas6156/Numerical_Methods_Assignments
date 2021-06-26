function y = myabsolutevalue(a)
% myabsolutevalue is a function that takes a number as input and returns
% the absolute value of that number

%if the number is greater than or equal to 0 simply return
if a >= 0
    y = a;
else 
    %otherwise multiply by -1 to change the sign
    y = a * -1;
end

end