function y = for_sequence(n)
% sequence is a function that takes in as input n and outputs the nth term of
% the sequence given by
%                 an+1=1/2*(an^2-n^2)
% with a_0=1
% using a for loop.

%a variable to save an-1
prev_a = 1;

%a variable to set an
curr_a = 1;

for i = 2:n
    %take the current n and save it to be the previous one
    prev_a = curr_a;
    %use previous value to calculate current value using the sequence
    curr_a = (prev_a^2 - (i - 1)^2) / 2;
    
end

y = curr_a;

end