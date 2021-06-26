function [y,F] = Newtons_divided_differences(x,datx,daty)
    %function that computes the Lagrange interpolant of f over [a,b] 
    % using Newton's divided differences 
    %INPUTS: 
    % (datx, daty) is set of points from which we create the interpolant
    % x is the set of point to interpolate on
    % OUTPUT: 
    % y the interpolating polynomial 
    % F the divided difference table

    N = length(datx);
    F = NaN*ones(N,N);
    F(:,1) = daty; % first column is the solutions y. 
    
    %creation of divided differences table
    for j = 2 : N
        for i = 1  : N - j + 1
            F(i,j) = ( F(i + 1, j - 1) - F(i, j - 1) ) / ( datx(i + j - 1) - datx(i) );
        end
    end
    
    % a variable to store the polynomial
    G = ones(length(x), N);
    
    % creation of polynomial
    for k = 2 : N
        for j = 1 : k - 1
            G(:, k) = G(:, k) .* ( x - datx(j) );
        end
    end
    
    %a variable to hold the ouput of the poly evaluated at x
    y = zeros(length(x), 1);
    
    % evaluate polynomial 
    for k = 1 : N
        y = y + G(:, k) * F(1, k);
    end
        

end