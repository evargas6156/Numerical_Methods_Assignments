% We will plot simple function

% Define a function 
f = @(x) x.^2+ cos(x);%FILL THIS IN WITH THE FUNTION;

% Define an x interval (On MATLAB the interval is defined as [starting point : increment : ending point]
x = -pi:0.1:3*pi; % FILL IN A,B,C based on information above

% Evaluate f at the x values defined above 
y = f(x);

% Plot function 
plot(x,y) 

% Label axes
xlabel('x')
ylabel('y')