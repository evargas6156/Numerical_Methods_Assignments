function [a,b,c,d] = cubic_spline_coefs(datx,daty)
    %function that computes the natural cubic spline coefficients
    % of a function given its value at some points
    %INPUTS:
    %datx is the initial set of points: x_0, x_1,..., x_n
    %daty is the initial set of point f(x_0), f(x_1),...,f(x_n)
    %OUTPUTS:
    %a,b,c,d are the cubic spline coefficients 
    n = length(datx);
    a = zeros(n,1);
    b = zeros(n,1);
    c = zeros(n,1);
    d = zeros(n,1);

    h = zeros(n,1);
    alpha = zeros(n,1);
    l = zeros(n+1,1);
    m = zeros(n+1,1);
    z = zeros(n+1,1);
    
    for j = 1: n
        % Set a_j = f(x_j)
        a(j) = daty(j);
    end
    for j = 1: n-1
        % Set h_j = x_{j+1} - x_j
        h(j)=datx(j+1)-datx(j);
    end
    
    for j = 2: n-1
        alpha(j) = (3/h(j))* (a(j+1) -a(j)) - (3/h(j-1))* (a(j) -a(j-1));
    end
    for j = 2:n-1
        l(j) = 2*(datx(j+1) - datx(j-1)) - h(j-1)*m(j-1);        % Set b_j using a_j+1, a_j, c_j+1, c_j, h_j
        m(j) = h(j)/l(j);
        z(j) = (alpha(j) - h(j-1)*z(j-1))/l(j);
    end
    %Update the values of b_j, c_j, d_j 
    for j=1:n-1
        i = n-j;
        c(i) = z(i) - m(i)*c(i+1);
        b(i) = (a(i+1)-a(i))/h(i)-h(i)*(c(i+1)+2*c(i))/3;
        d(i) = (c(i+1)-c(i))/(3*h(i));
    end
    
end %end function