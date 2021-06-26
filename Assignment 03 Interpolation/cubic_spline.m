% define the data points
datx= [0, 0.5, 2, 4];
daty= [1, exp(0.5), exp(2), exp(4)];

% obtain coefficients for cubic spline
[a,b,c,d]= cubic_spline_coefs(datx, daty);

% find the length of the data points
N = length(datx);

% now create the cubic spline interpolation
spline = [daty(1)]; %start with the first data point to interpolate

%vector with numbers to interpolate over
x= [0:0.01:4];

for j = 1 : N - 1
   % find the x values between datx[j] and datx[j + 1] 
   lower = datx(j);
   upper = datx(j + 1);
   xBetween = [];
   for i = 1 : length(x)
        %grab current x 
        currX = x(i);
        %if it falls between upper and lower append to xBetween
        if currX < upper && currX > lower
            xBetween = [xBetween, currX];
        end
   end
   
   % create the current spline term using xBetween
   splineAddition = a(j) + (b(j) .* (xBetween - datx(j))) + (c(j) .* (xBetween - datx(j)).^2) + (d(j) .* (xBetween - datx(j)).^3);
   
   % add it to the spline as well as the real data point daty[j + 1]
   spline = [spline, splineAddition, daty(j + 1)];
end

disp(size(x))
disp(size(spline))
plot(datx, daty, 'red', x, spline, 'blue');


