function [U,f] = gaussian_elimination(A,b)

% performs gaussian elimination on the augmented matrix [A,b], returning
% the upper-triangular matrix U (from A) and the updated vector f (from b)

%this file assumes that a square matrix is being passed

%% Step 1
%grab the size of the matrix and save it 
N = size(A, 1);

%augment b with A by adding b as an extra column 
%this will make it easy to change b as we update 
%A, the same operations will be made on the same rows
Ab = [A, b];


%% step 2
%first ensure the first element A1,1 isn't zero 
if Ab(1,1) == 0
    
    %iterate until we find a non zero first column element
    for i = 2 : N
        
        %check equivalence to zero
        if Ab(i, 1) ~= 0
            
            %break, as i now contains the index we desire
            break;
            
        end
        
    end
    
    %now swap row 1 with row i, containing the first nonzero A1,i
    
    %save first row to a temporary variable
    temp = Ab(1, :);
    
    Ab(1, :) = Ab(i, :);
    Ab(i, :) = temp;

    
end
    
%perform first set of row reductions
for j = 2 : N 
    
    %row reducee  
    Ab(j, :) = Ab(j, :) - (Ab(j, 1) / Ab(1, 1)) * Ab(1, :);
    
end

%% Step 3

%row reduce the remaining rows
for i = 2 : N
    
    %check entry Ai,i to ensure it isnt zero
    if Ab(i, i) == 0 && i ~= N
        
        %if it is zero replace row i with i + 1
        temp = Ab(i, :);  
        Ab(i, :) = Ab(i + 1, :);
        Ab(i + 1, :) = temp;
        
    end
    
    %row reduce below i 
    for j = i + 1 : N
        
        %reduce
        Ab(j, :) = Ab(j, :) - (Ab(j, i) / Ab(i, i)) * Ab(i, :); 
        
    end
    
end

%set U to be the upper triangular of Ab
U = Ab(:, 1 : N);

%set F to be result b 
f = Ab(:, N + 1);


end
