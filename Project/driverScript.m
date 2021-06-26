% A script to run the adaptive quadrature method using trapezoid rule


%% Create the function and interval we will be integrating
tol = .0001;  %as a decimal NOT percent 

%Comment out one set of a,b,f,trueAnswer to run that integral and compare
%approximations to true solutions 

%This is the example from professor Lambers lecture
%a = 0; 
%b = pi / 4;
%f=@(x)(exp(3 * x) * sin(2 * x));
%trueAnswer = 2.58862863250716; % this is only used to calculate official relative error 

%f=@(x)(exp(x));
%a=0;
%b=4;
%trueAnswer = 53.59815; % this is only used to calculate official relative error 

%f=@(x)((3 * x.^2 - x) / (x - 5));
%a = -20;
%b = 4;
%trueAnswer = -465.32130; 

%This is the example described in our textbook chapter.
tol = 10^-3;
f=@(x)(x.^2 * sin(x));
a = 0;
b = pi/4;
trueAnswer = 0.08875; 


%% Integrate using adaptive quadrature 
I = adaptive_quadrature_simpsons(f, a, b, tol);
fprintf('Computing the integral of f from %f to %f with a tolerance of %f....\n', a, b, tol);


%% Print out results and compare to true solution
if ~isempty(I)
    %display result
    fprintf('The approximation made by adaptive quadrature is: %f.\n', I);
    relativeError = (abs(trueAnswer - I) / trueAnswer) * 100;
    relativeError = abs(relativeError);
    disp(' ');
    fprintf('When comparing to the true answer we had a relative error of %f percent.\n', relativeError);
    fprintf('Our tolerance was set to %f percent.\n', tol * 100);
    
else
    
    %display error, as the adaptive function returned the empty vector
    disp('Could not compute the approximation within a reasonable time.');
    
end