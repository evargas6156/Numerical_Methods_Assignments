function fp = derivative_3point(f,x)
    %function that computes f'(x) using 3-point derivative rule
    %INPUTS: 
    %function f
    %vector over which to estimate derivative, x
    %OUTPUT: 
    %fp the numerical approximation of f' evaluated at x
    
    %initialize fp, find h, N
    fp = zeros(size(x));
    N = length(x);
    h = ( x(N) - x(1) ) / (N - 1);

    % loop to find fp
    for i = 1 : N
        
        if i == 1 
            %then we are at the ends, use endpoint formula
            fp(i) = (1 / (2 * h) ) * ( -3 * f(x(i)) + 4 * f(x(i) + h) - f(x(i) + (2 * h) ) ); 
            
        elseif i == N
            %then we are at the ends, use endpoint formula
            fp(i) = (1 / (2 * h) ) * ( f(x(i) - (2 * h)) - 4 * f(x(i) - h) + 3 * f(x(i)) ); 
        else
            %otherwise we will use the midpoint formula
            fp(i) = (1 / (2 * h) ) * ( f(x(i) + h) - f(x(i) - h) );
        end
    end
end