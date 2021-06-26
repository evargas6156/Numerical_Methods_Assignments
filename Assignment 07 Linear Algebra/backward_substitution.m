function x = backward_substitution(U,f)
% backward substitution for an upper triangular matrix

%grab the size of the matrix
N = size(U,1);

%initialize x
x = zeros(length(f), 1);

%initialize x(N)
x(N) = f(N) / U(N,N);

%iterate from N-1 down to 1
for i = N - 1 : -1 : 1
    
    %calculate the product of Ai,j * xj from i + 1 to N
    product = 0;
    for j = i + 1 : N
        %add current product to the total product
        product = product + (U(i,j) *  x(j));
        
    end
    
    %calculate the current x
    x(i) = (f(i) - product) / U(i,i);
 
end
