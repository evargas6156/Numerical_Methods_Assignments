% We will do scatter plot and a function

% Data given
datx = [-3, -2, 0, 5, 9, 11];
daty = [4, -10, 7, 1, -5, 2];

% Define a function 
f = @(x) x;

% Define an x interval (On MATLAB the interval is defined as [starting point : increment : ending point]
x = [min(datx):0.1:max(datx)];

% Find y values
y = f(x);

% Plot function
sz = 140;
scatter(datx,daty,sz,'filled')
hold on
plot(x,y,'LineWidth',4) 
set(gca,'FontSize',20)
hold off

% Label axes
xlabel('x')
ylabel('y')