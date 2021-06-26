function [L,U] = LU_factorization(A)

%first perform gaussian elimination to find U, keeping track of row
%reductions, and excluding b 

%% LU Initializations
%populate L to be a matrix the size of A
L = zeros(size(A));

%Initialize an array of coefficients to store coefficients of row reduction
%process
coefficients = [];


%% GE Step 1
%grab the size of the matrix and save it 
N = size(A, 1);


%% GE step 2
%first ensure the first element A1,1 isn't zero 
if A(1,1) == 0
    
    %iterate until we find a non zero first column element
    for i = 2 : N
        
        %check equivalence to zero
        if A(i, 1) ~= 0
            
            %break, as i now contains the index we desire
            break;
            
        end
        
    end
    
    %now swap row 1 with row i, containing the first nonzero A1,i
    
    %save first row to a temporary variable
    temp = A(1, :);
    
    A(1, :) = A(i, :);
    A(i, :) = temp;

    
end
    
%perform first set of row reductions
for j = 2 : N 
    
    %display coefficient for row reduction
    %disp((A(j, 1) / A(1, 1)));
    
    %store the coefficient of the current row reduction
    coefficients = [coefficients, (A(j, 1) / A(1, 1))];
    
    %row reducee  
    A(j, :) = A(j, :) - (A(j, 1) / A(1, 1)) * A(1, :);
    
end

%% Step 3

%row reduce the remaining rows
for i = 2 : N
    
    %check entry Ai,i to ensure it isnt zero
    if A(i, i) == 0 && i ~= N
        
        %if it is zero replace row i with i + 1
        temp = A(i, :);  
        A(i, :) = A(i + 1, :);
        A(i + 1, :) = temp;
        
    end
    
    %row reduce below i 
    for j = i + 1 : N
        
        %display coefficient for row reduction
        %disp(A(j, i) / A(i, i));
        
        %store the coefficient of the current row reduction
        coefficients = [coefficients, A(j, i) / A(i, i)];
        
        %reduce
        A(j, :) = A(j, :) - (A(j, i) / A(i, i)) * A(i, :); 
        
        
        
    end
    
end

%% LU Factorization - Calculation of L and U

%set U to be the upper triangular of A
U = A;

%a variable to track which coefficient we are currently on
coeffNum = 1;

%now using the coefficents of the row reductions produce L
for i = 1 : N
    
    %set the diagonal equal to 1
    L(i,i) = 1;
    
    for j = i + 1 : N
        
        %set the current index of L to the corresponding coefficient
        if coeffNum <= length(coefficients)
            %if we still have coefficients add them
            L(j, i) = coefficients(coeffNum);
            coeffNum = coeffNum + 1;
        else
            %otherwise add zero
            L(j, i) = 0;
        end
        
    end
    
end

%check to see if L*U = A
%disp(L*U);


end
