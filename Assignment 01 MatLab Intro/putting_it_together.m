% Define the data x and dat y
datax = rand(20,1);
datay = rand(20,1);


% Define f, x and evaluate y=f(x)
f = @(x) x;
x = min(datax):.01:max(datax);
y = f(x);


% Create plot
sz = 140;
scatter(datax, datay, sz, 'filled');
hold on;
plot(x,y,'linewidth',4);
hold off
xlabel('x')
ylabel('y')
legend({'data','y = x'},'Location','best')