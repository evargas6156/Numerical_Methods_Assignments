
%% Question 5
% Emmanuel Vargas

%create A and b to be solved in part a and b
A = [1,1,2,-5;
    2,5,-1,-9;
    2,1,-1,3;
    1,3,2,7;];
b = [3;-3;-11;-5;];

%% 5 A) solve via LU Factorization
disp('Question 5 A)')
disp('First we will perform LU Factorization to find L and U...')
%first run the LU Factorization function to get the upper triangular
%and lower triangular
[L, U] = LU_factorization(A);

%display both U and L
disp('After Factorization: ')
disp('We have obtained the upper triangular: ')
disp(U);
disp('We have obtained the lower triangular: ')
disp(L);

%now we have to perform forward substitution to solve Ly = b;
disp('Now run forward substitution to find y by solving Ly = b...');

%find y 
y = forward_substitution(L,b);

disp('After running forward substitution we found y: ');
disp(y);

%now we have to perform backward substitution to solve Ux=y
disp('Now run forward substitution to find x by solving Ux = y...')

%find x 
x = backward_substitution(U,y);

disp('After running backward substitution we have our final answer x:')
disp(x);


%% 5 B) solve via Gaussian Elimination
disp('Question 5 B)')
disp('First we will perform Gaussian Elimination to find U and F...')
%first run the gaussian elimination function to get the upper triangular
%and f, the updated b vector
[U, f] = gaussian_elimination(A,b);

%display both U and f
disp('After elimination: ')
disp('We have obtained the upper triangular: ')
disp(U);
disp('We have obtained F, the updated b vector: ')
disp(f);

%now we have to perform back substitution to find x
disp('Now run back substitution to find x...');

%find x 
x = backward_substitution(U,f);

disp('After running back substitution we found x: ');
disp(x);