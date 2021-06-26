function norm = myvectornorm(x)
% calculate the norm

%fins the number of elements in the array
numElements = length(x);

%initialize a variable to store the sum of the squared elements
sumSquare = 0;

%find the sum of the squared elements
for i = 1:numElements
    sumSquare = sumSquare + x(i)^2;
end

%take the squared root of the sum of the squared elements and return
norm = sqrt(sumSquare);

end