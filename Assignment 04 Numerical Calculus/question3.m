%% Question 3

%function to be used in evil math experiments 
f = @(x) ( (x.^2 - 3 * x + 2) * atan(x) );
x = 0;

%vector of n values to be tested
n =  [1, 3, 6];

%vector of h values to be tested
h = 10 .^ (-1 .* n);

%store the approximation for each
FD1 = ( f(x + h(1)) - f(x) ) / h(1);
FD3 = ( f(x + h(2)) - f(x) ) / h(2);
FD6 = ( f(x + h(3)) - f(x) ) / h(3);
CD31 = (1 / (2 * h(1))) * ( f(x + h(1)) - f(x - h(1)) );
CD33 = (1 / (2 * h(2))) * ( f(x + h(2)) - f(x - h(2)) );
CD36 = (1 / (2 * h(3))) * ( f(x + h(3)) - f(x - h(3)) );
CD51 = (1 / (12 * h(1))) * ( f(x - 2* h(1)) - 8 * f(x - h(1)) + 8 *  f(x + h(1)) - f(x + 2* h(1)) );
CD53 = (1 / (12 * h(2))) * ( f(x - 2* h(2)) - 8 * f(x - h(2)) + 8 *  f(x + h(2)) - f(x + 2* h(2)) );
CD56 = (1 / (12 * h(3))) * ( f(x - 2* h(3)) - 8 * f(x - h(3)) + 8 *  f(x + h(3)) - f(x + 2* h(3)) );

%store the absoute error for each as a vector 
FD = zeros(size(h));
CD3 = zeros(size(h));
CD5 = zeros(size(h));

%calculate the absolute errors given the real derivative at x = 0 is 2
FD(1) = abs(FD1 - 2);
FD(2) = abs(FD3 - 2);
FD(3) = abs(FD6 - 2);
CD3(1) = abs(CD31 - 2);
CD3(2) = abs(CD33 - 2);
CD3(3) = abs(CD36 - 2);
CD5(1) = abs(CD51 - 2);
CD5(2) = abs(CD53 - 2);
CD5(3) = abs(CD56 - 2);

%create a plot for the errors vs h value 
loglog(h, FD);
hold on;
loglog(h, CD3);
loglog(h, CD5);
title('Absolute Error of Different Drivative Approximations');
legend('Forward Diff', '3 Point Mid', '5 Point Mid', 'location', 'best');
ylabel('Abs. Error');
xlabel('H value');