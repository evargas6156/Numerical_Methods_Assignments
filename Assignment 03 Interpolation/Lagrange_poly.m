function [y,L] = Lagrange_poly(x,datx,daty)
    %function that computes the Lagrange interpolant of f over [a,b] 
    %INPUTS: 
    % (datx, daty) is set of points from which we create the interpolant
    % x is the set of point to interpolate on
    % OUTPUT: y the Lagrange interpolant and L the lagrange polynomials

    N = length(datx);
    L = ones(length(x), N); % specify the initialization
    y = zeros(length(x), 1); % specify how y should be initialized
    
    %creation of Lagrange polynomial
    for k = 1 : N
        for i = 1 : N
            if i == k
                %L(k) = L(skip);
            else
                L(:,k) = L(:,k) .* ( (x(:) - datx(i)) ./ (datx(k) - datx(i) ) );
            end
        end 
    end 
    
    %creation of the interpolant
    for k = 1 : N
        y = y + daty(k) .* L(:, k); 
    end
    
    
end