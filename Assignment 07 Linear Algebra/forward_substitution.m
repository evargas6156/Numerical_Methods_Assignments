function y = forward_substitution(L,b)

%a function to perform forward substitution on a lower triangular matrix

%grab the size of the matrix
N = size(L,1);

%initialize y
y = zeros(length(b), 1);

%initialize y(1)
y(1) = b(1);

%iterate from 2 to n
for i = 2 : N
    
    %calculate the product Li,j * yj from 1 to i - 1
    product = 0;
    for j = 1 : i - 1
        
        %calculate the current product and add it 
        product = product + (L(i,j) * y(j));
        
    end
    
    %calculate the current y
    y(i) = b(i) - product;
    
end

end