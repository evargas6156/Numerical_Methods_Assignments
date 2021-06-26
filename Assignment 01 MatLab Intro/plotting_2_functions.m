% We will plot simple function

% Define a function 
f = @(x) sqrt(x); %FILL IN FUNCTIOn;
g = @(x) x.^2; %FILL IN FUNCTION;
% Define an x interval (On MATLAB the interval is defined as [starting point : increment : ending point]

x = 0:0.1:7;

% Find y values
y1 = f(x);
y2 = g(x);

% Plot function 
plot(x,y1,'r',x,y2,'b','LineWidth',2) 

% Label axes
xlabel('x')
ylabel('y')
